class CowsController < ApplicationController
    def index
        cows = Cow.all
        render json: cows
    end
  
    def create
        cow = Cow.create(cow_params)
        render json: cow
    end
  
    def update
    end
  
    def destroy
    end
  private
  def cow_params
    params.require(:cow).permit(:name, :age, :enjoys, :color, :species, :image)
  end
end
