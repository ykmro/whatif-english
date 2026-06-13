class StepsController < ApplicationController
  def show
    @step = Step.find(params[:id])
    @choices = @step.choices.order("RANDOM()")
    @total_steps = Step.where(situation_id: @step.situation_id).count
  end

  def next
    @step = Step.find(params[:id])
    @next_step = @step.next_step

    session[:choice_ids] ||= []
    session[:choice_ids] << params[:choice_id]

    redirect_to result_step_path(@step)
  end

  def result
    @step = Step.find(params[:id])
    @next_step = @step.next_step
    @choice = Choice.find(session[:choice_ids].last.to_i)
  end
end
