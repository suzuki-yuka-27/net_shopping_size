class QuizzesController < ApplicationController
  def Index
    @quizzes = Quiz.all.order(id: :asc)
  end
end
