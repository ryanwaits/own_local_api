RSpec.configure do |config|
    config.include FactoryGirl::Syntax::Methods
end

FactoryGirl.define do
  factory :company do
    uuid '543210'
    name 'The Nights Watch'
    address 'North of the Wall'
    address2 ''
    city 'Castle Black'
    state 'Kingsroad'
    zip '12345'
    country 'Westeros'
    phone '5128675309'
    website 'www.jonsnowlives'
    created_at Time.now
  end
end