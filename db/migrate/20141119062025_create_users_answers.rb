class CreateUsersAnswers < ActiveRecord::Migration
  def change
    create_table :users_answers do |t|
      t.references :word_answer, index: true
      t.integer :status, :limit => 1
      t.references :word, index: true
      t.references :lesson, index: true

      t.timestamps
    end
  end
end
  