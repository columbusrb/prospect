class CreateCandidates < ActiveRecord::Migration[6.0]
  def change
    create_table :candidates do |t|
      t.string :first_name
      t.string :last_name
      t.text :bio
      t.boolean :professional
      t.string :picture
      t.text :why
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
