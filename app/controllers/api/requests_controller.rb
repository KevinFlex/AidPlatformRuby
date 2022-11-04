module Api
    class RequestsController < ApplicationController
        before_action :authorized
                
        def index 
            @requests = Request.all
            render json: @request
        end

        def show
            @request = Request.find(params[:id])
            render json: @request
        end

        def create
            puts request_params
            @request = Request.create(title: request_params[:title], description: request_params[:description], need: request_params[:need], lat: request_params[:lat], long: request_params[:long], user: logged_in_user)
            render json: @request

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
          params.permit(:need, :lat, :long, :title, :description)
        end



    end
end
