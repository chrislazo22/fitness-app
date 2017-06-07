class HomepageController < ApplicationController
  def index
    @workout_plan = WorkoutPlan.all
  end
end
