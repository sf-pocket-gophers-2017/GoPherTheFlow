class CreateVotes < ActiveRecord::Migration[5.1]
  def change
    create_table :votes do |t|
      t.integer    :voteable_id
      t.string     :voteable_type

      t.references :user, index: true

      t.references :commentable, polymorphic: true, index: true

      t.timestamps
    end
  end
end
