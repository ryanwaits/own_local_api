class ErrorsController < ApplicationController
    def routing
        # call our method defined in ApplicationController, setting a proper error message
        not_found(ActionController::RoutingError.new("No route matches [#{params[:a].method}] #{params[:a].path}"))
    end
end
