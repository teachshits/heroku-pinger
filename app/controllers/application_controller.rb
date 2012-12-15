class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user
  helper_method :user_signed_in?
  helper_method :correct_user?
  helper_method :can_add_sites?

  private
    def current_user
      begin
        puts "*********** in current_user"
        logger.info session.inspect
        puts "session inspect: #{session.inspect}"
        # puts "Gonna try to get the user"
        
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
        puts "@current_user: #{@current_user}"
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

    def can_add_sites?
      # current_user.number_of_sites <= 4 && user_signed_in?
      # @user.number_of_sites <= 4 && user_signed_in?
    end

    def authenticate_user!
      if !current_user
        redirect_to root_url, :alert => 'You need to sign in for access to this page.'
      end
    end

end
