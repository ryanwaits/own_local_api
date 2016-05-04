RSpec.configure do |config|
    config.include FactoryGirl::Syntax::Methods
end

FactoryGirl.define do
  factory :company do
    uuid '543210'
    name 'The Nights Watch'
    address 'The Wall'
    address2 'High'
    city 'Castle Black'
    state 'Kingsroad'
    zip '12345'
    country 'Westeros'
    phone '5128675309'
    website 'www.jonsnowlives.com'
    created_at Time.now
  end
endd