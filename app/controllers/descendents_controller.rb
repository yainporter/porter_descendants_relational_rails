require 'spec_helper'
class DescendentsController < ApplicationController
  def index
    @descendents = Descendent.all.sort_by{|key, value| :created_at}
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

    redirect_to "/tasks"
  end

  def edit

  end

  def update

  end

  def show
    @descendent = Descendent.find(params[:id])
  end

  def show_missions
    @descendent = Descendent.find(params[:id])
    @mission = @descendent.missions
  end
  def destroy

  end
end
