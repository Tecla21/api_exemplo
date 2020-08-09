class AddColumnsRolesMasksToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :roles_masks, :integer, default: 0, null: false
  end
end
