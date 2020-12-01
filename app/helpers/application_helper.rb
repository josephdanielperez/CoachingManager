module ApplicationHelper

    def convert_time(datetime_object)
        datetime_object.strftime("%A, %B %e, %Y at %I:%M %p")
    end
    
end