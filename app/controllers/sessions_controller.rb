class SessionsController < ArticlesController
  def new

  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    session[:user_id] = user.id
    if user && user.authenticate(params[:session][:password])
      flash[:notice] = "Logged in Succesfully"
      redirect_to user
    else 
      flash.now[:alert] = "there was something wronng with your login details "
      render "new"
    end
  end

  def destroy 
    session[:user_id] = nil 
    flash[:notice] = "logged out"
    redirect_to root_path
  end
end