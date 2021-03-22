class Like < ApplicationRecord
    belongs_to :user
    belongs_to :notice
    
    validates_uniqueness_of :notice_id, scope: :notice_id
end
