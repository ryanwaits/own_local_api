require 'rails_helper'
require 'spec_helper'

Company.destroy_all
@companies = Company.create([{ uuid: '12345', name: 'Apple', address: '123 Cupertino', address2: '', city: 'Silicon Valley', state: 'CA', zip: '98765', country: 'US', phone: '123-456-7891', website: 'http://www.apple.com', created_at: Time.now},{ uuid: '67891', name: 'Whole Foods', address: '525 North Lamar Blvd', address2: '', city: 'Austin', state: 'TX', zip: '78703', country: 'US', phone: '512-476-1206', website: 'http://www.wholefoodsmarket.com/stores/lamar?s=LMR', created_at: Time.now + 10000}])

describe '#Companies API' do
    describe 'GET /api/v1/companies.json' do
        it 'returns all the companies' do

            get '/api/v1/companies.json', {}, { 'Accept' => 'application/json'}
            expect(response.status).to eq(200)

            body = JSON.parse(response.body)
            company_names = body.map { |company| company['name'] }

            expect(company_names).to match_array(['Apple', 'Whole Foods'])
        end
    end

    describe 'GET /api/v1/companies/{id}.json' do
        it 'returns {id} of the company' do
            company = Company.create({ uuid: '12345', name: 'Apple', address: '123 Cupertino', address2: '', city: 'Silicon Valley', state: 'CA', zip: '98765', country: 'US', phone: '123-456-7891', website: 'http://www.apple.com', created_at: Time.now})
            get "/api/v1/companies/#{company.id}.json", {}, { 'Accept' => 'application/json' }
            expect(response.status).to eq(200)

            body = JSON.parse(response.body)
            expect(body['name']).to match('Apple')
        end
    end 
end