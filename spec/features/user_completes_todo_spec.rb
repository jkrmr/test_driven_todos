require 'rails_helper'

feature 'User completes a todo' do
  scenario 'The user marks a todo as completed' do
    user = create(:user_with_todos)
    sign_in(user)

    click_on 'Mark complete', match: :first

    user.todos.each do |todo|
      expect(page).to display_completed_todo(todo.title)
    end
  end
end
