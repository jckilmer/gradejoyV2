class AssignmentsController < ApplicationController
  before_action :set_assignment, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def new
    @assignment = current_user.assignments.new
    authorize(@assignment)
  end

  def create
    @assignment = current_user.assignments.new(assignment_params)
    authorize(@assignment)
    if @assignment.save
      redirect_to(:back)
    else
      render :new
    end
  end

  def update
    authorize(@assignment)
  end

  def destroy
    authorize(@assignment)
  end

  private

  def assignment_params
    params.require(:course).permit(:name, :date_due, :category, :points_earned, :total_points)
  end
end
