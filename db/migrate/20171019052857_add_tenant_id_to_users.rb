class AddTenantIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :tenant_id, :integer unless column_exists?(:users, :tenant_id)
  end
end
