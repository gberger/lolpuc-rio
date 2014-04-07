class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name, null: false

      t.timestamps
    end

    create_table :members do |t|
      t.boolean :leader, default: false, null: false
      t.string :role
      t.integer :user_id, null: false
      t.integer :team_id, null: false

      t.timestamps
    end
  end
end
