# == Schema Info
#
# Table name: notas
#
#  id         :integer(4)      not null, primary key
#  user_id    :integer(4)
#  body       :text
#  title      :string(255)
#  views      :integer(4)      default(0)
#  created_at :datetime
#  updated_at :datetime

class Nota < ActiveRecord::Base
  belongs_to :user
  has_many :votes
  has_many :votantes, :through => :votes, :source => :user
  has_many :comments, :dependent => :destroy

  #sphinx indexes
  define_index do
    indexes title
    indexes body
    #indexes :name, :sortable => true
    indexes comments.comment, :as => :comment_content
    #indexes [author.first_name, author.last_name], :as => :author_name

    set_property :field_weights  => { 'title'               => 50,
                                      'body'                => 30,
                                      'comment_content'     => 1 }

    has created_at
  end

  acts_as_taggable



  validates :title, :body, :user_id, :presence => true

  #validates_length_of :title, :within => 3..20

  def self.pagination(page)
    all(:order => "created_at DESC").paginate(:page => page, :per_page => 6)
  end

  def was_voted_by(user)
    self.votantes.where(:id => user).count < 1
  end

  def add_view
    self.views = self.views + 1
    self.save
  end
end

