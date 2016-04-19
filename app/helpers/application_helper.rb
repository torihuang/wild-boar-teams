module ApplicationHelper
  
  def authenticate!
    redirect_to session_new_path unless logged_in?
  end
end
