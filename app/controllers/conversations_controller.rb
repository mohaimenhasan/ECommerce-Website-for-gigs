class ConversationsController < ApplicationController

	before_action :set_conversation, except: [:index]
	before_action :check_participating!, except: [:index]

	def index
	  @conversations = Conversation.participating(current_user).order('updated_at DESC')
	end

	def show
	  @personal_message = PersonalMessage.new
	end

	private

	def set_conversation
	  @conversation = Conversation.find_by(id: params[:id])
	end

    # redirection may need to be changed 
	def check_participating!
	  redirect_to conversations_path unless @conversation && @conversation.participates?(current_user)
	end
end
