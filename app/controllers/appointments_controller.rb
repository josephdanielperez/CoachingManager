class AppointmentsController < ApplicationController
    
    def new 
        @appointment = Appointment.new(user_id: params[:user_id])
    end

    def create 
        @appointment = Appointment.new(appointment_params)
        if @appointment.save 
            if logged_in?
                if is_users_appointment?(@appointment)
                    flash[:notice] = "Appointment successfully booked."
                    redirect_to user_appointment_path(@appointment.user_id, @appointment.id)
                end 
            end 
        else
            render :new 
        end
    end

    def show
        get_appointment_and_user
    end

    def edit 
        get_appointment_and_user
    end

    def update 
        @appointment = Appointment.find(params[:id])
        if @appointment.update(appointment_params)
            if logged_in?
                if is_users_appointment?(@appointment)
                    flash[:notice] = "Appointment Updated Successfully"
                    redirect_to appointment_path(@appointment.id)
                end 
            end 
        else 
            render :edit
        end
    end

    def destroy 
        @appointment = Appointment.find(params[:id])
        if logged_in?
            if is_users_appointment?(@appointment)
                @appointment.destroy 
                flash[:notice] = "Appointment Deleted"
                redirect_to root_path
            end 
        end 
    end

    private 

    def appointment_params 
        params.require(:appointment).permit(:time, :user_id, :employee_id)
    end

    def get_appointment_and_user
        @appointment = Appointment.find_by(id: params[:id])
        @user = User.find_by(id: @appointment.user_id)
    end

end