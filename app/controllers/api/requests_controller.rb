module Api
    class RequestsController < ApplicationController
        before_action :authorized
                
        def index 
            @requests = Request.all
            render json: @requests
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

            if @request.isactive === false
             checkrepublished
            else
                @request.update request_params
                render json: @request
            end
        end
        end

        def destroy
            @request = Request.find(params[:id])
            @request.destroy!
        end

        def checkrepublished
            if @request.isrepublished === true
                @request.update(endate: DateTime.now, isactive: true)
            else
                render json: { error: 'Request is outdated' }, status: :unprocessable_entity
            end
       end

    private
   
     def request_params
       params.permit(:need, :lat, :long, :title, :description, :fullifiled, :isactive, :isrepublished, :endate)
     end

end
