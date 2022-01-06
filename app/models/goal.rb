class Goal < ApplicationRecord
  belongs_to :user
  validate :goal_date_before_today
  validates :title, uniqueness: true
  validates :description, :date, :amount, presence: true

  def goal_date_before_today
    errors.add(:start_date, "must be after today") if date <= Date.today
  end
end
