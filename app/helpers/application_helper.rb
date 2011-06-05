module ApplicationHelper

  def login_nav(user)
    if current_user
      logged_in = "Logged in as #{current_user.handle}"
      if current_user.admin?
        logged_in << " (admin)" 
      else
        logged_in << " (#{current_user.points} points)"
      end
      text = "#{logged_in} | #{link_to 'Sign out', destroy_user_session_path}".html_safe
    else
      text = "#{link_to('Sign in', new_user_session_path)} | #{link_to('Sign up', new_user_registration_path)}".html_safe
    end
    
    content_tag(:div, text)
  end
  
  def nav_link(text, path, tab)
    if current_tab == tab
      link_to text, path, :class => "current"
    else
      link_to text, path
    end
  end
  
  def challenge_solved?(user, challenge)
    if user_signed_in?
      return user.challenges.include?(challenge)
    else
      false
    end
  end
  
  
  def current_tab
    @current_tab
  end
  
end
