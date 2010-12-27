class Nota < ActiveRecord::Base
  belongs_to :category
  belongs_to :topic
  has_many :comments, :dependent => :destroy
  acts_as_taggable

  define_index do
    indexes title
    indexes body
    #indexes :name, :sortable => true
    indexes comments.comment, :as => :comment_content
    #indexes [author.first_name, author.last_name], :as => :author_name

    #has author_id, created_at
    has topic_id, category_id,created_at
  end

  attr_accessible :title, :body, :topic_id, :category_id, :vote,:views, :tag_list

  validates :title, :body, :presence => true
  validates_length_of :title, :within => 3..20

  def self.pagination(page)
    all(:order => "created_at DESC").paginate(:page => page, :per_page => 8)
  end

  def add_view
    views = self.views + 1
    self.update_attributes(:views => views)
  end

end

