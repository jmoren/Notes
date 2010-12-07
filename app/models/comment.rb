class Comment < ActiveRecord::Base
  belongs_to :nota
  attr_accessible :nota_id, :comment
  validates :comment, :presence => true
  validates_length_of :comment, :within => 3..140
end
