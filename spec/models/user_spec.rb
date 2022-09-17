require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.new(
      name: 'Tom',
      photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
      bio: 'Teacher from Mexico.',
      posts_counter: 0
    )
  end

  before { subject.save }

  describe 'user' do
    it 'should have name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'should be an integer' do
      subject.posts_counter = 0
      expect(subject.posts_counter).to be_a(Integer)
    end
  end

  describe 'user recent posts' do
    it 'should return only the last 3 posts' do
      Post.create(author: subject, title: 'Hello', text: 'This is my first post')
      Post.create(author: subject, title: 'Hello', text: 'This is my first post')
      Post.create(author: subject, title: 'Hello', text: 'This is my first post')
      Post.create(author: subject, title: 'Hello', text: 'This is my first post')
      Post.create(author: subject, title: 'Hello', text: 'This is my first post')

      expect(subject.three_recent_posts.count).to eq(3)
    end
  end
end
