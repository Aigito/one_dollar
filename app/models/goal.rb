class Goal < ApplicationRecord
  belongs_to :user
  validate :goal_date_before_today
  validates :description, :date, presence: true
  validates :title, presence: true, uniqueness: true
  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :recurring_investment, presence: true, numericality: { greater_than: 0, less_than: :amount }

  def goal_date_before_today
    errors.add(:date, "must be after today") if date <= Date.today
  end
  # validates_date :date, after: :today (if want to use gem 'validates_timeliness', '~> 6.0.0.beta2')

end
