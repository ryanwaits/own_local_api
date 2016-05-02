class Api::V1::CompaniesController < Api::V1::BaseController
    before_action :set_company, only: [:show]
    def index
        # all companies
        paginated_companies = Company.paginate(page: params[:page], per_page: 51).order('id ASC')
        Company.add_meta_data(paginated_companies.current_page.to_i, paginated_companies.per_page - 1, Company.all.count)
        respond_with paginated_companies
    end

    def show
        # one company based on :id
        if Company.valid_id?(params[:id])
            respond_with :api, :v1, @company
        else
            respond_with Company.error_message_for_id
        end
    end

    private 

    def set_company
        @company = Company.find(params[:id])
    end
end