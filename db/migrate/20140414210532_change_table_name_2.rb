class ChangeTableName2 < ActiveRecord::Migration
  def change
    rename_table :questions_tables, :questions
  end
end
