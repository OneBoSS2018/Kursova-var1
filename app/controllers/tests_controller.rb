class TestsController < ApplicationController
  before_action :authenticate_user!
  def index
    @questions = Question.all
    @x=1
    @result=0
  end

  def start

  end
end
