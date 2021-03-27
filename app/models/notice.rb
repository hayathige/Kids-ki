class Notice < ApplicationRecord
     has_one_attached :image
     belongs_to :user
     has_many :comments
     has_many :likes, dependent: :destroy
     belongs_to :group
end
