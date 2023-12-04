class DescendentsController < ApplicationController
  def index
    @descendents = Descendent.all.order(created_at: :desc)

    if params[:sort]
      @descendents.order(:missions)
    end
  end
  def new

  end

  def create
    descendent = Descendent.create(descendent_params)

    redirect_to "/descendents"
  end

  def descendent_params
    params.permit(:first_name, :last_name, :birthday, :allergies, :languages, :married, :grandchildren)
  end
  def edit
    @descendent = Descendent.find(params[:id])
  end

  def update
    descendent = Descendent.find(params[:id])
    descendent.update(descendent_params)
    descendent.save
    redirect_to "/descendents/#{descendent.id}"
  end

  def show
    @descendent = Descendent.find(params[:id])
    @missions_served = @descendent.missions.count
  end
end
