require 'spec_helper'

describe ElectiveGroup do
  it { should belong_to(:batch) }
  it { should have_many(:subjects) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:batch_id) }

  it { should_have_named_scope :for_batch }

  context "existing elective group" do
    before do
      @elective_group = Factory.build(:elective_group)
    end

    it 'must be new a active new record' do
      @elective_group.is_deleted.should_not be_true
      @elective_group.should be_new_record
    end

    it 'must be disabled' do
      @elective_group.inactivate
      @elective_group.is_deleted.should be_true
    end
  end
end
