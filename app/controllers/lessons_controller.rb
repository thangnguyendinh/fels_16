class LessonsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def new   
    @lesson = Lesson.new user_id: session[:user_id],category_id: params[:category_id]
    @category = Category.find(params[:category_id])
    words = @category.words.order("RANDOM()").limit 5
    words.each do |word|
      @lesson.users_answers.build word_id: word.id
    end
  end

  def create                        
    @lesson = Lesson.new lesson_params
    @lesson.user_id = current_user.id
    @lesson.save
    render "show"
  end

  def show
    @lesson = Lesson.find params[:id]
  end

  private
    def lesson_params
      params.require(:lesson).permit(:user_id, :category_id,
                                                    users_answers_attributes: [:word_answer_id, :word_id])
    end

end
