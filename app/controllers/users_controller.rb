class UsersController < ApplicationController
    
    def new 
        @user = User.new
    end

    def create 
        @user = User.new(user_params)
        @user.email.downcase!
        if @user.save
            session[:user_id] = @user.id 
            flash[:notice] = "You're in."
            redirect_to root_path
        else 
            flash[:notice] = "Couldn't create account!"
            render :new 
        end
    end

    def index
        @user = current_user
    end

    def edit
        @user = current_user
    end

    def update
        @user = current_user
        if @user.update(user_params)
            if logged_in?
                flash[:notice] = "User Profile Updated Successfully."
                redirect_to root_path
            end
        else
            flash[:notice] = "Something went wrong, please try again!"
            render :edit
        end
    end

    def show
        @user = User.find(params[:id])
    end

    private 

    def user_params 
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

end