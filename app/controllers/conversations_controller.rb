class ConversationsController < ApplicationController

  def index
    @conversation = Conversation.all
  end

  def create
    if Conversation.between(params[:sender_id], params[:recipient_id]).present?
      @conversation = Conversation.between(params[:sender_id], params[:recipient_id]).first
    else
      @conversation = Conversation.create!(conversation_params)
    end

    # redirect_to conversation_messages_path(@conversation)
    render json: { conversation_id: @conversation}
  end

  def show
    @conversation = Conversation.find(params[:id])
    @messages = @conversation.messages
    @message = Message.new
    @receiver = interlocutor(@conversation)
  end

  private

  def conversation_params
    params.permit(:sender_id, :recipient_id)
  end

  def interlocutor(conversation)
    current_user == conversation.recipient? conversation.sender : conversation.recipient
  end
end
