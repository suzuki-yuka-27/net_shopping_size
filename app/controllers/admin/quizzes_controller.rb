class Admin::QuizzesController < Admin::BaseController
  before_action :set_quiz, only: %i[show edit update destroy]
  def index
    @quizzes = Quiz.all.order(id: :asc)
  end

  def new
    @quiz = Quiz.new
  end

  def create
    @quiz = current_user.quizzes.build(quiz_params)
    if @quiz.save
      redirect_to admin_quizzes_path
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @quiz.update(quiz_params)
      redirect_to admin_quizzes_path
    else
      render :new
    end
  end

  def destroy
    @quiz.destroy
    redirect_to admin_quizzes_path
  end

  private

  def quiz_params
    params.require(:quiz).permit(:question, :choice_1, :choice_2, :choice_3, :choice_4, :answer)
  end

  def set_quiz
    @quiz = current_user.quizzes.find(params[:id])
  end
end
