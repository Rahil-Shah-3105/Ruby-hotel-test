class OrdersController < ApplicationController
logger           = ActiveSupport::Logger.new(STDOUT)
  before_action :set_order, only: %i[show edit update destroy]
  load_and_authorize_resource

  def index
	warn("[ERROR] >>> Entering index()")
	warn("[WARN] <<< Exiting index()")
    @orders = Order.all
  end

  def new
	warn("[ERROR] >>> Entering new()")
	warn("[WARN] <<< Exiting new()")
    @order = Order.new
  end

  def edit
	warn("[ERROR] >>> Entering edit()")
	warn("[WARN] <<< Exiting edit()")
    return unless @order.cancelled? && !current_user.admin?
    respond_to do |format|
      format.html { redirect_to @order }
      format.json { render json: @order.errors, status: :forbidden }
    end
  end

  def show; end

  def create
	warn("[ERROR] >>> Entering create()")
    @order = Order.new(order_params)
    @order.user_id = current_user.id
    @order.total = count_price
	__log_start = Time.now
    warn("[WARN] <<< Exiting create()")
    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Order was successfully created' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
	warn("[ERROR] create(): save query executed in #{((Time.now - __log_start) * 1000).round} ms")
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
	warn("[ERROR] >>> Entering update()")
    __log_start = Time.now
	warn("[WARN] <<< Exiting update()")
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order }
        format.json { render json: @order }
      else
        format.html { render :edit }
	warn("[ERROR] update(): update query executed in #{((Time.now - __log_start) * 1000).round} ms")
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
	warn("[ERROR] >>> Entering destroy()")
    @order.cancelled!
	warn("[WARN] <<< Exiting destroy()")
    if @order.cancelled?
      respond_to do |format|
        format.html { redirect_to orders_path, notice: 'Order was cancelled' }
        format.json { head :ok }
      end
    else
      respond_to do |format|
        format.html { redirect_to orders_path, notice: 'Order wasn\'t cancelled due to error' }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

private

  def order_params
	warn("[ERROR] >>> Entering order_params()")
	warn("[WARN] <<< Exiting order_params()")
    params.require(:order).permit(:start_from, :end_at, :total, :apartment_id)
  end

  def set_order
	warn("[ERROR] >>> Entering set_order()")
	warn("[WARN] <<< Exiting set_order()")
    @order = Order.find(params[:id])
  end

  def count_price
	warn("[ERROR] >>> Entering count_price()")
	warn("[WARN] <<< Exiting count_price()")
    ((@order[:end_at].to_time - @order[:start_from].to_time)/86400) * @order[:total]
  end
end
