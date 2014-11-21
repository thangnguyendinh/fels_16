class CategoriesMenuController < ApplicationController

  def show
    @category = Category.all
    @word = Word.all
  end

end
