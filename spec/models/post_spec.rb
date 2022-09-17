require 'rails_helper'

RSpec.describe Post, type: :model do
  subject do
    user = User.new(
      name: 'Tom',
      photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
      bio: 'Teacher from Mexico.',
      posts_counter: 0
    )

    Post.create(
      author: user,
      title: 'Hello',
      text: 'This is my first post',
      comments_counter: 0,
      likes_counter: 0
    )
  end

  before { subject.save }

  describe 'Posts' do
    it 'should return a title' do
      subject.title = nil
      expect(subject).to_not be_valid
    end

    it 'should not be greater than 250 in length' do
      subject.title = 'tom' * 100
      expect(subject).to_not be_valid
    end

    it 'should be an integer - comments counter' do
      expect(subject.comments_counter).to be_a(Integer)
    end

    it 'should be greater than 0 - comments counter' do
      subject.comments_counter = -1
      expect(subject).to_not be_valid
    end

    it 'should be an integer - likes counter' do
      expect(subject.likes_counter).to be_a(Integer)
    end

    it 'should be greater than 0 - likes counter' do
      subject.likes_counter = -1
      expect(subject).to_not be_valid
    end

    it 'should return only five recent comments' do
      Comment.create(post: subject, author: subject.author, text: 'comment', id: 1)
      Comment.create(post: subject, author: subject.author, text: 'comment', id: 2)
      Comment.create(post: subject, author: subject.author, text: 'comment', id: 3)
      Comment.create(post: subject, author: subject.author, text: 'comment', id: 4)
      Comment.create(post: subject, author: subject.author, text: 'comment', id: 5)
      Comment.create(post: subject, author: subject.author, text: 'comment', id: 6)
      Comment.create(post: subject, author: subject.author, text: 'comment', id: 7)

      expect(subject.five_recent_comments.length).to eql 5
    end
  end
end
