class Category < ActiveRecord::Base
  has_many :Words, dependent: :destroy
end
