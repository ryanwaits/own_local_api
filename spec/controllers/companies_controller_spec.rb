require 'rails_helper'
require 'spec_helper'

Company.destroy_all

describe Api::V1::CompaniesController do
    describe 'GET #index' do
        it 'returns success: response status 200' do

            get :index, format: :json
            expect(response).to be_success
        end

        it 'returns all companies' do

            Company.create([{ uuid: '12345', name: 'Apple', address: '123 Cupertino', address2: '', city: 'Silicon Valley', state: 'CA', zip: '98765', country: 'US', phone: '123-456-7891', website: 'http://www.apple.com', created_at: Time.now},{ uuid: '67891', name: 'Whole Foods', address: '525 North Lamar Blvd', address2: '', city: 'Austin', state: 'TX', zip: '78703', country: 'US', phone: '512-476-1206', website: 'http://www.wholefoodsmarket.com/stores/lamar?s=LMR', created_at: Time.now + 10000}])
            get :index, format: :json

            body = JSON.parse(response.body)
            expect(body.length).to eq(2)
        end
    end
    describe 'GET #show' do
        it 'returns success: response status 200' do

            company = Company.create({uuid: '12345', name: 'Apple', address: '123 Cupertino', address2: '', city: 'Silicon Valley', state: 'CA', zip: '98765', country: 'US', phone: '123-456-7891', website: 'http://www.apple.com', created_at: Time.now})
           
            get :show, id: company.id, format: :json
            expect(response).to be_success
        end

        it 'returns one company' do

            company = Company.create({uuid: '12345', name: 'Apple', address: '123 Cupertino', address2: '', city: 'Silicon Valley', state: 'CA', zip: '98765', country: 'US', phone: '123-456-7891', website: 'http://www.apple.com', created_at: Time.now})

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