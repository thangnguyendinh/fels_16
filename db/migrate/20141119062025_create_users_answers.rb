class CreateUsersAnswers < ActiveRecord::Migration
  def change
    create_table :users_answers do |t|
      t.string :users_answer
      t.integer :status, :limit => 1
      t.references :user, index: true
      t.references :word, index: true

      t.timestamps
    end
  end
end
