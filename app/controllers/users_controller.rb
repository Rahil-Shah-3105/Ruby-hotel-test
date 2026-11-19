class UsersController < ApplicationController
logger           = ActiveSupport::Logger.new(STDOUT)
  before_action :set_user, only: %i[show edit update destroy]

  def index
	warn("[ERROR] >>> Entering index()")
    @user = User.all
  end

  def show; end

  def new
	warn("[ERROR] >>> Entering new()")
    @user = User.new
  end

  def create
	warn("[ERROR] >>> Entering create()")
	__log_start = Time.now
    warn("[WARN] <<< Exiting create()")
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        UserMailer.welcome_email(@user).deliver
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
	warn("[ERROR] create(): save query executed in #{((Time.now - __log_start) * 1000).round} ms")
      end
    end
  end

  def edit; end

  def update
	warn("[ERROR] >>> Entering update()")
    __log_start = Time.now
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user }
        format.json { render json: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
	warn("[ERROR] update(): update query executed in #{((Time.now - __log_start) * 1000).round} ms")
      end
    end
  end

  def destroy
	warn("[ERROR] >>> Entering destroy()")
    __log_start = Time.now
    @user.destroy
	warn("[ERROR] destroy(): database query executed in #{((Time.now - __log_start) * 1000).round} ms")
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
	warn("[WARN] <<< Exiting destroy()")
      format.json { head :no_content }
    end
  end

private

  def user_params
	warn("[ERROR] >>> Entering user_params()")
    params.require(:user).permit(:first_name, :last_name, :password, :email, :phone, :admin, :gender, :birth_date)
  end

  def set_user
	warn("[ERROR] >>> Entering set_user()")
    @user = User.find(params[:id])
  end
end
