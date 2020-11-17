class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :postage_payer
  belongs_to :prefecture
  belongs_to :handling_time

  with_options presence: true do
    validates :name
    validates :description
    validates :price,
              format: { with: /\A[0-9]+\z/, message: "Half-width number"},
              numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "Out of setting range"}
    validates :image
  end

  with_options numericality: { other_than: 0, message: "Select"} do
    validates :category_id
    validates :condition_id
    validates :postage_payer_id
    validates :prefecture_id
    validates :handling_time_id
  end

end
