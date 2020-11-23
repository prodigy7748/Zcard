module SessionsHelper
    def current_user
        if session[:user1111].present?
        # 下行的原型 -> @_user99 = @_user99 || User.find_by(email: session[:user1111])
        # 第一次登入因為沒有@user所以會進資料庫找，後面第二次之後因為已經把在資料庫找到資料並指定給@user了，所以後面的view直接帶這個@user進去 ，不會再進資料庫撈一次
        #user名稱通常會取比較特別的，比較不會衝突
          @_user99 ||= User.find_by(id: session[:user1111])
        else   
          nil
        end
    end

    def user_signed_in?
      if current_user
        return true
      else
        return false
      end
    end

    
end