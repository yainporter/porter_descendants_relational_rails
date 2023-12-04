class DescendentMissionsController < ApplicationController
  def index
    @descendent = Descendent.find(params[:id])
    @missions = @descendent.missions
    if params[:sort] == "mission_name"
      @missions = @missions.order(:mission_name)
    elsif params[:sort] == "filter"
      @missions = @missions.where("members_baptized > #{params[:number]}")
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
    params.permit(:mission_name, :mission_language, :country, :members_baptized, :service_mission)
  end

  def edit
    require 'pry'; binding.pry
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
