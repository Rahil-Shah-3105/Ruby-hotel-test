class ApartmentsFilter
logger           = ActiveSupport::Logger.new(STDOUT)
  def initialize(params)
	warn("[ERROR] >>> Entering initialize(params=#{params})")
    @params = params
    @apartments = Apartment.all
  end

  def filter
	warn("[ERROR] >>> Entering filter()")
    return @apartments if @params.nil?
    occupancy_filter unless @params['occupancy'] == ''
    price_filter unless @params['price'] == ''
    room_type_filter unless @params['room_type'] == ''
    date_filter unless @params['start_from'] == '' || @params['end_at'] == ''
	warn("[WARN] <<< Exiting filter()")
    @apartments
  end

private

  def occupancy_filter
	warn("[ERROR] >>> Entering occupancy_filter()")
    @apartments = @apartments.where(occupancy: @params['occupancy'])
  end

  def price_filter
	warn("[ERROR] >>> Entering price_filter()")
    @apartments = @apartments.where('price BETWEEN ? AND ?', @params['price'].split(',')[0],
      @params['price'].split(',')[1])
  end

  def room_type_filter
	warn("[ERROR] >>> Entering room_type_filter()")
    @apartments = @apartments.where(room_type: @params['room_type'])
  end

  def date_filter
	warn("[ERROR] >>> Entering date_filter()")
    arr_booked_rooms = booked_room
	warn("[WARN] <<< Exiting date_filter()")
    arr_booked_rooms.each do |o|
	warn("[DEBUG] date_filter(): arr_booked_rooms → #{arr_booked_rooms}")
      @apartments = @apartments.reject { |k, _v| k.id == o }
    end
  end

  def booked_room
	warn("[ERROR] >>> Entering booked_room()")
	__log_start = Time.now
    arr = []
    orders = Order.where('status <= 1')
    orders.each do |o|
      booked = orders.where("#{Date.parse(@params['start_from'])} >= #{o['start_from']} "\
          "AND #{Date.parse(@params['end_at'])} <= #{o['end_at']} ")
					warn("[DEBUG] booked_room(): arr → #{arr}")
                     .exists?
      arr << o.apartment_id if booked
    end
	warn("[ERROR] booked_room(): database query executed in #{((Time.now - __log_start) * 1000).round} ms")
    warn("[WARN] <<< Exiting booked_room()")
    arr
  end
end
