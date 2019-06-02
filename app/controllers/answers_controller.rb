class AnswersController < ApplicationController
  before_action :authenticate_user!

  def create
  	params[:answer][:question_id] = params[:question_id]
  	@answer = Answer.create(answer_params)
    if @answer.save
    else
      @answer.errors.full_messages.each do |msg|
       @msg = msg
      end
      flash[:notice] = "#{@msg}"
    end
    redirect_to tests_index_path
  end

  def destroy
      @question = Question.find(params[:question_id])
      @answer = @question.answer.find(params[:id])
      @answer.destroy
      redirect_to tests_index_path
    end
  private

  	def answer_params
  		params.require(:answer).permit(:text, :question_id, :right)
  	end

end
