module Api
    class RequestsController < ApplicationController
        before_action :authenticate_user!
        
        def index 
            @requests = Request.all
            render json @request
        end

        def show
            @request = Request.find(params[:id])
            render json @request
        end

        def create
            @request = Request.create(title: request_params[:title], description: request_params[:description], type: request_params[:type], lat: request_params[:lat], long: request_params[:long], user: current_user)
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
          params.require(:request).permit(:type, :lat, :long, :title, :description, :isactive, :endate)
        end



    end
end
