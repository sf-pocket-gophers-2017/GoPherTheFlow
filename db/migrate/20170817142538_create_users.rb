class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.string :email, null: false
      t.string :password_hash

      t.references :commentable, polymorphic: true, index: true
      t.references :voteable, polymorphic: true, index: true

      t.timestamps
    end
  end
end
