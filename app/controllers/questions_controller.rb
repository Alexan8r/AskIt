# frozen_string_literal: true

class QuestionsController < ApplicationController
  include QuestionsAnswers
  before_action :set_question!, only: %i[show destroy edit update]
  before_action :fetch_tags, only: %i[new edit]
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
    @questions = Question.all_by_tags(params[:tag_ids])
    @questions = @questions.decorate
    @tags = Tag.where(id: params[:tag_ids]) if params[:tag_ids]
  end

  def new
    @question = Question.new
  end

  def create
    @question = current_user.questions.build question_params
    if @question.save
      flash[:success] = 'Question created!'
      redirect_to questions_path
    else
      render :'questions/new'
    end
  end

  def show
    load_question_answers
  end

  private

  def question_params
    params.require(:question).permit(:body, :title, tag_ids: [])
  end
end

def set_question!
  @question = Question.find params[:id]
end

def fetch_tags
  @tags = Tag.all
end

def find; end
