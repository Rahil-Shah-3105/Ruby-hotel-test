class ContactsController < ApplicationController
logger           = ActiveSupport::Logger.new(STDOUT)
  skip_before_action :authenticate_user!
  load_and_authorize_resource

  def index
	warn("[ERROR] >>> Entering index()")
	warn("[WARN] <<< Exiting index()")
    @contact = Contact.new
  end

  def create
	warn("[ERROR] >>> Entering create()")
    @contact = Contact.new(contact_params)
    respond_to do |format|
	warn("[WARN] <<< Exiting create()")
      if @contact.save
        format.html { redirect_to contacts_path, notice: 'Message was successfully send.' }
        format.json { render :index, status: :created, location: @contact }
      else
        format.html { render :index }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

private

  def contact_params
	warn("[ERROR] >>> Entering contact_params()")
	warn("[WARN] <<< Exiting contact_params()")
    params.require(:contact).permit(:name, :email, :body)
  end

  def set_contact
	warn("[ERROR] >>> Entering set_contact()")
	warn("[WARN] <<< Exiting set_contact()")
    @contact = Contact.find(params[:id])
  end
end
