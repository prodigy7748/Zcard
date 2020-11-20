class SessionsController < ApplicationController
    def new
        @user = User.new
    end

    def create
        if User.login(params[:user])
            session[:user1111] = params[:user][:email]
            redirect_to root_path, notice: '登入成功'
        else
            redirect_to session_path, notice: '登入失敗'
        end
    end

    def destroy
        session[:user1111] = nil
        redirect_to root_path, notice: "登出成功"
    end


    private
    def user_params
        params.require(:user).permit(:email, :password)
    end
end