require 'rails_helper'
require 'spec_helper'
require 'support/factory_girl'

describe '#Companies API' do
    describe 'GET /api/v1/companies.json' do
        it 'returns all the companies' do

            create_list(:company, 2)
            get '/api/v1/companies.json', {}, { 'Accept': 'application/json'}
            expect(response.status).to eq(200)

            body = JSON.parse(response.body)
            company_names = body.map { |company| company['name'] }

            expect(company_names).to match_array(['The Nights Watch', 'The Nights Watch'])
        end
    end

    describe 'GET /api/v1/companies.json?page={page_num > 1}' do
        it 'returns nil' do

            get '/api/v1/companies.json?page=5', {}, { 'Accept': 'application/json' }
            expect(response.status).to eq(200)

            body = JSON.parse(response.body)
            companies = body.map { |company| company['meta']['page_number'] }

            expect(companies.first).to match(nil)
        end
    end

    describe 'GET /api/v1/companies/{id}.json' do
        it 'returns {id} of the company' do

            company = create(:company)
            get "/api/v1/companies/#{company.id}.json", {}, { 'Accept': 'application/json' }
            
            expect(response.status).to eq(200)

            body = JSON.parse(response.body)
            expect(body['name']).to match('The Nights Watch')
        end
    end
end