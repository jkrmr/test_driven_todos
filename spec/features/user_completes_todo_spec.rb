require 'rails_helper'

feature 'User completes a todo' do
  scenario 'The user marks a todo as completed' do
    user = create(:user_with_todos)
    sign_in(user)

    click_on 'Mark complete', match: :first

    expect(page).to have_css '.todos li.completed', text: user.todos.first.title
  end
end
