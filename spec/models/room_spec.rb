require 'rails_helper'

RSpec.describe Room, type: :model do
  context 'with name' do
    subject { build :room }
    it { is_expected.to be_valid }
  end

  context 'with nil name' do
    subject { build :room, name: nil }
    it { is_expected.to_not be_valid }
  end

  context 'with empty name' do
    subject { build :room, name: "" }
    it { is_expected.to_not be_valid }
  end

  context 'with used name' do
    let!(:room) { create :room, name: "Test name" }
    subject { build :room, name: "Test name" }
    it { is_expected.to_not be_valid }
  end
end
