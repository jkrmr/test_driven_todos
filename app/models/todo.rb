class Todo < ActiveRecord::Base
  validates :title, presence: true

  belongs_to :user, dependent: :destroy, counter_cache: true
end
