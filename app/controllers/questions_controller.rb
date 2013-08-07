class QuestionsController < ApplicationController
  before_filter :authenticate_user!
  load_resource :except => [:index, :create]
  authorize_resource

  def index
    @questions = Question.all
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to @question, notice: 'Question was successfully created.'
    else
        render action: 'new'
    end
  end

  def update
    if @question.update(question_params)
      redirect_to @question, notice: 'Question was successfully updated.' 
    else
      render action: 'edit'
    end
  end

  def destroy
    @question.destroy
    redirect_to questions_url
  end

private

  # Never trust parameters from the scary internet, only allow the white list through.
  def question_params
    params.require(:question).permit(:text, :description, :position)
  end

end
