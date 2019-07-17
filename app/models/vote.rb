class Vote < ActiveRecord
 validates_presence_of :votable_type, :votable_id, :rating, :user_token

 enum :votable_type ["Landmark", "Recording"]
end
