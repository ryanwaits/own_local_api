require 'rails_helper'

describe ErrorsController, type: :routing do
    describe '#routing' do
        it 'routes /api/v1/anything to #routing action' do
        expect(get('/api/v1/anything')).to route_to(controller: 'errors', action: 'routing', a: 'api/v1/anything')
        end
    end
end