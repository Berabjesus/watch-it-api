require 'rails_helper'

RSpec.describe Watchlist, type: :model do
  let(:test_user) { User.create(username: 'Example User', password: 'password', password_confirmation: 'password') }
  let(:subject) do
    described_class.new(
      title: 'Example title',
      link: 'example link',
      content: 'Example content',
      date: '12/12/2021',
      user_id: test_user.id
    )
  end

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'title cannot be less than 2' do
      subject.title = 't'
      expect(subject).not_to be_valid
    end

    it 'Content cannot be less than 2' do
      subject.content = 't'
      expect(subject).not_to be_valid
    end
  end

  describe 'Associations', type: :model do
    it { is_expected.to belong_to(:user) }
  end
  describe 'Validations', type: :model do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:link) }
    it { is_expected.to validate_presence_of(:content) }
    it { is_expected.to validate_presence_of(:date) }
  end
end
