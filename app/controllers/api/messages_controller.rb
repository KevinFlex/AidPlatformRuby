module Api
  class MessagesController < ApplicationController

  before_action :authorized

  before_action do
    @conversation = Conversation.find(params[:conversation_id])
  end

  def index

    @messages = @conversation.messages

    @messages.where("user_id != ? AND read = ?", logged_in_user.id, false).update_all(read: true)

    render json: @messages
  end

  def create
    @message = @conversation.messages.new(message_params)
    @message.user = logged_in_user

    if @message.save
    render json: @message
    end
  end

  private
    def message_params
      params.permit(:body, :user_id)
    end
  end

end


# USE THAT MODEL TO THE FRONT !
# <% @messages.each do |message| %>
#   <% if message.body %>
#     <li>
#       <h4><%= message.user.username %></h4>
#       <p><%= message.body %></p>
#     </li>
#   <% end %>
# <% end %>
# </ul>

# <%= form_for [@conversation, @message] do |f| %>
# <div class="field">
#   <%= f.text_area :body, placeholder: "Your message" %>
# </div>

# <%= f.submit "Send" %>
