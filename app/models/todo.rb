class Todo < ActiveRecord::Base
  validates :title, presence: true

  belongs_to :user, dependent: :destroy, counter_cache: true

  def completed?
    completed_at?
  end

  def complete!
    touch(:completed_at)
  end

  def mark_incomplete!
    update(completed_at: nil)
  end
end
