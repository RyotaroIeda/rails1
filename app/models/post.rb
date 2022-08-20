class Post < ApplicationRecord

    validates :title, {presence: true}
    validates :start_date, {presence: true}
    validates :end_date, {presence: true}
    validate :pretend_ago

    def pretend_ago
        errors.add(:end_date, 'は開始日以降に設定してください') if end_date.nil? || end_date < start_date
    end     
    
end
