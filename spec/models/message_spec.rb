require 'rails_helper'

RSpec.describe Message, type: :model do
  context 'with content' do
    subject { build :message }
    it { is_expected.to be_valid }
  end

  context 'with empty content' do
    subject { build :message, content: "" }
    it { is_expected.to_not be_valid }
  end

  context 'with nil content' do
    subject { build :message, content: nil }
    it { is_expected.to_not be_valid }
  end
end
