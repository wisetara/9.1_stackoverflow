class CreateQuestionsTable < ActiveRecord::Migration
  def change
    create_table :questions_tables do |t|
      t.string :title
      t.string :content
      t.integer :user_id

      t.timestamps
    end
  end
end
