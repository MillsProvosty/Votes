class VoteSerializer
  def self.render(scores, attributes)
    upvotes = scores[:upvotes]
    downvotes = scores[:downvotes]
    votable_id = attributes[:votable_id]
    votable_type = attributes[:votable_type]
    {
      data: {
        type: votable_type,
        votable_id: votable_id,
        attributes: {
          upvotes: upvotes,
          downvotes: downvotes,
          total_score: upvotes - downvotes
        }
      }
    }
  end
end
