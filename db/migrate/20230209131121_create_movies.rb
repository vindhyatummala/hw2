class CreateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
      t.string "name"
      t.integer "year_released"
      t.string "rated"
      t.integer "studio_id"
      t.timestamps
    end
  end
end
