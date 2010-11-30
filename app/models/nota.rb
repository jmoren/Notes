class Nota < ActiveRecord::Base
  belongs_to :category
  belongs_to :topic

  acts_as_commentable
  acts_as_taggable

  attr_accessible :title, :body, :topic_id, :category_id, :vote,:views, :tag_list
  
  validates :title, :body, :topic_id, :category_id, :presence => true

  def self.pagination(page)
    all(:order => "created_at DESC").paginate(:page => page, :per_page => 8)
  end

  def add_view
    views = self.views + 1
    self.update_attributes(:views => views)
  end
  
end
