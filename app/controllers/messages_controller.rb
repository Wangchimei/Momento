class MessagesController < ApplicationController
  before_action :find_conversation

  def index
    @messages = @conversation.messages
    if @message.length > 10
      @shorten = true
      @messages = Message.where(id: @messages[-15..-1].pluck(:id))
    end
    if params[:m]
      @shorten = false
      @messages = @conversation.messages
    end
    if @message.last
      @messages.where.not(user_id: current_user.id).update_all(read: true)
    end
    @messages = @messages.order(:created_at)
    # @message = @conversation.messages.build
  end

  def create
    @message = @conversation.messages.build(message_params)
    if @message.save
      redirect_to conversation_messages_path(@conversation)
    else
      render 'index'
    end
    # @path = conversation_path(@conversation)
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end

  def find_conversation
    @conversation = Conversation.find(params[:conversation_id])
  end
end
