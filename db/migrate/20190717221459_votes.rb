class Votes < ActiveRecord::Migration[5.2]
  def up
    create_table :votes do |t|
      t.integer  :votable_type
      t.integer  :votable_id
      t.integer  :rating
      t.string   :user_token

      t.timestamps
    end
  end
end
