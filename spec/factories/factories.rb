FactoryGirl.define do
  factory :company do
    sequence :name do |n|
      "ESPN#{n}"
    end
  end

  factory :category do
    sequence :title do |n|
      "Web Development#{n}"
    end
  end

  factory :job do
    sequence :title do |n|
      "Developer#{n}"
    end
    level_of_interest 50
    city "Boulder"
    company {Company.find_or_create_by(name: "ESPN")}
    category {Category.find_or_create_by(title: "Web Development")}
  end
end