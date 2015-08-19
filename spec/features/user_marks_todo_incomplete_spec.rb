require 'rails_helper'

feature 'User marks a todo as incomplete' do
  scenario 'successfully' do
    sign_in
    create_todo 'A new todo'

    click_on 'Mark complete'
    click_on 'Mark incomplete'

    expect(page).to_not display_completed_todo('A new todo')
  end
end
