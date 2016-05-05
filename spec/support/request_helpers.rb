RSpec.configure do |config|
    config.include Requests::JsonHelpers
end

def json
    JSON.parse(response.body)
end