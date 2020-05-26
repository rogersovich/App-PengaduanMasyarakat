class Admin::UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  include BCrypt

  layout 'elements/main'

  # GET /users
  # GET /users.json
  def index
    @users = User.paginate(page: params[:page], per_page: 10)
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create

    password = Password.create(params[:password])
    # abort params.inspect
    
    if params[:role_id].to_i == 0

      #masyarakat
      @user = Society.new(
        name: params[:name].titleize,
        username: params[:username],
        password: password,
        telp: params[:telp]
      ).save

    else

      #petugas / admin
      # admin = 1
      # petugas = 2

      @user = User.new(
        name: params[:name].titleize,
        username: params[:username],
        password: password,
        telp: params[:telp],
        role_id: params[:role_id].to_i
      ).save

    end

    respond_to do |format|
      if @user
        format.html { redirect_to admin_users_path, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
  
    if params[:user][:password] == ''
      edit = @user.update(
        name: params[:user][:name].titleize,
        username: params[:user][:username],
        telp: params[:user][:telp],
        role_id: params[:user][:role_id].to_i
      )
    else
      password = Password.create(params[:user][:password])

      edit = @user.update(
        name: params[:user][:name].titleize,
        username: params[:user][:username],
        password: password,
        telp: params[:user][:telp],
        role_id: params[:user][:role_id].to_i
      )
    end

    respond_to do |format|
      if edit
        format.html { redirect_to admin_users_path, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to admin_users_path, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:name, :username, :password, :telp, :role_id)
    end
end
