module ApplicationHelper

    def convert_time(datetime_object)
        datetime_object.strftime("%A, %B %e, %Y at %I:%M %p")
    end

    def button_text
        if controller.action_name == "new"
           return "sign up"
        elsif controller.action_name == "edit"
           return "update"
        else
           return "submit"
        end
    end
    
end