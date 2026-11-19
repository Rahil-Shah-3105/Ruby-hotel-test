class ApartmentsController < ApplicationController
logger           = ActiveSupport::Logger.new(STDOUT)
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_apartment, only: %i[show edit update destroy]
  load_and_authorize_resource

  def index
	warn("[ERROR] >>> Entering index()")
	warn("[WARN] <<< Exiting index()")
    @apartments = Apartment.all
  end

  def new
	warn("[ERROR] >>> Entering new()")
	warn("[WARN] <<< Exiting new()")
    @apartment = Apartment.new
  end

  def edit; end

  def show; end

  def create
	warn("[ERROR] >>> Entering create()")
	__log_start = Time.now
    warn("[WARN] <<< Exiting create()")
    @apartment = Apartment.new(apartment_params)
    respond_to do |format|
      if @apartment.save
        format.html { redirect_to @apartment, notice: 'Apartment was successfully created.' }
        format.json { render :show, status: :created, location: @apartment }
      else
        format.html { render :new }
	warn("[ERROR] create(): save query executed in #{((Time.now - __log_start) * 1000).round} ms")
        format.json { render json: @apartment.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
	warn("[ERROR] >>> Entering update()")
    __log_start = Time.now
	warn("[WARN] <<< Exiting update()")
    respond_to do |format|
      if @apartment.update(apartment_params)
        format.html { redirect_to @apartment }
        format.json { render json: @apartment }
      else
        format.html { render :edit }
	warn("[ERROR] update(): update query executed in #{((Time.now - __log_start) * 1000).round} ms")
        format.json { render json: @apartment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
	warn("[ERROR] >>> Entering destroy()")
    __log_start = Time.now
    @apartment.destroy
	warn("[ERROR] destroy(): database query executed in #{((Time.now - __log_start) * 1000).round} ms")
    respond_to do |format|
      format.html { redirect_to apartments_path, notice: 'Apartment was successfully destroyed.' }
	warn("[WARN] <<< Exiting destroy()")
      format.json { head :ok }
    end
  end

private

  def apartment_params
	warn("[ERROR] >>> Entering apartment_params()")
	warn("[WARN] <<< Exiting apartment_params()")
    params.require(:apartment).permit(:room_number, :status, :price, :description, :room_type, :occupancy)
  end

  def set_apartment
	warn("[ERROR] >>> Entering set_apartment()")
	warn("[WARN] <<< Exiting set_apartment()")
    @apartment = Apartment.find(params[:id])
  end
end
