class Youtubelist < ActiveRecord::Base

    belongs_to :user
    default_scope -> { order('created_at DESC')}
    validates :url, presence: true
    validates :user_id, presence: true
    validates :category, presence: true

end
