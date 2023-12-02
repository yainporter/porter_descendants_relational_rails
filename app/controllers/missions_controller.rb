class MissionsController < ApplicationController
  def index
    @missions = Mission.where(service_mission: true)
  end

  def new

  end

  def create
    mission = Mission.new({
      mission_name: params[:mission_name],
      mission_language: params[:mission_language],
      country: params[:country],
      members_baptized: params[:members_baptized],
      service_mission: params[:service_mission]
    })
    mission.save

    redirect_to "/tasks"
  end

  def edit
    @mission = Mission.find(params[:id])
  end

  def update
    mission = Mission.find(params[:id])
    mission.update({
      mission_name: params[:mission_name],
      mission_language: params[:mission_language],
      country: params[:country],
      members_baptized: params[:members_baptized],
      service_mission: params[:service_mission]
    })
    mission.save
    redirect_to "/missions/#{mission.id}"
  end

  def show
    @mission = Mission.find(params[:id])
  end

  def destroy

  end
end
