require 'rails_helper'

feature 'A given user sees only their own todos' do
  scenario 'A signed-in user can see their own todos' do
    user = create(:user_with_todos)
    other_user = create(:user_with_todos)
    sign_in user

    visit root_path

    expect(page).to have_content("#{user.email}'s todo")
    expect(page).not_to have_content("#{other_user.email}'s todo")
  end
end
