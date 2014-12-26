class UsersAnswer < ActiveRecord::Base
  belongs_to :word
  belongs_to :lesson
  belongs_to :word_answer
  
end
