class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user
  def current_user
  	if session[:user_id]
  		return User.find(session[:user_id])
  	else
  		return nil
  	end
  end

  def authenticate
  	if current_user == nil
  		redirect_to login_path
  	end
  end

  def allowed?
    @group = Group.all
    current_user.admin == true || (@group.users.include?(current_user) && current_user.mentor)
  end

  def admin?
    current_user.admin == true
  end

  # def in_group?
  #   @group = Group.all
  #   @group.users.include?(current_user)
  # end
  
end
