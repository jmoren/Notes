class Nota < ActiveRecord::Base
  belongs_to :category
  belongs_to :topic
  attr_accessible :title, :body, :topic_id, :category_id

  validates_presence_of :title, :body, :topic_id, :category_id

  def self.pagination(page)
    all(:order => "created_at DESC").paginate(:page => page, :per_page => 12)
  end
end
