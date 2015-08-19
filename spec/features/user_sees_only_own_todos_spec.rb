require 'rails_helper'

feature 'A given user sees only their own todos' do
  scenario 'A signed-in user can see their own todos' do
    user, other_user = Array.new(2) { create(:user_with_todos) }
    sign_in user

    visit root_path

    expect(page).to display_todo("#{user.email}'s todo")
    expect(page).not_to display_todo("#{other_user.email}'s todo")
  end
end
