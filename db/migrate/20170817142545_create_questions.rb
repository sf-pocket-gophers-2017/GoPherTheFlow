class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.string :title, null: false, limit: 64
      t.text   :description

      t.references :user, index: true

      t.references :commentable, polymorphic: true, index: true
      t.references :voteable, polymorphic: true, index: true

      t.timestamps
    end
  end
end
