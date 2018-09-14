class ConversationsController < ApplicationController
  def index
    @conversations = policy_scope(Conversation)
    @conversations = @conversations.where('sender_id = ? OR receiver_id = ?', current_user.id, current_user.id)
    @message = Message.new
  end

  def create
    if Conversation.between(params[:sender_id], params[:receiver_id]).present?
      @conversation = Conversation.between(params[:sender_id], params[:receiver_id]).first
    else
      @conversation = Conversation.create(conversation_params)
    end
    authorize @conversation

    if params[:body]
      @message = Message.new(body: params[:body], user: @conversation.sender)
      @message.conversation = @conversation
      @message.save
    end
    redirect_to conversations_path(current_user.id)
  end

  private

  def conversation_params
    params.permit(:sender_id, :receiver_id)
  end
end
