FactoryGirl.define do
  factory :period do
    institution_id @institution_id

    trait :grade1 do
      teacher "Mr. Smith"
      grade 1
    end

    trait :grade2 do
      teacher "Mrs. Smith"
      grade 2
    end

    trait :grade3 do
      teacher "Miss. Smith"
      grade 3
    end
  end
end
