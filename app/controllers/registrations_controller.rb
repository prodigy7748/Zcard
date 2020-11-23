class RegistrationsController < ApplicationController

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)

        if @user.save
            session[:user1111] = params[:user][:email]
            redirect_to root_path, notice: '註冊成功！'
        else
        #如果new頁面不是放在registrations這個view下面，“sessions/new"
            render :new
        end
    end

    def edit
    end

    def update
        if current_user.update(user_params)
          redirect_to edit_users_path, notice: '資料更新成功'
        else
          #
        end
    end


    private
    def user_params
        params.require(:user).permit(:email, :password, :nickname, :password_confirmation)
    end
end