class CreateAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :answers do |t|
      t.text :description, null: false

      t.references :user, index: true
      t.references :question, index: true

      t.timestamps
    end
  end
end
