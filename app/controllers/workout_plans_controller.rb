class WorkoutPlansController < ApplicationController
  def index
  end

  def new
    @plan = WorkoutPlan.new
  end
end
