class DescendentsController < ApplicationController
  def index
    @descendents = Descendent.all.order(created_at: :desc)
  end
  def new

  end

  def create
    descendent = Descendent.new({
      first_name: params[:first_name],
      last_name: params[:last_name],
      birthday: params[:birthday],
      allergies: params[:allergies],
      languages: params[:languages],
      married: params[:married],
      grandchildren: params[:grandchildren]
    })
    descendent.save

    redirect_to "/descendents"
  end

  def edit
    @descendent = Descendent.find(params[:id])
  end

  def update
    descendent = Descendent.find(params[:id])
    descendent.update({
      first_name: params[:first_name],
      last_name: params[:last_name],
      birthday: params[:birthday],
      allergies: params[:allergies],
      languages: params[:languages],
      married: params[:married],
      grandchildren: params[:grandchildren]
    })
    descendent.save
    redirect_to "/descendents/#{descendent.id}"
  end

  def show
    @descendent = Descendent.find(params[:id])
    @missions_served = @descendent.missions.count
  end

  def destroy

  end
end
