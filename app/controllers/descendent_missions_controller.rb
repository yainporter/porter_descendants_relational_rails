class DescendentMissionsController < ApplicationController
  def index
    @descendent = Descendent.find(params[:id])
    @missions = @descendent.missions
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

  def edit

  end

  def update

  end

  def show

  end

  def destroy

  end
end
