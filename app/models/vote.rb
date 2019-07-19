class Vote < ActiveRecord::Base
  validates_presence_of :votable_type,
                        :votable_id,
                        :rating,
                        :user_token

  enum votable_type: ["Landmark", "Recording"]

  def self.score_for_id_and_type(id, votable_type)
    upvotes = relevant_votes(id, votable_type).where(rating: 1).count
    downvotes = relevant_votes(id, votable_type).where(rating: -1).count

    {upvotes: upvotes, downvotes: downvotes}
  end

  def self.relevant_votes(id, votable_type)
    self.where(votable_type: "Recording", votable_id: id)
  end
end
