class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.text       :description
      t.integer    :commentable_id
      t.string     :commentable_type

      t.references :user, index: true

      t.references :voteable, polymorphic: true, index: true

      t.timestamps
    end
  end
end
