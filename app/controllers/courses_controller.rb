class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @courses = current_user.courses
  end

  def show
    authorize(@course)
  end

  def new
    @course = current_user.courses.new
    authorize(@course)
  end

  def edit
    authorize(@course)
  end

  def create
    @course = current_user.courses.new(course_params)
    authorize(@course)
    @courses = current_user.courses
    if @course.save
      respond_with(@course, location: @course)
    else
      render :new
    end
  end

  def update
    authorize(@course)
    if @course.update(course_params)
      respond_with @course, location: @course, notice: 'Course was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    authorize(@course)
    @course.destroy
    redirect_to courses_url, notice: 'Course was successfully destroyed.'
  end

  private

  def set_course
    @course = Course.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:name, :time, :period, :user, :section)
  end
end
