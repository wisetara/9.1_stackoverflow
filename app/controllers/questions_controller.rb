class QuestionsController < ApplicationController

before_filter :authorize, only: [:edit, :update]

  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to question_path(@question)
    else
      flash[:alert] = "New question not created."
      render 'new'
    end

    def show
      @question = Question.find(params[:id])
    end

    def edit
      @question = Question.find(params[:id])
    end

    def update
      @question - Question.find(params[:id])
      if @question.update(question_params)
        redirect_to question_path(@question)
      else
        flash[:alert] = "Question #{@question} did not update. Try again!"
        render 'edit'
      end
    end

    def destroy
      @question = Question.find(params[:id])
      @question.destroy
      flash[:alert] = "#{question.title} deleted!"
      redirect_to root_url
    end

    private

    def question_params
      params.require(:question).permit(:title, :content, :user_id)
    end
end
