class GrandchildrenController < ApplicationController
  def index
    @great_grandchildren = Descendent.where.not(grandparent_id: nil)
  end

  def edit

  end

#   def update

#   end

  def show
    @great_grandchild = Descendent.find(params[:id])
  end
