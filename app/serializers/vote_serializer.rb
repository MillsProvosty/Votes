class VoteSerializer
  def self.render(scores, votable_id, votable_type)
    upvotes = scores[:upvotes]
    downvotes = scores[:downvotes]
    {
      data: {
        type: votable_type,
        id: votable_id,
        attributes: {
          upvotes: upvotes,
          downvotes: downvotes,
          total_score: upvotes - downvotes
        }
      }
    }
  end
end
