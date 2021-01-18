class Subscription < ApplicationRecord
  belongs_to :user, optional: true
  has_many :products

  # def self.add_decimal(s)
  #   pfx = [ '0.00', '0.0', '0.' ]
  #   if(pfx[s.length])
  #     s = pfx[s.length] + s
  #   else
  #     s = s.dup
  #     s[-2, 0] = '.'
  #   end
  #   s
  # end

end
