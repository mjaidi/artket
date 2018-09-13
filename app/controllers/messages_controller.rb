class MessagesController < ApplicationController
  def create
    @conversation = Conversation.find(params[:conversation_id])
    @message = Message.new(body: params[:body])
    @message.conversation = @conversation
    @message.user = current_user
    @message.save

    authorize @message

    redirect_to conversations_path(current_user)
  end
end
