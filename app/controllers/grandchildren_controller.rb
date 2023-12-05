class GrandchildrenController < ApplicationController
  def index
    @grandchildren = Descendent.where.not(parent_id: nil)
  end

#   def new

#   end

#   def create
#     grandchild = Descendent.grandchildren.create(grandchild_params)

#     redirect_to "/descendents"
#   end

  def edit

  end

#   def update

#   end

  def show
    @grandchild = Descendent.find(params[:id])
  end

#   def destroy

#   end

#   private

#   def grandchild_params
#     params.permit(:descendent_id, :name, :lives_at_home, :age, :hobbies, :location, :fun_fact)
#   end
end
