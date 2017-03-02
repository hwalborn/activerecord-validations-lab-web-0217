class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: ["Fiction", "Non-Fiction"]}
  validate :clickbait

  def clickbait
    arr = ["Won't Believe", "Secret", "Top", "Guess"]
    arr.each do |word|
      if title && !title.include?(word)
        errors.add(:title, "Stop it!")
        return false
      else
        return true
      end
    end
  end
end
