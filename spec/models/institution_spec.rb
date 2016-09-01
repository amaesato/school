require 'rails_helper'

RSpec.describe Institution, type: :model do

  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should have_many(:periods)}
  end

  describe "#school_rate" do
    it "returns Excellent if rating is 5" do
      institution = FactoryGirl.create(:institution)
      expect(institution.school_rate).to eq('Excellent')
    end

    it "returns good if rating is below 3 or 4" do
      institution = FactoryGirl.create(:midgrade)
      expect(institution.school_rate).to eq('Good')
    end

    it "returns poor if rating is below 3" do
      institution = FactoryGirl.create(:f_rating)
      expect(institution.school_rate).to eq('Poor')
    end
  end

  context "ordering by name or rating" do
    before(:each) do
      @school1 = FactoryGirl.create(:f_rating)
      @school2 = FactoryGirl.create(:institution)
      @school3 = FactoryGirl.create(:midgrade)
    end

    it "orders institutions by name" do
      ordered = Institution.all.by_name
      expect(ordered.first).to eq(@school2)
      expect(ordered.last).to eq(@school1)
    end

    it "orders institutions by rating" do
      ordered = Institution.all.by_rating
      expect(ordered.first).to eq(@school1)
      expect(ordered.last).to eq(@school2)
    end
  end
end
