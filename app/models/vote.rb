class Vote < ApplicationRecord
 validates_presence_of :votable_type, :votable_id, :rating, :user_token

 enum votable_type: [Landmark: 0, Recording: 1]
end
