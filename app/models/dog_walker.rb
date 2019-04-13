class DogWalker < ActiveRecord::Base
  has_secure_password
  has_many :walks
end
