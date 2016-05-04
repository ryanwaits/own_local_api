require 'rails_helper'

describe 'User .valid_id?' do
    it 'returns nil if {id} is invalid' do
        valid_num = '5'
        invalid_num = '-'

        result = Company.valid_id?(invalid_num)

        expect(result).to eq(nil)
    end
end

describe 'User .error_message' do
    it 'returns an Array containing error information' do
        result = Company.error_message

        expect(result).to match([{error: {message: 'Unable to locate specified {id}', status: 400}}])
    end
end