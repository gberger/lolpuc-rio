class AddConfirmedToMember < ActiveRecord::Migration
  def change
    add_column :members, :confirmed, :boolean, default: false, null: false
    change_column :members, :leader, :boolean, default: false, null: false
  end
end
