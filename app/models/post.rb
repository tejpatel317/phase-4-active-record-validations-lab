class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
    validate :must_have_clickbait_title

    PATTERNS = [ /Won't Believe/i , /Secret/i , /Top \d/i , /Guess/i]


    def must_have_clickbait_title
        condition = PATTERNS.none? do |t|
            t.match title
        end
        if condition
            errors.add(:title, "must be clickbait")
        end
    end
end
