class VoteSerializer
  include FastJsonapi::ObjectSerializer

  attributes :id, :votable_type, :votable_id, :rating, :user_token

  attributes :total_score do |vote|
    hash = {
      :votable_id => vote.votable_id,
      :votable_type => vote.votable_type
    }
    scores = Vote.score_for_id_and_type(hash)
    scores[:upvotes] - scores[:downvotes]
  end
end
