class Cook < ApplicationRecord

belongs_to       :user
has_one_attached :image

extend ActiveHash::Associations::ActiveRecordExtensions
belongs_to_active_hash :category_id
belongs_to_active_hash :time_id


with_options presence: true do
  validates :title
  validates :catch_copy
  validates :material
  validates :making
end
with_options presence: true,numericality: { other_than: 1 } do
  validates :category_id
  validates :time_id
end
end
