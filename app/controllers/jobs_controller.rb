class JobsController < ApplicationController
  def index
    matching_jobs = Job.all

    @list_of_jobs = matching_jobs.order({ :updated_at => :desc })

    render({ :template => "jobs/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_jobs = Job.where({ :id => the_id })

    @the_job = matching_jobs.at(0)

    render({ :template => "jobs/show.html.erb" })
  end

  def edit
    the_id = params.fetch("path_id")

    matching_jobs = Job.where({ :id => the_id })

    @the_job = matching_jobs.at(0)

    render({ :template => "jobs/edit.html.erb" })
  end

  def create
    the_job = Job.new
    the_job.firm_name = params.fetch("query_firm_name").titleize
    the_job.role = params.fetch("query_role").titleize
    the_job.job_desc_link = params.fetch("query_job_desc_link")
    the_job.follow_up_link = params.fetch("query_follow_up_link")
    the_job.country = params.fetch("query_country")
    the_job.state = params.fetch("query_state")
    the_job.city = params.fetch("query_city")
    the_job.job_desc = params.fetch("query_job_desc")
    the_job.job_number = params.fetch("query_job_number")
    the_job.status = params.fetch("query_status")
    the_job.user_id = @current_user.id

    user_firms = @current_user.firms

    if user_firms.exists?(firm_name: the_job.firm_name)
      the_job.firm_id = user_firms.find_by(firm_name: the_job.firm_name).id
    else
      the_firm = Firm.new
      the_firm.firm_name = the_job.firm_name  
      the_firm.user_id = @current_user.id    
      the_firm.save
      the_job.firm_id = the_firm.id
    end

    if the_job.valid?
      the_job.save
      redirect_to("/jobs", { :notice => "Job created successfully." })
    else
      redirect_to("/jobs", { :alert => the_job.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_job = Job.where({ :id => the_id }).at(0)

    the_job.firm_name = params.fetch("query_firm_name").titleize
    the_job.role = params.fetch("query_role").titleize
    the_job.job_desc = params.fetch("query_job_desc")
    the_job.job_desc_link = params.fetch("query_job_desc_link")
    the_job.follow_up_link = params.fetch("query_follow_up_link")
    the_job.status = params.fetch("query_status")
    the_job.summary_job_desc = params.fetch("query_summary_job_desc")
    the_job.country = params.fetch("query_country")
    the_job.city = params.fetch("query_city")
    the_job.state = params.fetch("query_state")
    the_job.job_number = params.fetch("query_job_number")
    the_job.firm_id = params.fetch("query_firm_id")
    the_job.user_id = params.fetch("query_user_id")

    if the_job.valid?
      the_job.save
      redirect_to("/jobs/#{the_job.id}", { :notice => "Job updated successfully."} )
    else
      redirect_to("/jobs/#{the_job.id}", { :alert => the_job.errors.full_messages.to_sentence })
    end
  end

  def update_from_job
    the_id = params.fetch("path_id")
    the_job = Job.where({ :id => the_id }).at(0)

    the_job.status = params.fetch("query_status")

    if the_job.valid?
      the_job.save
      redirect_to("/jobs/#{the_job.id}", { :notice => "Job updated successfully."} )
    else
      redirect_to("/jobs/#{the_job.id}", { :alert => the_job.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_job = Job.where({ :id => the_id }).at(0)

    the_job.destroy

    redirect_to("/jobs", { :notice => "Job deleted successfully."} )
  end
end
