class CreateWins < ActiveRecord::Migration
  def change
    create_table :wins do |t|
      t.integer :user_id
      t.integer :challenge_id

      t.timestamps
    end
  end
end
