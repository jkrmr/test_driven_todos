require 'rails_helper'

feature 'User creates a todo' do
  scenario 'successfully' do
    sign_in

    create_todo 'A new todo'

    expect(page).to display_todo('A new todo')
  end
end
