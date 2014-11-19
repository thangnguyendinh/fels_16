class WordsController < ApplicationController
  def index
    @word = Word.all
  end

  def new
    @word = Word.new
    4.times {@word.word_answers.build}
    @category = Category.all
  end

  def create
    @word = Word.new word_params
    if @word.save
      redirect_to @word
    else
      render "new"
    end
  end

  def show
    @word = Word.find params[:id]
  end

  def edit
    @word = Word.find params[:id]
  end

  def update
    @word = Word.find params[:id]
    if @word.update_attributes word_params
      redirect_to @word
    else
      render "edit"
    end
  end

  def destroy
    @word = Word.find params[:id]
    @word.destroy
    redirect_to words_path
  end

  private
  def word_params
    params.require(:word).permit :content, :category_id, 
      word_answers_attributes: [:id, :content, :correct]
  end
end
