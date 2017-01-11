module Api::V1
  class UsersController < ApiController
    skip_before_filter :verify_authenticity_token
  before_action :set_user, only: [:show, :update, :destroy, :resetApiToken, :isUserPassword ]

  #only skip if action is create
  skip_before_action :authenticate , :only => [:create,:resetPassword]
  skip_before_action :autorize, :only => [:create,:resetPassword,:update]

  before_action :checkLockOrCount, :only => [:show] 

  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
  def show
    render json: @user
  end

  # POST /users
  def create
    @user = User.new(user_params) 
    @user.token_limit = 5000
    if @user.save
      #deliver_later will execute your method from the background job.
      UserMailer.mailRegisto(@user).deliver_later   
      render json: @user ,status: :created #, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    #returns the object destroyed
    render json: @user
  end

  def resetApiToken
    #resets the apikey
    @user.api_key = @user.generate_api_key
    if @user.save
      render json: @user 
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  #Is user password
  def isUserPassword
    if( params[:password] ==  @user.password )
      render json: true
    else
      render json: false
    end
  end

 def resetPassword
    if(params[:resetToken] != nil)
      @user = User.find_by(resetToken: params[:resetToken]);
      if(@user != nil)
        if(@user.resetDate + 1.day > DateTime.now)
            @user.password = params[:password]
            @user.resetToken = nil
            @user.resetDate = nil
            if @user.save
              render :json => {message: "Sucess"}
            else
              render :json => { :errors => @user.errors.full_messages }, :status => 422
            end
        else
            @user.resetToken = nil
            @user.resetDate = nil
            @user.save
            render :json => { :errors => @user.errors.full_messages }, :status => 422
        end
      else
        render :json => { :message => "User was not found" }, :status => 422
      end
    else
      @user = User.find_by(email: params[:email]);
      if(@user != nil)
        @user.resetToken = SecureRandom.uuid;
        @user.resetDate = DateTime.now;
        if @user.save
          UserMailer.mailPassRecovery(@user).deliver_later
        else
          render :json => { :errors => @user.errors.full_messages }, :status => 422
        end
      else
        render :json => { :message => "User was not found" }, :status => 422
      end
    end
         
  end 

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
        @user = User.find(params[:id])   
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:id, :name, :surname, :email, :password,:token_count, :role => [:id] )
    end
  end
end