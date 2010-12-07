class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments, :force => true do |t|
      t.integer :nota_id
      t.text :comment
      t.timestamps
    end
  end

  def self.down
    drop_table :comments
  end
end
