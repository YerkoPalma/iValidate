FactoryGirl.define do
  factory :easycount, class: Idea do
    name "Easycount"
    description "A web finances administration tool for startups"
    contact "info@easycount.com"
    avatar ""
    tags ["web", "finances", "startup"]
  end
  
  factory :fixar, class: Idea do
    name "fixAR"
    description "Augmented reallity to fix things"
    contact "info@fixar.com"
    avatar ""
    tags ["mobile", "AR", "augmented-reallity"]
  end
end