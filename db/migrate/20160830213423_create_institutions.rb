class CreateInstitutions < ActiveRecord::Migration[5.0]
  def change
    create_table :institutions do |t|
      t.string :name, null: false
      t.integer :grade_level
      t.string :mascot
      t.integer :rating

      t.timestamps
    end
  end
end
