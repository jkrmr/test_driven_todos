module Features
  def sign_in(user = create(:user))
    visit root_path

    fill_in 'Email', with: user.email

    click_on 'Sign in'
  end
end
