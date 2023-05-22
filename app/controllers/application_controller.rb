class ApplicationController < ActionController::Base
  before_action(:load_current_user)
  
  # Uncomment line 5 in this file and line 3 in UserAuthenticationController if you want to force users to sign in before any other actions.
  before_action(:force_user_sign_in)

  before_action(:define_status)
  before_action(:define_gpt_questions)
  
  def load_current_user
    the_id = session[:user_id]
    
    @current_user = User.where({ :id => the_id }).first
  end
  
  def force_user_sign_in
    if @current_user == nil
      redirect_to("/user_sign_in", { :notice => "You have to sign in first." })
    end
  end

  def define_status
    @status = ["Interview", "Applied", "Rejected"]
    @color = ["success", "warning", "danger"]
  end

  def define_gpt_questions
    @gpt_questions = [ "What are the main challenges of this company?", "Why would I like to work at this role?", "Questions you could get at this interview", "Questions you could ask your interviewer"]
  end

end
# Initial setup Rafa
