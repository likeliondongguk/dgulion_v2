class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # before_action :configure_permitted_parameters
  # before_action :configure_account_update_params

  # 이건 일반 cancan 거부 코드
  rescue_from CanCan::AccessDenied do |exception|
      respond_to do |format|
        format.json { head :forbidden, content_type: 'text/html' }
        format.html { redirect_to main_app.root_url, notice: exception.message }
        format.js   { head :forbidden, content_type: 'text/html' }
      end
  end
  # 밑에 거는 active_admin 전용 거부 코드
  def access_denied(exception)
      redirect_to users_path, notice: exception.message
  end

  protected
  def after_sign_in_path_for(resource)
    root_path
    # if resource.has_role == AdminUser
    #   admin_root_path
    # elsif resource.class == User
    #   dashboard_index_path
    # end
  end
end
