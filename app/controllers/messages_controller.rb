class MessagesController < ApplicationController
# before_action :set_group, :set_messages

def index
  @group = Group.find(params[:group_id])
  @groups = current_user.groups
  @message = Message.new
end

def create
  @groups = current_user.groups
  @message = current_user.messages.new(message_params)
  if @message.save
    redirect_to group_messages_path
  else
    redirect_to group_messages_path,alert: "メッセージを入力してください。"
  end
end

private
def message_params
  params.require(:message).permit(:body,:image).merge(group_id: params[:group_id])
end
  # def set_group
  #   @group = Group.find(params[:group_id])
  # end

  # def set_messages
  #   @messages = @group.messages
  # end
end
