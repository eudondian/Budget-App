class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.references :group, null: false, foreign_key: true, index: true
      t.references :expense, null: false, foreign_key: true, index: true
      t.timestamps
    end
  end
end
