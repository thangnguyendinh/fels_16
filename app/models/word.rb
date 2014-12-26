class Word < ActiveRecord::Base
  belongs_to :category
  has_many :users_answers, dependent: :destroy
  has_many :word_answers, dependent: :destroy
  accepts_nested_attributes_for :word_answers
  scope :learneds, ->(user_id, category_id) do
  word_ids = UsersAnswer.select("word_id").where(user_id: user_id).to_sql
  where("id IN (#{word_ids}) AND category_id = ?", category_id)
  end

  scope :not_learneds, ->(user_id, category_id) do
  word_ids = UsersAnswer.select("word_id").where(user_id: user_id).to_sql
  where("id NOT IN (#{word_ids}) AND category_id = ?", category_id)
  end

  end	
