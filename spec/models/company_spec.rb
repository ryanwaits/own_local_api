require 'rails_helper'

# RSpec.describe Company, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end

describe 'User .valid_id?' do
    it 'returns nil if {id} is invalid' do
        valid_num = '5'
        invalid_num = '-'

        result = Company.valid_id?(invalid_num)

        expect(result).to eq(nil)
    end
end