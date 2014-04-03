class ChangeSummonersColumnsToNull < ActiveRecord::Migration
  def change
    change_column :summoners, :summoner_id, :integer, limit: 8, null: true
    change_column :summoners, :profile_icon_id, :integer, null: true
    change_column :summoners, :level, :integer, null: true
    change_column :summoners, :revision_date, :datetime, null: true
  end
end
