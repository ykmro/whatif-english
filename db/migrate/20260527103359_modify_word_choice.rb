class ModifyWordChoice < ActiveRecord::Migration[7.0]
  def change
    add_column :word_choices, :is_correct, :boolean
    remove_column :word_choices, :wrong_word_id, :integer
  end
end
