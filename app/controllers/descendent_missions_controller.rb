class DescendentMissionsController < ApplicationController
  def index
    @descendent = Descendent.find(params[:id])
    @missions = @descendent.missions
    if params[:sort] == "mission_name"
      @missions = @missions.order(:mission_name)
    end
  end

  def new
    @descendent = Descendent.find(params[:id])
  end

  def create
    descendent = Descendent.find(params[:id])
    mission = Mission.new({
      descendent_id: params[:id],
      mission_name: params[:mission_name],
      mission_language: params[:mission_language],
      country: params[:country],
      members_baptized: params[:members_baptized],
      service_mission: params[:service_mission]
    })
    mission.save
    redirect_to "/descendents/#{descendent.id}/missions"
  end

  def sort
    @descendent = Descendent.find(params[:id])
    @missions = @descendent.missions.order(:mission_name)
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
