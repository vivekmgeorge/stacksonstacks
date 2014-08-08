class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :voteable_id
      t.string  :voteable_type
      t.boolean :up?

      t.timestamps
    end
  end
end

#what shud up? be? boolean?