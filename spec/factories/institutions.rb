FactoryGirl.define do
  factory :institution do
    name "Ann"
    grade_level 12
    mascot "bobcat"
    rating 5
  end

  factory :midgrade, class: Institution do
    name "Bob"
    grade_level 5
    mascot "bobcat"
    rating 4
  end

  factory :f_rating, class: Institution do
    name "Zed"
    grade_level 1
    mascot "bobcat"
    rating 2
  end
end
