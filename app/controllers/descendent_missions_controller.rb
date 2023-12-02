class DescendentMissionsController < ApplicationController
  def index
    @descendent = Descendent.find(params[:id])
    @missions = @descendent.missions
  end
end
