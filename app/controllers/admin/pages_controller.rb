class Admin::PagesController < ApplicationController

  layout 'elements/main'

  def index
  end

  def dashboard

    if current_user
      if current_user.id == 3 
        redirect_to homes_path, notice: "You are not admin"
      end
    else
      redirect_to signIn_path
    end
  end

end
