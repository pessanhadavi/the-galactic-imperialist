class PeopleController < ApplicationController
  def index
    if params[:query].present?
      @people = Person.where("people.name @@ :query", query: "%#{params[:query]}%")
    else
      @people = Person.all.order(:name)
    end
  end

  def show
    @person = Person.find(params[:id])
    respond_to do |format|
      format.js
    end
  end
end
