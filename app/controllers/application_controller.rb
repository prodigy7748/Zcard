class ApplicationController < ActionController::Base
    include Pundit
    include SessionsHelper 
    #viewhelper只有view能取用，所以controller要用的話，要取用
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

    private
    def record_not_found
        render file: "public/404.html", layout: false
    end


    def session_required
        redirect_to sign_in_users_path, notice: '請先登入會員' unless user_signed_in?
    end

    
end
