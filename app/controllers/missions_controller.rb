class MissionsController < ApplicationController
  def index
    if params[:keyword]
      @missions = Mission.filter_by(params[:keyword])
    else
      # This is turned on to pass User Story
      # @missions = Mission.where(foreign_mission: true)
      @missions = Mission.all
    end
  end

  def new

  end

  def edit
    @mission = Mission.find(params[:id])
  end

  def update
    mission = Mission.find(params[:id])
    mission.update(mission_params)

    redirect_to "show_mission_path"
  end

  def mission_params
    params.permit(:mission_name, :mission_language, :country, :members_baptized, :foreign_mission)
  end

  def show
    @mission = Mission.find(params[:id])
  end

  def destroy
    mission = Mission.find(params[:id])
    mission.destroy

    redirect_to "/missions"
  end
end
