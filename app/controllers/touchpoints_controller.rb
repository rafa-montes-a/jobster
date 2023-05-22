class TouchpointsController < ApplicationController
  def index
    matching_touchpoints = Touchpoint.all

    @list_of_touchpoints = matching_touchpoints.order({ :created_at => :desc })

    render({ :template => "touchpoints/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_touchpoints = Touchpoint.where({ :id => the_id })

    @the_touchpoint = matching_touchpoints.at(0)

    render({ :template => "touchpoints/show.html.erb" })
  end

  def create
    the_touchpoint = Touchpoint.new
    the_touchpoint.description = params.fetch("query_description")
    the_touchpoint.date = params.fetch("query_date")
    the_touchpoint.notes = params.fetch("query_notes")
    the_touchpoint.contact_id = params.fetch("query_contact_id")

    if the_touchpoint.valid?
      the_touchpoint.save
      redirect_to("/contacts/#{the_touchpoint.contact_id}", { :notice => "Touchpoint created successfully." })
    else
      redirect_to("/contacts/#{the_touchpoint.contact_id}", { :alert => the_touchpoint.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_touchpoint = Touchpoint.where({ :id => the_id }).at(0)

    the_touchpoint.description = params.fetch("query_description")
    the_touchpoint.date = params.fetch("query_date")
    the_touchpoint.notes = params.fetch("query_notes")
    the_touchpoint.contact_id = the_touchpoint.contact.id

    if the_touchpoint.valid?
      the_touchpoint.save
      redirect_to("/contacts/#{the_touchpoint.contact.id}", { :notice => "Touchpoint updated successfully."} )
    else
      redirect_to("/contacts/#{the_touchpoint.contact.id}", { :alert => the_touchpoint.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_touchpoint = Touchpoint.where({ :id => the_id }).at(0)
    contact_id = the_touchpoint.contact_id

    the_touchpoint.destroy

    redirect_to("/contacts/#{contact_id}", { :notice => "Touchpoint deleted successfully."} )
  end
end
