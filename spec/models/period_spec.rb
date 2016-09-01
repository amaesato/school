require 'rails_helper'

RSpec.describe Period, type: :model do
  describe "validations" do
    it { should validate_presence_of(:teacher)}
    it { should validate_presence_of(:grade)}
    it { should belong_to(:institution)}
  end

  context "with institution" do
    before(:each) do
      @institution = FactoryGirl.create(:institution)
      @institution_id = @institution[:id]
    end

    describe "#teacher_name_grade" do
      it "names the teacher with their grade" do
        period = FactoryGirl.create(:period, :grade1, institution_id: @institution_id)
        expect(period.teacher_name_grade).to eq("Mr. Smith - grade 1")
      end
    end

    describe "#teacher_by_grade" do
      it "order teachers by grade" do
        grade1 = FactoryGirl.create(:period, :grade3, institution_id: @institution_id)
        grade2 = FactoryGirl.create(:period, :grade1, institution_id: @institution_id)
        grade3 = FactoryGirl.create(:period, :grade2, institution_id: @institution_id)
        ordered = Period.all.teacher_by_grade
        expect(ordered.first).to eq(grade2)
        expect(ordered.last).to eq(grade1)
      end
    end
  end
end
