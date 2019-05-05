class DashboardController < ApplicationController
 #puts "\e[35m#{params}\e[0m"
  def index
    # if we're logged in just go straight to dashboard
    ## redirect #dashboard if @user.logged_in? or something
    # session[:user] ||= User.find_by_id(params[:user])
    redirect_to dashboard_url, alert: "loaded dashboard"
  end

  def dashboard
    # horrible user tracking
    @user = User.last
    @user = User.find_by_id(params[:user]) if User.exists?({:id => params[:user]})

    @pets = [{:photo => 'https://media.wired.com/photos/59270b3ff3e2356fd800b471/2:1/w_2500,c_limit/DataAttackViralPets.jpg'}]

    respond_to do |format|
      format.html # dashboard.html.erb
      # testing out json rendering
      format.json { render json: {:user => User.all, :pet => Pet.all} }
    end
  end
end
