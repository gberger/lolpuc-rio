class RenameUserRoleToKind < ActiveRecord::Migration
  def change
    rename_column :users, :role, :kind
  end
end
