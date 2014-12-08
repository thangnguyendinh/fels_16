class WordAnswer < ActiveRecord::Base
  belongs_to :word
  has_many :users_answer
  scope :correct, -> { where(correct: 1) }
end
