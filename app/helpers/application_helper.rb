module ApplicationHelper
  def button_text
    if controller.action_name == "new"
       return "Create Attraction"
    elsif controller.action_name == "edit"
       return "Update Attraction"
    else
       return "Submit"
    end
  end
end
