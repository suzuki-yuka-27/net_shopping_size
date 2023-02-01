class QuizzesController < ApplicationController
  skip_before_action :require_login, only: %i[index]

  def Index
    @quizzes = Quiz.all.order(id: :asc)
  end
end
