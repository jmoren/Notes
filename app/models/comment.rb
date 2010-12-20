class Comment < ActiveRecord::Base
  belongs_to :nota
  belongs_to :user

  attr_accessible :nota_id, :comment

  validates :comment, :user_id, :presence => true
  validates_length_of :comment, :within => 3..140
end

