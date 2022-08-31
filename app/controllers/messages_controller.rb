class MessagesController < ApplicationController

  before_action :authenticate

  before_action do
    @conversation = Conversation.find(params[:conversation_id])
  end

  def index

    @messages = @conversation.messages

    @messages.where("user_id != ? AND read = ?", current_user.id, false).update_all(read: true)

    @message = @conversation.messages.new
  end

  def create
    @message = @conversation.messages.new(message_params)
    @message.user = current_user

    if @message.save
      redirect_to conversation_messages_path(@conversation)
    end
  end

  private
    def message_params
      params.require(:message).permit(:body, :user_id)
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
