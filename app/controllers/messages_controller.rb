class MessagesController < ApplicationController

def index
  @group = Group.find(params[:group_id])
  @groups = current_user.groups.order("created_at DESC")
  @message = Message.new
  @messages = Message.where(group_id: params[:group_id]).order("created_at DESC")
end

def create
  @groups = current_user.groups
  @message = current_user.messages.new(message_params)
  if @message.save
    redirect_to group_messages_path
  else
    redirect_to group_messages_path, palert: "メッセージを入力してください。"
  end
end

private
def message_params
  params.require(:message).permit(:body,:image).merge(group_id: params[:group_id])
end

end

