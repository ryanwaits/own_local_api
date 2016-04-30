class Api::V1::CompaniesController < Api::V1::BaseController
    before_action :set_company, only: [:show]
    def index
        # all companies
        respond_with Company.paginate(page: params[:page], per_page: 51)
    end

    def show
        # one company
        respond_with :api, :v1, @company
    end

    private 

    def set_company
        @company = Company.find(params[:id])
    end
end