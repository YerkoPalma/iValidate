FactoryGirl.define do
  # Easycount
  factory :easycount_canvas, class: Canvas do
    key_partners            = { description: 'Key partners description',
                                tags: %w[startups companies salesman] }
    key_activities          = { description: 'Key partners description',
                                tags: %w[finances SaaS management] }
    key_resources           = { description: 'Key partners description',
                                tags: %w[desktop mobile web] }
    value_propositions      = { description: 'Key partners description',
                                tags: %w[fast SaaS finances] }
    customer_relationships  = { description: 'Key partners description',
                                tags: %w[professionals entrepeneurships] }
    channels                = { description: 'Key partners description',
                                tags: %w[mobile online web] }
    customer_segments       = { description: 'Key partners description',
                                tags: %w[youngs adults richs] }
    cost_structures         = { description: 'Key partners description',
                                tags: %w[hosting domain web] }
    revenue_streams         = { description: 'Key partners description',
                                tags: %w[web fee InAppPurchase] }
  end

  # fixAr
  factory :fixar_canvas, class: Canvas do
    key_partners            = { description: 'Key partners description',
                                tags: %w[mechanics workshops] }
    key_activities          = { description: 'Key partners description',
                                tags: %w[repariment assistant mobile] }
    key_resources           = { description: 'Key partners description',
                                tags: %w[smartphones camera tablets] }
    value_propositions      = { description: 'Key partners description',
                                tags: %w[AR asistence social] }
    customer_relationships  = { description: 'Key partners description',
                                tags: %w[mobile online support] }
    channels                = { description: 'Key partners description',
                                tags: %w[mobile online mail] }
    customer_segments       = { description: 'Key partners description',
                                tags: %w[high youngs men] }
    cost_structures         = { description: 'Key partners description',
                                tags: %w[development hardware software] }
    revenue_streams         = { description: 'Key partners description',
                                tags: %w[InAppPurchase publicity sales] }
  end
end
