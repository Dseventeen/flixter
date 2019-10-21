class LessonsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_authorized_for_current_lesson.section.course
  def show
  end
end

  private

  def require_authorized_for_current_course
    if current_course.enrolled_in? != true
      redirect_to course_url, alert: 'To access the course, please enroll first'
    end
  end

  helper_method :current_lesson
  def current_lesson
    @current_lesson ||= Lesson.find(params[:id])
  end
  