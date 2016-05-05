class Api::V1::CompaniesController < Api::V1::BaseController
    before_action :set_company, only: [:show]
    def index
        # all companies
        # use the will_paginate gem to display 50 companies per page and order them by {id}
        if Company.is_valid?(params[:per_page])
            paginated_companies = Company.paginate(page: params[:page], per_page: params[:per_page]).order('id ASC')
        else
            paginated_companies = Company.paginate(page: params[:page], per_page: 50).order('id ASC')
        end
        Company.add_meta_data(paginated_companies.current_page.to_i, paginated_companies.per_page, Company.all.count)
        
        respond_with paginated_companies
    end

    def show
        # one company based on :id
        if Company.valid_id?(params[:id])
            Company.reset_meta_data(@company, Company.all.count)
            respond_with :api, :v1, @company
        else
            respond_with Company.error_message
        end
    end

    private 

    def set_company
        @company = Company.find(params[:id])
    end
end