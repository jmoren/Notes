class CreateNotas < ActiveRecord::Migration
  def self.up
    create_table :notas, :force => true do |t|
      t.string  :title
      t.text    :body
      t.integer :user_id
      t.integer :views, :default => 0
      t.timestamps
    end
  end

  def self.down
    drop_table :notas
  end
end
