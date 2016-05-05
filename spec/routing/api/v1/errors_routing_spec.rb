require 'rails_helper'
require 'support/factory_girl'

describe ErrorsController, type: :routing do
    describe '#routing' do
        it 'sets request to params[:a]' do
        expect(get('/api/v1/anything')).to route_to(controller: 'errors', action: 'routing', a: 'api/v1/anything')
        end
    end
end