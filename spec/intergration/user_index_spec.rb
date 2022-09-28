require 'rails_helper'

RSpec.describe 'User index', type: :feature do
  Post.destroy_all
  User.destroy_all
  it 'displays the usernames of the users' do
    User.create(name: 'fab', photo: '', bio: 'teacher')
    User.create(name: 'daf', photo: '', bio: 'teacher')
    User.create(name: 'tina', photo: '', bio: 'teacher')
    visit '/users'
    expect(page).to have_content('tina')
    expect(page).to have_content('fab')
    expect(page).to have_content('daf')
  end

  it 'displays profile picture for each user' do
    User.create(name: 'henry', photo: 'https://robohash.org/fab', bio: 'teacher')
    User.create(name: 'daf', photo: 'https://robohash.org/daf', bio: 'teacher')
    visit '/users'
    expect(page).to have_css('img')
  end

  it 'displays the number of posts for each user' do
    user1 = User.create(name: 'tin', photo: '', bio: 'teacher')
    user2 = User.create(name: 'mina', photo: '', bio: 'teacher')
    Post.create(title: 'post1', text: 'text1', author: user1)
    3.times { Post.create(title: 'post2', text: 'text2', author: user2) }
    visit '/users'
    expect(page).to have_content('1')
    expect(page).to have_content('3')
  end

  it 'redirects to the user show page when clicking the username' do
    user1 = User.create(name: 'tom', photo: '', bio: 'teacher')
    Post.create(title: 'post1', text: 'text1', author: user1)
    visit '/users'
    click_link 'tom'
    expect(page).to have_content('teacher')
  end
end
