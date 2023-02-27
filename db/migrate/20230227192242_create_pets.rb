class CreatePets < ActiveRecord::Migration[7.0]
  def change
    create_table :pets do |t|
      t.string :name
      t.string :species
      t.string :sex
      t.boolean :neutered
      t.integer :age
      t.text :special_instructions
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
