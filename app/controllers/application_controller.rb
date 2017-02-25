class ApplicationController < ActionController::Base
  include Pundit

  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  protected
    def configure_permitted_parameters
      # Devise: add customer signup options to permitted parameters list
      devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email, :password, :password_confirmation])
    end

    def authorize_admin
      unless current_user.has_role? :admin
        user_not_authorized
      end
    end

    def authorize_member
      unless current_user.has_role? :member
        user_not_authorized
      end
    end

    def authorize_staff
      unless current_user.has_role? :staff
        user_not_authorized
      end
    end

  private
    def user_not_authorized
      flash[:alert] = "You are not authorized to perform this action."
      redirect_to(request.referrer || root_path)
    end
end
