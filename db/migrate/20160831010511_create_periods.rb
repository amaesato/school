class CreatePeriods < ActiveRecord::Migration[5.0]
  def change
    create_table :periods do |t|
      t.string :teacher, null: false
      t.string :grade, null: false
      t.belongs_to :institution, foreign_key: true

      t.timestamps
    end
  end
end
