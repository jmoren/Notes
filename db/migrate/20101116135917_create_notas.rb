class CreateNotas < ActiveRecord::Migration
  def self.up
    create_table :notas, :force => true do |t|
      t.string  :title
      t.text    :body
      t.integer :topic_id 
      t.integer :category_id
      t.integer :vote, :default => 0
      t.integer :views, :default => 0
      t.timestamps
    end
  end

  def self.down
    drop_table :notas
  end
end
