class Vote < ActiveRecord::Base
  validates_presence_of :votable_type,
                        :votable_id,
                        :rating,
                        :user_token

  enum votable_type: ["Landmark", "Recording"]

  def self.score_for_recording_id(id)
    relevant_votes = self.where(votable_type: "Recording", votable_id: id)

    upvotes = relevant_votes.where(rating: 1).count
    downvotes = relevant_votes.where(rating: -1).count
    total_score = upvotes - downvotes

    {upvotes: upvotes, downvotes: downvotes, total_score: total_score}
  end
end
