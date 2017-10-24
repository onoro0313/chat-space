class MessagesController < ApplicationController

def index
  @groups = current_user.groups
end

def create
  @message = Message.

end

private
def message_params

end

end
