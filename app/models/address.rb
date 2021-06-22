class Address < ApplicationRecord

  belongs_to :customer

  def destination
    postal_code + address + name
  end

end
