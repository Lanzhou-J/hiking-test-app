class TrailsController < ApplicationController
  def index
    trails = Trail.all
    render json: { trails: trails}
  end

  def create
    trail = Trail.new(trail_params)
    # p trail
    puts trail.errors.full_messages
    if trail.save
      render json:{}, status: :created
    else
      render json: {errors: trail.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    @trail = Trail.find(params[:id])
    @trail.destroy
    render json:{}, status: :no_content
  end

  def update
    @trail = Trail.find(params[:id])
    if @trail.update(trail_params)
      render json:{}, status: :no_content
    else
      render json: {errors: @trail.errors.full_messages}, status: :unprocessable_entity
    end
  end

  private

  def trail_params
    params.require(:trail).permit(:name,:distance,:difficulty,:location)
  end
end
