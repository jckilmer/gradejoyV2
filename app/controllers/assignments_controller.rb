class AssignmentsController < ApplicationController
  before_action :set_assignment, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def show
    authorize(@assignment)
  end

  def new
    @course = Course.find(params[:course_id])
    @assignment = current_user.assignments.new
    @assignment.course_id = @course.id
    authorize(@assignment)
  end

  def create
    @course = Course.find(params[:course_id])
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
    params.require(:assignment).permit(:name, :date_due, :category, :points_earned, :total_points, :course_id)
  end

  def set_assignment
    @assignment = Assignment.find(params[:id])
  end
end
