Rails.application.routes.draw do

  #HOME 

  get("/", { :controller => "jobs", :action => "index" })

  # Routes for the Question resource:

  # CREATE
  post("/insert_question", { :controller => "questions", :action => "create" })
          
  # READ
  get("/questions", { :controller => "questions", :action => "index" })
  
  get("/questions/:path_id", { :controller => "questions", :action => "show" })
  
  # UPDATE
  
  post("/modify_question/:path_id", { :controller => "questions", :action => "update" })
  
  # DELETE
  get("/delete_question/:path_id", { :controller => "questions", :action => "destroy" })

  #------------------------------

  # Routes for the Touchpoint resource:

  # CREATE
  post("/insert_touchpoint", { :controller => "touchpoints", :action => "create" })
          
  # READ
  get("/touchpoints", { :controller => "touchpoints", :action => "index" })
  
  get("/touchpoints/:path_id", { :controller => "touchpoints", :action => "show" })
  
  # UPDATE
  
  post("/modify_touchpoint/:path_id", { :controller => "touchpoints", :action => "update" })
  
  # DELETE
  get("/delete_touchpoint/:path_id", { :controller => "touchpoints", :action => "destroy" })

  #------------------------------

  # Routes for the Contact resource:

  # CREATE
  post("/insert_contact", { :controller => "contacts", :action => "create" })
  post("/insert_contact_from_job", { :controller => "contacts", :action => "create_from_job" })
  post("/insert_contact_from_firm", { :controller => "contacts", :action => "create_from_firm" })
          
  # READ
  get("/contacts", { :controller => "contacts", :action => "index" })
  
  get("/contacts/:path_id", { :controller => "contacts", :action => "show" })

  get("/contacts/edit/:path_id", { :controller => "contacts", :action => "edit" })
  
  # UPDATE
  
  post("/modify_contact/:path_id", { :controller => "contacts", :action => "update" })
  
  # DELETE
  get("/delete_contact/:path_id", { :controller => "contacts", :action => "destroy" })
  
  get("/delete_contact_from_job/:path_id/:job_id", { :controller => "contacts", :action => "destroy_from_job" })

  get("/delete_contact_from_firm/:path_id", { :controller => "contacts", :action => "destroy_from_firm" })

  #------------------------------

  # Routes for the Firm resource:

  # CREATE
  post("/insert_firm", { :controller => "firms", :action => "create" })
          
  # READ
  get("/firms", { :controller => "firms", :action => "index" })
  
  get("/firms/:path_id", { :controller => "firms", :action => "show" })

  get("/firms/edit/:path_id", { :controller => "firms", :action => "edit" })
  
  # UPDATE
  
  post("/modify_firm/:path_id", { :controller => "firms", :action => "update" })
  
  # DELETE
  get("/delete_firm/:path_id", { :controller => "firms", :action => "destroy" })

  #------------------------------

  # Routes for the Job resource:

  # CREATE
  post("/insert_job", { :controller => "jobs", :action => "create" })
  post("/insert_job_from_firm", { :controller => "jobs", :action => "create_from_firm" })
          
  # READ
  get("/jobs", { :controller => "jobs", :action => "index" })
  
  get("/jobs/:path_id", { :controller => "jobs", :action => "show" })

  get("/jobs/edit/:path_id", { :controller => "jobs", :action => "edit" })
  
  # UPDATE
  
  post("/modify_job/:path_id", { :controller => "jobs", :action => "update" })
  post("/modify_status_from_job/:path_id", { :controller => "jobs", :action => "update_from_job" })
  
  get("/modify_status_to_interview/:path_id", { :controller => "jobs", :action => "update_to_interview" })
  get("/modify_status_to_applied/:path_id", { :controller => "jobs", :action => "update_to_applied" })
  get("/modify_status_to_rejected/:path_id", { :controller => "jobs", :action => "update_to_rejected" })

  get("/modify_status_to_interview_from_job/:path_id", { :controller => "jobs", :action => "update_to_interview_from_job" })
  get("/modify_status_to_applied_from_job/:path_id", { :controller => "jobs", :action => "update_to_applied_from_job" })
  get("/modify_status_to_rejected_from_job/:path_id", { :controller => "jobs", :action => "update_to_rejected_from_job" })

  get("/modify_status_to_interview_from_firm/:path_id", { :controller => "jobs", :action => "update_to_interview_from_firm" })
  get("/modify_status_to_applied_from_firm/:path_id", { :controller => "jobs", :action => "update_to_applied_from_firm" })
  get("/modify_status_to_rejected_from_firm/:path_id", { :controller => "jobs", :action => "update_to_rejected_from_firm" })

  get("/modify_status_to_interview_from_edit/:path_id", { :controller => "jobs", :action => "update_to_interview_from_edit" })
  get("/modify_status_to_applied_from_edit/:path_id", { :controller => "jobs", :action => "update_to_applied_from_edit" })
  get("/modify_status_to_rejected_from_edit/:path_id", { :controller => "jobs", :action => "update_to_rejected_from_edit" })
  
  # DELETE
  get("/delete_job/:path_id", { :controller => "jobs", :action => "destroy" })
  get("/delete_job_from_firm/:path_id", { :controller => "jobs", :action => "destroy_from_firm" })

  #------------------------------

  # Routes for the User account:

  # SIGN UP FORM
  get("/user_sign_up", { :controller => "user_authentication", :action => "sign_up_form" })        
  # CREATE RECORD
  post("/insert_user", { :controller => "user_authentication", :action => "create"  })
      
  # EDIT PROFILE FORM        
  get("/edit_user_profile", { :controller => "user_authentication", :action => "edit_profile_form" })       
  # UPDATE RECORD
  post("/modify_user", { :controller => "user_authentication", :action => "update" })
  
  # DELETE RECORD
  get("/cancel_user_account", { :controller => "user_authentication", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM
  get("/user_sign_in", { :controller => "user_authentication", :action => "sign_in_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/user_verify_credentials", { :controller => "user_authentication", :action => "create_cookie" })
  
  # SIGN OUT        
  get("/user_sign_out", { :controller => "user_authentication", :action => "destroy_cookies" })
             
  #------------------------------

end
