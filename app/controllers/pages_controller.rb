class PagesController < ApplicationController
    before_action :authenticate_user!
    before_action :restrict_users, only: :index
    def index
        
    end

    def admin
        @user = User.new
        authorize! :create, current_user, message: "Unauthorized User"
    end

    def member
        @user = current_user
        authorize! :member, @user, message: "Unauthorized User"
    end

    def invite
        @user = User.new(user_params)  
		@user.password = "P@$$W0rd"
        if @user.save
            redirect_to admin_path, notice: "Member successfully invited"
        else
            redirect_to admin_path, alert: @user.errors.full_messages.join(", ")
        end
    end


    private
        def restrict_users
            if user_signed_in?
                if current_user.super_admin?
                    redirect_to "/command_center/super_admin"
                elsif current_user.admin? 
                    redirect_to "/admin"
                elsif current_user.member?
                    redirect_to "/member"
                end
            end
        end

        def user_params
            params.require(:user).permit(:first_name, :last_name, :role, :email)
        end
end