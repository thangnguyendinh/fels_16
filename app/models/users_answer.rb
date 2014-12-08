class UsersAnswer < ActiveRecord::Base
  belongs_to :word
  belongs_to :lesson
end
