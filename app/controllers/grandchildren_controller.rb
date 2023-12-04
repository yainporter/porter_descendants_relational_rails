class GrandchildrenController < ApplicationController
  def index
    @grandchildren = Grandchild.all
  end

  def new

  end

  def create
    grandchild = Descendent.create(descendent_params)

    redirect_to "/descendents"
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
