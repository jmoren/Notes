class Nota < ActiveRecord::Base
  belongs_to :user
  has_many :votes
  has_many :votantes, :through => :votes, :source => :user
  has_many :comments, :dependent => :destroy
  acts_as_taggable

  attr_accessible :title, :body, :views, :tag_list,:user_id
  
  validates :title, :body, :presence => true
  validates_length_of :title, :within => 3..20

  def self.pagination(page)
    all(:order => "created_at DESC").paginate(:page => page, :per_page => 6)
  end
  def was_voted_by(user)
    self.votantes.where(:id => user.id).count < 1
  end
  def add_view
    views = self.views + 1
    self.update_attributes(:views => views)
  end
  
end
