class ContactController < ApplicationController
    def index
        @user = current_user
    end 

    def new
        @contact = Contact.new
    end
    
    def create
        @contact = Contact.new(params[:contact])
        
        if @contact.save
            ContactsMailer.general_message(@contact).deliver
            render :thanks
        else
            render :new
        end
    end
      
    def thanks
    end
end
