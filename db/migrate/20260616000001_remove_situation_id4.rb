class RemoveSituationId4 < ActiveRecord::Migration[7.0]
  def up
    Situation.where(id: 4).destroy_all
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
