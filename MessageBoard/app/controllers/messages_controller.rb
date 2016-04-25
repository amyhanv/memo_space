class MessagesController < ApplicationController
	before_action :find_message, only: [:show, :edit, :update, :destroy] #executed code before any actions take place
	before_action :authenticate_user!, except: [:index, :show] #can still view content when no signed up creds to devise

	def index
		@messages = Message.all.order("created_at DESC")
	end

	def show	
	end

	def new
		@message = current_user.messages.build	#denotes an instance variable & available to use in views

	end

	def edit
	end

	def update
		if @message.update(message_params)
			redirect_to message_path
		else
			render 'edit'
		end
	end

	def destroy
		@message.destroy
		redirect_to root_path
	end

	def create
		@message = current_user.messages.build(message_params) #what users type
		if @message.save
			redirect_to root_path
		else
			render 'new'
		end
	end

	private
		def message_params
			params.require(:message).permit(:title, :description)
		end

		def find_message
			@message = Message.find(params[:id])
		end
end


