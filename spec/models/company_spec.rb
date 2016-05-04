require 'rails_helper'

describe 'User .valid_id?' do
    it 'returns nil if {id} is invalid' do
        valid_num = '5'
        invalid_num = '-'

        result = Company.valid_id?(invalid_num)

        expect(result).to eq(nil)
    end
end