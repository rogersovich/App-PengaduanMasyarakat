class Admin::SocietiesController < ApplicationController
  before_action :set_society, only: [:show, :edit, :update, :destroy]
  include BCrypt

  layout 'elements/main'

  # GET /societies
  # GET /societies.json
  def index
    @societies = Society.paginate(page: params[:page], per_page: 10)
  end

  # GET /societies/1
  # GET /societies/1.json
  def show
  end

  # GET /societies/new
  def new
    @society = Society.new
  end

  # GET /societies/1/edit
  def edit
  end

  # POST /societies
  # POST /societies.json
  def create
    password = Password.create(params[:password])

    @society = Society.new(
      name: params[:name].titleize,
      username: params[:username],
      password: password,
      telp: params[:telp]
    ).save

    respond_to do |format|
      if @society
        format.html { redirect_to admin_societies_path, notice: 'Society was successfully created.' }
        format.json { render :show, status: :created, location: @society }
      else
        format.html { render :new }
        format.json { render json: @society.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /societies/1
  # PATCH/PUT /societies/1.json
  def update

    if params[:society][:password] == ''
      edit = @society.update(
        name: params[:society][:name].titleize,
        username: params[:society][:username],
        telp: params[:society][:telp]
      )
    else
      password = Password.create(params[:society][:password])

      edit = @society.update(
        name: params[:society][:name].titleize,
        username: params[:society][:username],
        password: password,
        telp: params[:society][:telp]
      )
    end

    respond_to do |format|
      if edit
        format.html { redirect_to admin_societies_path, notice: 'Society was successfully updated.' }
        format.json { render :show, status: :ok, location: @society }
      else
        format.html { render :edit }
        format.json { render json: @society.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /societies/1
  # DELETE /societies/1.json
  def destroy
    @society.destroy
    respond_to do |format|
      format.html { redirect_to admin_societies_path, notice: 'Society was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_society
      @society = Society.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def society_params
      params.require(:society).permit(:name, :username, :password, :telp)
    end
end
