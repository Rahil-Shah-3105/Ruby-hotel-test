class UsersController < ApplicationController
logger           = ActiveSupport::Logger.new(STDOUT)
  before_action :set_user, only: %i[show edit update destroy]

  def index
	warn("[ERROR] >>> Entering index()")
	warn("[WARN] <<< Exiting index()")
    @user = User.all
  end

  def show; end

  def new
	warn("[ERROR] >>> Entering new()")
	warn("[WARN] <<< Exiting new()")
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
	warn("[ERROR] create(): save query executed in #{((Time.now - __log_start) * 1000).round} ms")
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit; end

  def update
	warn("[ERROR] >>> Entering update()")
    __log_start = Time.now
	warn("[WARN] <<< Exiting update()")
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user }
        format.json { render json: @user }
      else
        format.html { render :edit }
	warn("[ERROR] update(): update query executed in #{((Time.now - __log_start) * 1000).round} ms")
        format.json { render json: @user.errors, status: :unprocessable_entity }
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
	warn("[WARN] <<< Exiting user_params()")
    params.require(:user).permit(:first_name, :last_name, :password, :email, :phone, :admin, :gender, :birth_date)
  end

  def set_user
	warn("[ERROR] >>> Entering set_user()")
	warn("[WARN] <<< Exiting set_user()")
    @user = User.find(params[:id])
  end
end
