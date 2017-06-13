module Admin
  class WorkoutsController < ApplicationController
    before_action :set_workout, only: [:show, :edit, :update, :destroy]

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
        redirect_to admin_workouts_path, notice: 'Your topic was successfully updated.'
      else
        render :edit, notice: 'There was an error processing your request!'
      end
    end

    def destroy
      @workout.destroy
      redirect_to admin_workouts_path, notice: 'Workout was successfully destroyed.'
    end

    def import
      begin
        Workout.import(params[:file])
        redirect_to admin_workouts_path, notice: 'Workout was successfully saved'
      rescue
        redirect_to admin_workouts_path, notice: "Failed"
      end
    end

    private

    def set_workout
      @workout = Workout.find(params[:id])
    end

    def workout_params
      params.require(:workout).permit(:name, :workout_type, :muscle_worked, :equipment, :difficulty, :workout_plan_id)
    end
  end
end
