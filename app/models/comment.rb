class Comment < ActiveRecord::Base
  belongs_to :nota
  belongs_to :user
  attr_accessible :nota_id, :comment, :user_id
  validates :comment, :presence => true
  validates_length_of :comment, :within => 3..140
end
