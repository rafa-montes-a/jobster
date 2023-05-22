class FirmsController < ApplicationController
  def index
    matching_firms = Firm.all

    @list_of_firms = matching_firms.order({ :created_at => :desc })

    render({ :template => "firms/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_firms = Firm.where({ :id => the_id })

    @the_firm = matching_firms.at(0)

    render({ :template => "firms/show.html.erb" })
  end

  def edit
    the_id = params.fetch("path_id")

    matching_firms = Firm.where({ :id => the_id })

    @the_firm = matching_firms.at(0)

    render({ :template => "firms/edit.html.erb" })
  end

  def create
    the_firm = Firm.new
    the_firm.firm_name = params.fetch("query_firm_name")
    the_firm.user_id = params.fetch("query_user_id")

    if the_firm.valid?
      the_firm.save
      redirect_to("/firms", { :notice => "Company created successfully." })
    else
      redirect_to("/firms", { :alert => the_firm.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_firm = Firm.where({ :id => the_id }).at(0)

    the_firm.firm_name = params.fetch("query_firm_name")
    the_firm.user_id = @current_user.id

    if the_firm.valid?
      the_firm.save
      
      the_firm.contacts.each do |a_contact|
        a_contact.firm_name = the_firm.firm_name
        a_contact.save
      end

      the_firm.jobs.each do |a_job|
        a_job.firm_name = the_firm.firm_name
        a_job.save
      end

      redirect_to("/firms/#{the_firm.id}", { :notice => "Company updated successfully."} )
    else
      redirect_to("/firms/#{the_firm.id}", { :alert => the_firm.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_firm = Firm.where({ :id => the_id }).at(0)

    if the_firm.contacts.count == 0 && the_firm.jobs.count == 0
      the_firm.destroy
      redirect_to("/firms", { :notice => "Company deleted successfully."} )
    else
      redirect_to("/firms/#{the_firm.id}", { :alert => "You can only delete a company if it has 0 Job Applications and 0 Contacts."} )
    end
  end


end
