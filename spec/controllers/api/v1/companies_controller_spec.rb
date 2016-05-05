require 'rails_helper'
require 'spec_helper'
require 'support/factory_girl'

describe Api::V1::CompaniesController do
    describe 'GET #index' do
        it 'returns success: response status 200' do

            get :index, format: :json
            expect(response).to be_success
        end

        it 'returns all companies' do

            create_list(:company, 5)
            get :index, format: :json

            body = JSON.parse(response.body)
            expect(body.length).to eq(5)
        end

        it 'returns 50 companies per page' do
            create_list(:company, 200)
            get :index, params: {page: 2}, format: :json

            body = JSON.parse(response.body)
            expect(body.length).to eq(50)
        end
    end
    describe 'GET #show' do
        it 'returns one company' do

            company = create(:company)
            get :show, id: company.id, format: :json

            body = JSON.parse(response.body)

            expect(response).to be_success
            expect(body['name']).to eq(company.name)

        end

        it 'returns an error if {id} is invalid' do

            invalid_id = 'invalid'
            if Company.valid_id?(invalid_id)
                get :show, id: '-', format: :json
                body = JSON.parse(response.body)
                
                expect(body['error']['message']).to eq('Unable to locate specified {id}')
                expect(body['error']['status']).to eq(400)
            end
        end
    end
end