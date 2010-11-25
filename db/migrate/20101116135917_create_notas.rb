class CreateNotas < ActiveRecord::Migration
  def self.up
    create_table :notas do |t|
      t.string  :title
      t.text    :body
      t.integer  :topic_id 
      t.integer :category_id
      t.timestamps
    end
  end

  def self.down
    drop_table :notas
  end
end
