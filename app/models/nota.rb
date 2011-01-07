# == Schema Info
#
# Table name: notas
#
#  id          :integer(4)      not null, primary key
#  category_id :integer(4)
#  topic_id    :integer(4)
#  user_id     :integer(4)
#  body        :text
#  title       :string(255)
#  views       :integer(4)      default(0)
#  vote        :integer(4)      default(0)
#  created_at  :datetime
#  updated_at  :datetime

class Nota < ActiveRecord::Base
  belongs_to :user
  has_many :votes
  has_many :votantes, :through => :votes, :source => :user
  has_many :comments, :dependent => :destroy

  acts_as_taggable

  validates :title, :body, :user_id, :presence => true

  validates_length_of :title, :within => 3..20

  def self.pagination(page)
    all(:order => "created_at DESC").paginate(:page => page, :per_page => 6)
  end

  def was_voted_by(user)
    self.votantes.where(:id => user.id).count < 1
  end

  def add_view
    self.views = self.views + 1
    self.save
  end
end

