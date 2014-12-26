class WordListsController < ApplicationController
  def index
    @categories = Category.all
    filter = params[:type_filter]
    @c = params[:category_id]
    case filter
    when 2.to_s
      @category = Category.find params[:category_id]
      @word_lists = @category.words
    when 1.to_s
      @word_lists = Word.learneds(session[:user_id], params[:category_id])
    else
      @word_lists = Word.not_learneds(session[:user_id], params[:category_id])
    end
  end
end
  