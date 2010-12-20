class AddUserIdToNotas < ActiveRecord::Migration
  def self.up
    add_column :notas, :user_id, :integer
  end

  def self.down
    remove_column :notas, :user_id
  end
end
