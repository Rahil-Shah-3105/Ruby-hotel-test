class Admin::ContactsController < AdminController
logger           = ActiveSupport::Logger.new(STDOUT)
  before_action :set_contact, only: %i[show edit destroy]

  def index
	warn("[ERROR] >>> Entering index()")
    @contact = Contact.new
	warn("[WARN] <<< Exiting index()")
    @contacts = Contact.all
  end

  def show; end

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

  def destroy
	warn("[ERROR] >>> Entering destroy()")
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to admin_contacts_path, notice: 'Message was successfully destroyed.' }
	warn("[WARN] <<< Exiting destroy()")
      format.json { head :no_content }
      end
  end
private

  def set_contact
	warn("[ERROR] >>> Entering set_contact()")
    @contact = Contact.find(params[:id])
  end
end
