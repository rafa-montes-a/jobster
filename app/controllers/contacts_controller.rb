class ContactsController < ApplicationController
  def index
    matching_contacts = Contact.all

    @list_of_contacts = matching_contacts.order({ :created_at => :desc })

    render({ :template => "contacts/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")
    matching_contacts = Contact.where({ :id => the_id })
    @the_contact = matching_contacts.at(0)

    render({ :template => "contacts/show.html.erb" })
  end

  def edit
    the_id = params.fetch("path_id")
    matching_contacts = Contact.where({ :id => the_id })
    @the_contact = matching_contacts.at(0)

    render({ :template => "contacts/edit.html.erb" })
  end

  def create
    the_contact = Contact.new
    the_contact.first_name = params.fetch("query_first_name")
    the_contact.last_name = params.fetch("query_last_name")
    the_contact.firm_name = params.fetch("query_firm_name")
    the_contact.role = params.fetch("query_role")
    the_contact.email = params.fetch("query_email")
    the_contact.user_id = @current_user.id

    user_firms = @current_user.firms

    if the_contact.valid?

      if user_firms.exists?(firm_name: the_contact.firm_name)
        the_contact.firm_id = user_firms.find_by(firm_name: the_contact.firm_name).id
      else
        the_firm = Firm.new
        the_firm.firm_name = the_contact.firm_name
        the_firm.user_id = @current_user.id
        the_firm.save
        the_contact.firm_id = the_firm.id
      end

      the_contact.save
      redirect_to("/contacts", { :notice => "Contact created successfully." })
    else
      redirect_to("/contacts", { :alert => the_contact.errors.full_messages.to_sentence })
    end
  end

  def create_from_job
    the_contact = Contact.new
    the_contact.first_name = params.fetch("query_first_name")
    the_contact.last_name = params.fetch("query_last_name")
    the_contact.firm_name = params.fetch("query_firm_name")
    the_contact.role = params.fetch("query_role")
    the_contact.email = params.fetch("query_email")
    the_contact.firm_id = @current_user.firms.where({ :firm_name => the_contact.firm_name }).at(0).id
    the_contact.user_id = @current_user.id
    the_job_id = params.fetch("query_job_id")

    if the_contact.valid?
      the_contact.save
      redirect_to("/jobs/#{the_job_id}", { :notice => "Contact created successfully." })
    else
      redirect_to("/jobs/#{the_job_id}", { :alert => the_contact.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_contact = Contact.where({ :id => the_id }).at(0)

    the_contact.first_name = params.fetch("query_first_name")
    the_contact.last_name = params.fetch("query_last_name")
    the_contact.firm_name = params.fetch("query_firm_name")
    the_contact.role = params.fetch("query_role")
    the_contact.email = params.fetch("query_email")
    the_contact.status = params.fetch("query_status")
    the_contact.firm_id = params.fetch("query_firm_id")
    the_contact.user_id = params.fetch("query_user_id")

    if the_contact.valid?
      the_contact.save
      redirect_to("/contacts/#{the_contact.id}", { :notice => "Contact updated successfully."} )
    else
      redirect_to("/contacts/#{the_contact.id}", { :alert => the_contact.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_contact = Contact.where({ :id => the_id }).at(0)

    the_contact.destroy

    redirect_to("/contacts", { :notice => "Contact deleted successfully."} )
  end

  def destroy_from_job
    the_id = params.fetch("path_id")
    the_contact = Contact.where({ :id => the_id }).at(0)
    job_id = params.fetch("job_id")

    the_contact.destroy

    redirect_to("/jobs/#{job_id}", { :notice => "Contact deleted successfully."} )
  end

end
