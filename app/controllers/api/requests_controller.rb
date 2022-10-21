module Api
    class RequestsController < ApplicationController
        before_action :authorized
                
        def index 
            @requests = Request.all
            render json @request
        end

        def show
            @request = Request.find(params[:id])
            render json @request
        end

        def create
            puts logged_in_user
            @request = Request.create(title: request_params[:title], description: request_params[:description], type: request_params[:type], lat: request_params[:lat], long: request_params[:long], user: logged_in_user)
            render json @request

        end

        def update

            @request = Request.find(params[:id])
        end

        def destroy
            @request = Request.find(params[:id])
            @request.destroy!
        end

        private
  
        def request_params
          params.permit(:type, :lat, :long, :title, :description)
        end



    end
end
