class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.integer :responsable_id
      t.string  :responsable_type
      t.string :body

      t.timestamps
    end
  end
end
