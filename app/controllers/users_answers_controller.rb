class UsersAnswersController < ApplicationController
  def new
    @category_name = Category.where(id: params[:commit]).first.name
    @category_count = Word.where(category_id: params[:commit]).count
    @category_word = Word.limit(5)#where(category_id: params[:commit]).where.not(id: (UsersAnswer.select("word_id").where(status: 1))).limit(5)
    @word_answer = Array.new(4){Array.new(5)}
    i = 0
    @category_word.each do |f|
      for j in 0..4
        @word_answer[i][j] = WordAnswer.where(word_id: f.id)
      end
      i = i + 1
    end
  end

  def create 
    @i = 0
    if WordAnswer.where(word_id: params[:"word_id0"], correct: 1).first.content == params[:"word_answer0"]
      @s1 = [params[:word_content0], params[:word_answer0], true]
      @i = @i + 1
      UsersAnswer.create  user_id: session[:user_id], word_id: params[:"word_id0"], users_answer: params[:"word_answer0"], status: 1
    else
      @s1 = [params[:word_content1], params[:word_answer1], false]
      UsersAnswer.create  user_id: session[:user_id], word_id: params[:"word_id0"], users_answer: params[:"word_answer0"], status: 0
    end

    if WordAnswer.where(word_id: params[:"word_id1"], correct: 1).first.content == params[:"word_answer1"]
      @s2 = [params[:word_content1], params[:word_answer1], true]
      @i = @i + 1
      UsersAnswer.create  user_id: session[:user_id], word_id: params[:"word_id1"], users_answer: params[:"word_answer1"], status: 1
    else
      @s2 = [params[:word_content1], params[:word_answer1], false]
      UsersAnswer.create  user_id: session[:user_id], word_id: params[:"word_id1"], users_answer: params[:"word_answer1"], status: 0
    end

    if WordAnswer.where(word_id: params[:"word_id2"], correct: 1).first.content == params[:"word_answer2"]
      @s3 = [params[:word_content2], params[:word_answer2], true]
      @i = @i + 1
      UsersAnswer.create  user_id: session[:user_id], word_id: params[:"word_id2"], users_answer: params[:"word_answer2"], status: 1
    else
      @s3 = [params[:word_content2], params[:word_answer2], false]
      UsersAnswer.create  user_id: session[:user_id], word_id: params[:"word_id2"], users_answer: params[:"word_answer2"], status: 0
    end

    if WordAnswer.where(word_id: params[:"word_id3"], correct: 1).first.content == params[:"word_answer3"]
      @s4 = [params[:word_content4], params[:word_answer4], true]
      @i = @i + 1
      UsersAnswer.create  user_id: session[:user_id], word_id: params[:"word_id3"], users_answer: params[:"word_answer3"], status: 1
    else
      @s4 = [params[:word_content3], params[:word_answer3], false]
      UsersAnswer.create  user_id: session[:user_id], word_id: params[:"word_id3"], users_answer: params[:"word_answer3"], status: 0
    end

    if WordAnswer.where(word_id: params[:"word_id4"], correct: 1).first.content == params[:"word_answer4"]
      @s5 = [params[:word_content4], params[:word_answer4], true]
      @i = @i + 1
      UsersAnswer.create  user_id: session[:user_id], word_id: params[:"word_id4"], users_answer: params[:"word_answer4"], status: 1
    else
      @s5 = [params[:word_content4], params[:word_answer4], false]
      UsersAnswer.create  user_id: session[:user_id], word_id: params[:"word_id4"], users_answer: params[:"word_answer4"], status: 0
    end
    @s = [@s1, @s2, @s3, @s4 ,@s5]
    render "show"

    @category_name = params[:category_name]
    @count_words = params[:count_words]
  end

end
