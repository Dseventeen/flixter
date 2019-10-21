class LessonsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_authorized_for_current_lesson.section.course
  def show
  end
end

  private

  def require_authorized_for_current_lesson.section.course
    if current_course.enrolled_in? != true
      redirect_to /courses/:id(.:format), alert: 'To access the cours, please enroll first'
    end
  end

  helper_method :current_lesson
  def current_lesson
    @current_lesson ||= Lesson.find(params[:id])
  end
  