class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :body
      # Referencing a commentable in "the cloud" polymorphically
      t.references :commentable, polymorphic: true

      t.timestamps
    end
  end
end
