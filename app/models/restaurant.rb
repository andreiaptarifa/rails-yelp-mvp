class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy
  #  :dependent →  relacao de reviews com Restaurant
  #  :destroy →  o que fazer se nao houver o restaurant daquele(s) review(s)

  validates :name, :address, :phone_number, :category, presence: true
  validates :category, inclusion: { in: %w([chinese italian japanese french belgian) }
end
