class StudylogsController < ApplicationController
  before_action :require_login

  def index
    @study_logs = StudyLog.includes(:loggable).order(studied_at: :desc)
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
