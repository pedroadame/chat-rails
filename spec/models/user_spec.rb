require 'rails_helper'

RSpec.describe User, type: :model do
  context 'with name' do
    subject { build :user }
    it { is_expected.to be_valid }
  end

  context 'with nil name' do
    subject { build :user, name: nil }
    it { is_expected.to_not be_valid }
  end

  context 'with empty name' do
    subject { build :user, name: "" }
    it { is_expected.to_not be_valid }
  end
end
