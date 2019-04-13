class Walk < ActiveRecord::Base
  belongs_to :dog_walker
  has_many :dog_walks
  has_many :dogs, through: :dog_walks
end
