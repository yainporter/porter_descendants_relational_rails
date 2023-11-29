class DescendantsController < ApplicationController
  def index
    @descendants = Descendant.all
  end

  def new

  end

  def create
    descendant = Descendant.new({
      first_name: params[:first_name],
      last_name: params[:last_name],
      birthday: params[:birthday],
      allergies: params[:allergies],
      languages: params[:languages],
      married: params[:married],
      grandchildren: params[:grandchildren]
    })
    descendant.save
    
    redirect_to "/tasks"
  end

  def edit

  end

  def update

  end

  def show
    Descendant.find(params{:id})
  end

  def destroy

  end
end
