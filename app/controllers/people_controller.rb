class PeopleController < ApplicationController
  def index
    @people = Person.all
  end

  def show
    @person = Person.find(params[:id])
    respond_to do |format|
      format.js
    end
  end
end
