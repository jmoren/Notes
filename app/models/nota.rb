class Nota < ActiveRecord::Base
  belongs_to :category
  belongs_to :topic
  attr_accessible :title, :body, :topic_id, :category_id, :vote

  validates :title, :body, :topic_id, :category_id, :presence => true

  def self.pagination(page)
    all(:order => "created_at DESC").paginate(:page => page, :per_page => 8)
  end
end
