require 'rails_helper'

describe Todo, type: :model do
  it { should validate_presence_of(:title) }
  it { should belong_to(:user) }

  describe '#completed?' do
    it 'returns true if completed_at is set' do
      todo = build(:todo, completed_at: Time.current)

      expect(todo).to be_completed
    end

    it 'returns false if completed at is nil' do
      todo = build(:todo, completed_at: nil)

      expect(todo).to_not be_completed
    end
  end

  describe '#complete!' do
    it 'sets the :completed_at attribute' do
      todo = create(:todo)

      todo.complete!

      expect(todo).to be_completed
    end
  end
end
