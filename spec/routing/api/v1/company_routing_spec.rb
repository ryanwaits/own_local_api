require 'rails_helper'
require 'support/factory_girl'

describe Api::V1::CompaniesController, type: :routing do
    it 'routes /api/v1/companies.json to #index' do
        expect(get('/api/v1/companies.json')).to route_to(controller: 'api/v1/companies', action: 'index', format: 'json')
    end

    it 'routes /api/v1/companies/1.json to #show' do
        company = create(:company)
        expect(get("/api/v1/companies/#{company.id}.json")).to route_to(controller: 'api/v1/companies', action: 'show', id: company.id.to_s, format: 'json')
    end

end