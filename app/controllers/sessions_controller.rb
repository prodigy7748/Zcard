class SessionsController < ApplicationController
    def new
        @user = User.new
    end

    def create
        #controller不放商業邏輯，login為拉出來放在model自製的類別方法
        #欄位輸入的資料帶到model的login類別方法，找到這個user
        if user = User.login(params[:user])
            #發號碼牌(cookie)給user，認這個email(改認ID，否則email不能讓使用者更改)
            #hash裡面包hash   "user"=>{"email"=>"888@gmail.com", "password"=>"[FILTERED]"}, "commit"=>"登入"}
            session[:user1111] = user.id
            redirect_to root_path, notice: '登入成功'
        else
            #資料庫撈不到資料,不render以免有心人士一直嘗試登入他人帳號
            redirect_to session_path, notice: '登入失敗'
        end
    end

    def destroy
        #丟掉user的號碼牌，斷開連結
        session[:user1111] = nil
        redirect_to root_path, notice: "登出成功"
    end


    private
    def user_params
        params.require(:user).permit(:email, :password)
    end

end