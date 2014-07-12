class Task < ActiveRecord::Base
  belongs_to :user
  belongs_to :assigned_user, class_name: 'User'

  validates :user, presence: true
  validates :assigned_user, presence: true
  validates :title, presence: true
  validates :due_at, presence: true
  validates :points,
            presence: true,
            numericality: { greater_than_zero: true,
                            less_than_or_equal_to: 100 }

  validate :advancing_status

  enum status: [:pending, :completed, :rejected, :approved]

  private
    # Only advancing of the status is allowed
    def advancing_status
      if Task.statuses[status_was] > Task.statuses[status]
        errors.add(:status, 'change is invalid')
      end
    end
end