class DashboardController < ApplicationController

  # GET /
  def index
    # if we're logged in just go straight to dashboard
    ## redirect #dashboard if @user.logged_in? or something
    # session[:user] ||= User.find_by_id(params[:user])
    if authenticate?
      flash[:info]   = "You logged in!"
      redirect_to dashboard_path(user: params[:user])
    end
  end

  # GET /dashboard
  # GET /dashboard.json
  def dashboard
    # horrible user tracking
    unless authenticate?
      flash[:alert]   = "no user!"
      redirect_to root_path and return
    end
    @user = User.find_by_id(params[:user]) if User.exists?({:id => params[:user]})
    # horrible pet photo default
    @pets = [{:photo => 'https://media.wired.com/photos/59270b3ff3e2356fd800b471/2:1/w_2500,c_limit/DataAttackViralPets.jpg'}]

    # FORMATS
    respond_to do |format|
      format.html   # dashboard.html.erb
      format.json { # testing out json rendering
        render json: {:user => User.all}
      }
    end
  end

  private
    def authenticate?
      User.exists?({:id => params[:user]})
    end
end
