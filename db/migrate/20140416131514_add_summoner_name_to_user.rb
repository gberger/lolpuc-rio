class AddSummonerNameToUser < ActiveRecord::Migration
  def change
    drop_table :summoners
    add_column :users, :summoner_name, :string
  end
end
