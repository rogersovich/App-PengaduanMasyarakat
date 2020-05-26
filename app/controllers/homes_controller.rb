class HomesController < ApplicationController

  include BCrypt

  def index
    @categories = Category.all
  end

  def proses
    abort params.inspect
  end

  def upload
  end


  def register
    
    password = Password.create(params[:password])
    # abort params.inspect

    if request.post?
    
      if params[:role_id].to_i == 3

        #masyarakat
        Society.new(
          name: params[:name].titleize,
          username: params[:username],
          password: password,
          telp: params[:telp]
        ).save

      else

        #petugas / admin
        # admin = 1
        # petugas = 2

        User.new(
          name: params[:name].titleize,
          username: params[:username],
          password: password,
          telp: params[:telp],
          role_id: params[:role_id].to_i
        ).save

      end
    end
    
  end

  def login

    test = 'haha'

    if request.post?
    
      if params[:role].to_i == 3
        #masyarakat
        user = Society.where(username: params[:username] ).first

        if user == nil
          redirect_to signIn_path
        else
          password = Password.new(user.password)
  
          if password == params[:password]
            #berhasil
            redirect_to home_path
          else
            #gagal
            redirect_to signIn_path
          end
        end

      else

        #petugas / admin
        # admin = 1
        # petugas = 2

        user = User.where(username: params[:username] ).first
        
        if user == nil
          redirect_to signIn_path
        else
          password = Password.new(user.password)
          
          if password == params[:password]
            #berhasil
            session[:user_id] = user.id
            redirect_to admin_dashboard_path, notice: "Logged in!"
          else
            #gagal
            flash.now[:alert] = "Email or password is invalid"
            redirect_to signIn_path
          end
        end

      end

    end

  end

  def destroy
    session[:user_id] = nil
    redirect_to home_path , notice: "Logged out!"
    
  end

end
