class DescendentMissionsController < ApplicationController
  def index
    @descendent = Descendent.find(params[:id])
    @missions = @descendent.missions
    if params[:sort] == "mission_name"
      @missions = Mission.order_by_mission_name
    elsif params[:sort] == "filter"
      @missions = Mission.filter_by_members_baptized(params[:number])
    end
  end

  def new
    @descendent = Descendent.find(params[:id])
  end

  def create
    descendent = Descendent.find(params[:id])
    mission = descendent.missions.create(mission_params)

    redirect_to "/descendents/#{descendent.id}/missions"
  end

  def mission_params
    params.permit(:mission_name, :mission_language, :country, :members_baptized, :foreign_mission)
  end

  def edit
  end

  def update

  end

  def show

  end

  def destroy
    descendent = Descendent.find(params[:id])
    descendent.missions.each{|mission| mission.destroy}
    descendent.destroy

    redirect_to "/descendents"
  end
end
