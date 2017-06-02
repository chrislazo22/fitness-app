module Admin
  class WorkoutsController < ApplicationController

    before_action :set_workout, only: [:show, :edit, :update, :destory]

    def index
      @workouts = Workout.all
    end

    def show
    end

    def new
      @workout = Workout.new
    end

    def edit
    end

    def create
      @workout = Workout.new(workout_params)

      if @workout.save
        redirect_to admin_workouts_path, notice: 'Workout was successfully created.'
      else
        render :new
      end
    end

    def update
      if @workout.update(workout_params)
        redirect_to @workout, notice: 'Your topic was successfully updated.'
      else
        render :edit, notice: 'There was an error processing your request!'
      end
    end

    def destroy
      @workout.destroy
      redirect_to @workout, notice: 'Product was successfully destroyed.'
    end

    private

    def set_workout
      @workout = Workout.find(params[:id])
    end

    def workout_params
      params.require(:workout).permit(:name, :workout_type, :muscle_worked, :eqiupment, :difficulty)
    end
  end
end
