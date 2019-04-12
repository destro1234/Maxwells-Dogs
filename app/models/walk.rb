class Walk < ActiveRecord::Base
  belongs_to :dogwalker
  has_many :dogwalks
  has_many :dogs, through: :dogwalks
end
