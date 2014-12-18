class Lesson < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :users_answers, dependent: :destroy
  accepts_nested_attributes_for :users_answers
end
