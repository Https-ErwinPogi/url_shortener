class AddReferenceToUser < ActiveRecord::Migration[7.0]
  def change
    add_reference :links, :user
  end
end