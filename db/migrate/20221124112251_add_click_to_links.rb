class AddClickToLinks < ActiveRecord::Migration[7.0]
  def change
    add_column :links, :clicked, :integer, default: 0
  end
end
