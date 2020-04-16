class ApplicationController < ActionController::Base
    # CSRFトークンの含まれない悪意あるPOSTリクエストに対してエラーを吐く
    protect_from_forgery with: :exception
    # デバイスのコントローラーに限り、下記に定義したストロングパラメーターを反映させる
    before_action :configure_permitted_parameters, if: :devise_controller?

    def after_sign_in_path_for(resource)
        articles_path # ログイン後に遷移するpathを設定
    end

    def after_sign_out_path_for(resource)
        new_user_session_path # ログアウト後に遷移するpathを設定
    end

    private

    def sign_in_required
        redirect_to new_user_session_url unless user_signed_in?
    end

    protected

    def configure_permitted_parameters
        added_attrs = [ :name,:username, :email, :password, :password_confirmation　]
        devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
        devise_parameter_sanitizer.permit :account_update, keys: added_attrs
        devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
  end
end
