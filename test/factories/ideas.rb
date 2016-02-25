FactoryGirl.define do
  factory :easycount, class: Idea do
    name 'Easycount'
    description 'A web finances administration tool for startups'
    contact 'info@easycount.com'
    avatar 'YW55IGNhcm5hbCBwbGVhc3VyZQ=='
    tags %w[web finances startup]
  end
  
  factory :fixar, class: Idea do
    name 'fixAR'
    description 'Augmented reallity to fix things'
    contact 'info@fixar.com'
    avatar 'www.placehold.it/120x120.jpg'
    tags %w[mobile AR augmented-reallity]
  end
end
