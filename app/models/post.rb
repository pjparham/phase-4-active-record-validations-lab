class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
    validate :clickbait?
    # validate :must_be_fiction_or_nonfiction

    #custom validations

    CLICKBAIT_PATTERNS = [
        /Won't Believe/i,
        /Secret/i,
        /Top \d/i,
        /Guess/i
    ]

    def clickbait?
        if CLICKBAIT_PATTERNS.none? { |pat| pat.match title }
            errors.add(:title, "must be clickbait")
        end
    end

    # def must_be_fiction_or_nonfiction
    #     if (category != "Fiction" && category != "Non-Fiction")
    #         errors.add(:category, "is not included in the list")
    #     end
    # end

    # # def must_be_fiction_or_nonfiction
    # #     unless (category.downcase == "fiction" or category.downcase == "non-fiction")
    # #         errors.add(:category, 'Category must be Fiction or Non-Fiction')
    # #     end
    # end

end
