class SituationsController < ApplicationController
  def index
    # トップページで一覧表示
  end

  def show
    situations = Situation.all
    @situation = situations.find(params[:id])
    @step = @situation.steps.first
  end

  def result
    # セッションで保持した選択肢を一覧表示
    sessions = session[:choice_ids]
    situations = Situation.all
    @situation = situations.find(params[:id])
    @choices = Choice.where(id: sessions)
    # 学習履歴に保存
    studylog = StudyLog.new(user_id: current_user.id, loggable: @situation, studied_at: Time.current)
    true_answers = @choices.where(is_correct: true)
    studylog.increment(:correct_count, true_answers.size)
    if studylog.save
      Rails.logger.debug "学習を保存しました。"
    else
      Rails.logger.debug studylog.errors.full_messages
    end
  end
end
