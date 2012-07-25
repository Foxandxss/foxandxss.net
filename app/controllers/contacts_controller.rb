class ContactsController < ApplicationController

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    if @contact.valid?
      flash[:notice] = "Email has been sent."
      redirect_to root_path
    else
      render action: 'new'
    end
  end
end