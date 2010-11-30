class Category < ActiveRecord::Base
  has_many :notas

  def notes
   self.notas.size
  end
end
