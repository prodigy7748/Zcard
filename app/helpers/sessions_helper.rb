module SessionsHelper
    def current_user
        if session[:user1111].present?
        # 下行的原型 -> @user = @user || User.find_by(email: session[:user1111])
          @user ||= User.find_by(email: session[:user1111])
        else   
          nil
        end
    end
end