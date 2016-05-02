class Company < ActiveRecord::Base
    def self.add_meta_data(page, per_page, total)
        Company.update_all(meta: {page_number: page, per_page: per_page, total_companies: total})
    end

    def self.valid_id?(params)
        params.to_i
        return /\d/.match(params)
    end

    def self.error_message_for_id
        error = [
            {
                error: {
                    message: 'Unable to locate specified :id',
                    status: 400
                }
            }
        ]
    end
end
