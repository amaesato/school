FactoryGirl.define do
  factory :period do
    teacher "Mr. Smith"
    grade 1
    institution_id @institution_id
  end

  factory :period2, class: Period do
    teacher "Mr. Smith"
    grade 5
    institution_id @institution_id
  end

  factory :period3, class: Period do
    teacher "Mr. Smith"
    grade 10
    institution_id @institution_id
  end
end
