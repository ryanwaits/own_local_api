require 'rails_helper'
require 'spec_helper'
require 'support/factory_girl.rb'

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
    end
    describe 'GET #show' do
        it 'returns success: response status 200' do

            company = create(:company)
            get :show, id: company.id, format: :json

            expect(response).to be_success
        end

        it 'returns one company' do

            company = create(:company)
            get :show, id: company.id, format: :json
            body = JSON.parse(response.body)

            expect(body).to_not eq(nil)
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