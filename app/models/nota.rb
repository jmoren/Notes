class Nota < ActiveRecord::Base
  belongs_to :category
  belongs_to :topic
  has_many :comments, :dependent => :destroy
  acts_as_taggable

  attr_accessible :title, :body, :topic_id, :category_id, :vote,:views, :tag_list
  
  validates :title, :body, :topic_id, :category_id, :presence => true
  validates_length_of :title, :within => 3..20

  def self.pagination(page)
    all(:order => "created_at DESC").paginate(:page => page, :per_page => 8)
  end

  def add_view
    views = self.views + 1
    self.update_attributes(:views => views)
  end
  
end
