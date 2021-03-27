class User < ApplicationRecord
  
  attr_accessor :group_name
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :comments
  has_many :notices, dependent: :destroy
  has_many :likes, dependent: :destroy
  belongs_to :group
  
  def already_liked?(notice)
    self.likes.exists?(notice_id: notice.id)
  end
  
end
