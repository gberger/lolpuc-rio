class AddAcronymToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :acronym, :string, null: false
  end
end
