class RenameSpecialInstrucitionsToBeSpecialInstructions < ActiveRecord::Migration[7.0]
  def change
    rename_column :pets, :special_instrucitions, :special_instructions
  end
end
