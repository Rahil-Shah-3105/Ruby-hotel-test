require 'ApartmentsFilterForm.rb'
class HomesController < ApplicationController
logger           = ActiveSupport::Logger.new(STDOUT)
  def index
    @apartments_filter = ApartmentsFilterForm.new if params[:apartments_filter_form].nil?
	warn("[DEBUG] >>> Entering index()")
    @apartments_filter = ApartmentsFilterForm.new(filter_params) unless params[:apartments_filter_form].nil?
	warn("[DEBUG] <<< Exiting index()")
    @apartments = ApartmentsFilter.new(filter_params).filter
  end

private

  def filter_params
    unless params[:apartments_filter_form].nil?
	warn("[DEBUG] >>> Entering filter_params()")
      return params.require(:apartments_filter_form).permit(:room_type, :start_from, :end_at, :price, :occupancy)
    end
	warn("[DEBUG] <<< Exiting filter_params()")
    nil
  end
end
