require 'rails_helper'

RSpec.describe 'User show', type: :feature do
  User.destroy_all
  Post.destroy_all
  it 'displays the user profile picture' do
    author = User.create(name: 'daf', photo: 'https://robohash.org/daf', bio: 'teacher from Poland')
    visit "/users/#{author.id}"
    expect(page).to have_css('img')
  end
  it 'displays the user name' do
    author = User.create(name: 'henry', photo: 'https://robohash.org/hshshs/', bio: 'teacher from Poland')
    visit "/users/#{author.id}"
    expect(page).to have_content('henry')
  end
  it 'displays the number of posts for the user' do
    author = User.create(name: 'henry', photo: 'https://robohash.org/hshshs/', bio: 'teacher from Poland')
    Post.create(title: 'post1', text: 'text1', author:)
    Post.create(title: 'post2', text: 'text2', author:)
    visit "/users/#{author.id}"
    expect(page).to have_content('2')
  end
  it 'displays 3 posts for the user' do
    author = User.create(name: 'henry', photo: 'https://robohash.org/hshshs/', bio: 'teacher from Poland')
    Post.create(title: 'post1', text: 'text1', author:)
    Post.create(title: 'post2', text: 'text2', author:)
    Post.create(title: 'post3', text: 'text3', author:)
    Post.create(title: 'post4', text: 'text4', author:)
    Post.create(title: 'post5', text: 'text5', author:)
    visit "/users/#{author.id}"
    expect(page).to_not have_content('post1')
    expect(page).to_not have_content('post2')
    expect(page).to have_content('post3')
    expect(page).to have_content('post4')
  end
  it 'displays a button to see all the user posts' do
    author = User.create(name: 'fab', photo: 'https://robohash.org/fab/', bio: 'teacher')
    Post.create(title: 'post1', text: 'text1', author:)
    Post.create(title: 'post2', text: 'text2', author:)
    Post.create(title: 'post3', text: 'text3', author:)
    Post.create(title: 'post4', text: 'text4', author:)
    visit "/users/#{author.id}"
    expect(page).to have_button('See all posts')
  end
  it 'redirects to the posts show page when clicking see all post' do
    author = User.create(name: 'fab', photo: 'https://robohash.org/fab/', bio: 'teacher')
    Post.create(title: 'post1', text: 'text1', author:)
    Post.create(title: 'post2', text: 'text2', author:)
    Post.create(title: 'post3', text: 'text3', author:)
    Post.create(title: 'post4', text: 'text4', author:)
    visit "/users/#{author.id}"
    click_link 'See all posts'
    expect(page).to have_content('post1')
  end
  it 'redirects to the users posts index page when click see all posts' do
    author = User.create(name: 'fab', photo: 'https://robohash.org/fab/', bio: 'teacher')
    Post.create(title: 'post1', text: 'text1', author:)
    Post.create(title: 'post2', text: 'text2', author:)
    Post.create(title: 'post3', text: 'text3', author:)
    Post.create(title: 'post4', text: 'text4', author:)
    visit "/users/#{author.id}"
    click_link 'See all posts'
    expect(page).to have_content('post1')
    expect(page).to have_content('post2')
    expect(page).to have_content('post3')
    expect(page).to have_content('post4')
  end
end
