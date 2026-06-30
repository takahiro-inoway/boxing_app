class Boxer < ApplicationRecord
  def self.search(search)
    if search
      where('name LIKE ? OR weight_class LIKE ?', "%#{search}%", "%#{search}%")
    else
      all
    end
  end
end