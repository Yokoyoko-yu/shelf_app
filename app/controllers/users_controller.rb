class UsersController < ApplicationController
    def new 
        @user=User.new
    end

    def create
        @user=User.new(user_resources)
        if @user.save
            redirect_to '/home'
        else
            render 'new',stauts: :unprocessable_enitiy
        end
    end

    private

    def user_resources
        params.require(:user).permit(:name,:email,:password)
    end
end
