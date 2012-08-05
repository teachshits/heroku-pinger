class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user
  helper_method :user_signed_in?
  helper_method :correct_user?

  private
    def current_user
      begin
        puts "*********** in current_user"
        logger.info session.inspect
        puts "#{session.inspect}"
        # puts "Gonna try to get the user"
        
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
      rescue # Mongoid::Errors::DocumentNotFound
        puts "RESCUE ME++++++++++++++++++++++++++"
        nil
      end
    end

    def user_signed_in?
      return true if current_user
    end

    def correct_user?
      @user = User.find(params[:id])
      unless current_user == @user
        redirect_to root_url, :alert => "Access denied."
      end
    end

    def authenticate_user!
      if !current_user
        redirect_to root_url, :alert => 'You need to sign in for access to this page.'
      end
    end

end
