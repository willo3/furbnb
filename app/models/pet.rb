class Pet < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_one_attached :photo

  # include PgSearch::Model
  # pg_search_scope :search,
  #   against: [ :name, :species ],
  #   using: {
  #     tsearch: { prefix: true }
  #   }
end
