class AssignmentsController < ApplicationController
  before_action :set_assignment, only: [:show, :edit, :update, :destroy]
  before_action :set_course, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def show
    authorize(@assignment)
  end

  def edit
    @course = current_user.courses.find(params[:course_id])
  end

  def new
    @course = current_user.courses.find(params[:course_id])
    @assignment = current_user.assignments.new
    @assignment.course_id = @course.id
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
    if @assignment.update(assignment_params)
      redirect_to @course
    else
      render :edit
    end
  end

  def destroy
    authorize(@assignment)
    @assignment.destroy
    redirect_to :back
  end

  private

  def assignment_params
    params.require(:assignment).permit(:name, :date_due, :category, :points_earned, :total_points, :course_id)
  end

  def set_assignment
    @assignment = current_user.assignments.find(params[:id])
  end

  def set_course
    @course = current_user.courses.find(params[:course_id])
  end
end
