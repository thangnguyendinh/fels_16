class Word < ActiveRecord::Base
  belongs_to :category
  has_many :users_answers, dependent: :destroy
  has_many :word_answers, dependent: :destroy
  accepts_nested_attributes_for :word_answers
end
