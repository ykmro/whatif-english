class RemoveSituationsWithMissingAssets < ActiveRecord::Migration[7.0]
  MISSING_THUMBNAILS = %w[
    top/situation_thum_zombie.png
    top/situation_thum_asteroid.png
  ].freeze

  def up
    Situation.where(thumbnail: MISSING_THUMBNAILS).each(&:destroy)
    Situation.where(id: 4).destroy_all
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
