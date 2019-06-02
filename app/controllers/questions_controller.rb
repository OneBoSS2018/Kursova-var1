class QuestionsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_question, only: [:show,:edit,:update,:destroy]

  def new
   @question = Question.new
  end

  def show
      @answers = Answer.where(question_id: @question.id)
      @answer= Answer.new
      respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    if current_user.admin
    @question = Question.new(questions_params)
      if @question.save
        redirect_to root_path
      else
        render 'new'
      end
    end
  end

  def destroy
    if @question.nil?
      redirect_to root_path
    else
    @question.destroy
    redirect_to root_path
  end
  end

  def edit
  end

  def update
    @question.update(questions_params)
    redirect_to root_path
  end


  def right
    @flag = false
  pp  @user = User.find(params[:id])
    @question = Question.find(params[:question_id])
    @user_answer = params[:user_answer]
    Answer.where(id: @user_answer).each do |x|
      if x.right
        @flag=true
    pp   @user.rating += 1
    pp   @user.save
        break
      end
    end
    respond_to do |format|
      format.js
    end

  end

  private

    def questions_params
      params.require(:question).permit(:text)
    end

    def find_question
      @question = Question.find(params[:id])
    end
end
