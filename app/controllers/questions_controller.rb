# frozen_string_literal: true

class QuestionsController < ApplicationController
  before_action :set_question!, only: %i[show destroy edit update]

  def edit; end

  def update
    if @question.update question_params
      flash[:success] = 'Question updated!'
      redirect_to questions_path
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    if @question.destroy
      flash[:success] = 'Question deleted!'
      redirect_to questions_path
    end
  end

  def index
    @questions = Question.order(created_at: :desc).page params[:page]
    @questions = @questions.decorate
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new question_params
    if @question.save
      flash[:success] = 'Question created!'
      redirect_to questions_path
    else
      render :'questions/new'
    end
  end

  def show
    @question = @question.decorate
    @answer = @question.answers.build
    @answers = @question.answers.order(created_at: :desc).page(params[:page])
    @answers = @answers.decorate
  end

  private

  def question_params
    params.require(:question).permit(:body, :title)
  end
end

def set_question!
  @question = Question.find params[:id]
end

def find; end
