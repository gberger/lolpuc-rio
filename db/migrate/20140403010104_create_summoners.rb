class CreateSummoners < ActiveRecord::Migration
  def change
    create_table :summoners do |t|
      t.string :name, null: false
      # 8 bytes (long)
      t.integer :summoner_id, limit: 8, null: false
      t.integer :profile_icon_id, null: false
      t.integer :level, null: false
      t.datetime :revision_date, null: false

      t.references :user, null: false

      t.timestamps
    end
  end
end
