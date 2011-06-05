class CreateChallenges < ActiveRecord::Migration
  def change
    create_table :challenges do |t|
      t.string :name
      t.text :description
      t.string :flag
      t.integer :points
      t.integer :category_id

      t.timestamps
    end
  end
end
