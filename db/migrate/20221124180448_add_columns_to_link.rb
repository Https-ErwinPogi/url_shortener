class AddColumnsToLink < ActiveRecord::Migration[7.0]
  def change
    add_column :links, :ip_address, :string
    add_column :links, :user_agent, :string
  end
end
