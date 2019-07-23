class VoteSerializer
  include FastJsonapi::ObjectSerializer

  attributes :id, :votable_type, :votable_id, :rating, :user_token
end
