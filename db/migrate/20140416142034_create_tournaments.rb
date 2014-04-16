class CreateTournaments < ActiveRecord::Migration
  def change
    create_table :tournaments do |t|
      t.string :name, null: false
      t.text :edital

      t.timestamps
    end
  end
end
