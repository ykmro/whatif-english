class StudylogsController < ApplicationController
  before_action :require_login

  def index
    @study_logs = StudyLog.includes(:loggable).order(studied_at: :desc)
    @login_streak = current_user.login_streak
    @last_login_date = current_user.last_login_date
  end

  def show
    @study_log = StudyLog.find(params[:id])
  end

  private

  def require_login
    unless current_user
      flash[:notice] = "存在しないURLです。"
      redirect_to "/"
    end
  end
end
