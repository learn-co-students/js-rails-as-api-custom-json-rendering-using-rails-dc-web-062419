class BirdsController < ApplicationController
  
  def index
    birds = Bird.all
    render json: birds.to_json(only: [:id, :name, :species])
    # the same as $except: [:created_at, :updated_at]
  end

  def show
    bird = Bird.find_by(id: params[:id])
    if bird
      render json: bird.slice(:id, :name, :species) # slice only works on single hashes
    else 
      render json: { message: 'Bird not found' }
    end
  end

end