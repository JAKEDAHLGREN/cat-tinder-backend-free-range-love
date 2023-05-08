class CowsController < ApplicationController
    def index
        cows = Cow.all
        render json: cows
    end
  
    def create
        cow = Cow.create(cow_params)
        if cow.valid?
            render json: cow
        else
            render json: cow.errors, status: 422
        end
    end
  
    def update
      cow = Cow.find(params[:id])
      cow.update(cow_params)
      if cow.valid?
        render json: cow
      else
        render json: cow.errors, status: 422 
      end
    end
  
    def destroy
      cow = Cow.find(params[:id])
      cow.destroy
    end
    
  private
  def cow_params
    params.require(:cow).permit(:name, :age, :enjoys, :color, :species, :image)
  end
end
