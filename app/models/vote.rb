class Vote < ActiveRecord::Base
  validates_presence_of :rating
end
