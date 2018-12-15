class CreateSnowballs < ActiveRecord::Migration[5.2]
  def change
    create_table :snowballs do |t|
      t.string :name

      t.timestamps
    end
  end
end
