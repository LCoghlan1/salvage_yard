class MessagesController < ApplicationController
   
   before_action :require_user
    
    def create
        
        #generate assoc between message and user
        message = current_user.messages.build(message_params)
        
        if message.save
                ActionCable.server.broadcast 'chatroom_channel',
                    content: message.content
                    redirect_to chat_path
        end
    
    end
    
    private
    
    def message_params
        params.require(:message).permit(:body)
    end
    
end