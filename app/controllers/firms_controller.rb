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

  def create
    the_firm = Firm.new
    the_firm.firm_name = params.fetch("query_firm_name")
    the_firm.user_id = params.fetch("query_user_id")

    if the_firm.valid?
      the_firm.save
      redirect_to("/firms", { :notice => "Firm created successfully." })
    else
      redirect_to("/firms", { :alert => the_firm.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_firm = Firm.where({ :id => the_id }).at(0)

    the_firm.firm_name = params.fetch("query_firm_name")
    the_firm.user_id = params.fetch("query_user_id")

    if the_firm.valid?
      the_firm.save
      redirect_to("/firms/#{the_firm.id}", { :notice => "Firm updated successfully."} )
    else
      redirect_to("/firms/#{the_firm.id}", { :alert => the_firm.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_firm = Firm.where({ :id => the_id }).at(0)

    the_firm.destroy

    redirect_to("/firms", { :notice => "Firm deleted successfully."} )
  end
end
