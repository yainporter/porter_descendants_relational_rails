class MissionsController < ApplicationController
  def index
    @missions = Mission.all
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

  end

  def update

  end

  def show
    @mission = Mission.find(params[:id])
  end

  def destroy

  end
end
