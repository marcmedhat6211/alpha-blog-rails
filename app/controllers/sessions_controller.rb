class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      # rails fyha object kbyr esmo session shayel kol 7aga 3an el session
      # e7na hena we're setting el user id fel session bel id el m3aya now bta3 el user el bey7awel y login
      # el id dh byeb2a 
      session[:user_id] = user.id
      flash[:notice] = "You are logged in successfully"
      redirect_to user
    else
      # hena we used flash.now 3ashan e7na b3d mabne3mel flash bne3mel render msh redirect_to
      # el flash el 3adeya btet3emel b3d 1 HTTP request, el flash.now btet3emel now 7alan
      flash.now[:alert] = "There was something wrong with your credentials"
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Logged out"
    redirect_to root_path
  end

end