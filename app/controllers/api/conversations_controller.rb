module Api
  class ConversationsController < ApplicationController

  before_action :authorized

  def index
    @users = User.where.not(id: current_user.id)
    @conversations = Conversation.where("sender_id = ? OR receiver_id = ?", current_user.id, current_user.id)

  end


  def create
    @request = Request.find(params[:id])
    if @request.params(:isactive) === true

      @conversation_number = Conversation.where(request_id: params[:request_id]).count
      if @conversation_number<5
        if Conversation.between(params[:sender_id], params[:receiver_id]).present?
        @conversation = Conversation.between(params[:sender_id], params[:receiver_id]).first
        else
        @conversation = Conversation.create!(conversation_params)
        end
      end
    render json: @conversation
    end
  end

  end

  private
    def conversation_params
      params.permit(:sender_id, :receiver_id, :request_id)
    end
  end
