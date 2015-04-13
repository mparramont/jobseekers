# Generated with RailsBricks
# Initial seed file to use with Devise User Model

# Temporary admin account
admin = User.new(
    username: "admin",
    email: "admin@example.com",
    password: "1234",
    admin: true
)
admin.save!

# Categories
category_names = [
  'Adult Education',
  'Advanced Skills Teacher',
  'Assessor/Verifier',
  'Basic Skills',
  'Bursar/Business Manager',
  'Education Administration',
  'Education Senior Management',
  'Educational Psychology',
  'E-learning',
  'ESOL / TEFL',
  'Further Education',
  'Head Teacher/Deputy Head Teacher',
  'Higher Education',
  'Invigilator',
  'Key Skills',
  'Key Stage 1',
  'Key Stage 2',
  'Key Stage 3 & 4',
  'Key Stage 5',
  'Learning Support Assistant',
  'Lecturer',
  'Libraries',
  'Nursery',
  'Outdoor Education',
  'Preparatory Education',
  'Primary School',
  'Secondary School',
  'Special Needs',
  'Supply Teacher',
  'Teaching Assistant',
  'Other Education'
]
category_names.each do |category_name|
  Category.create(name: category_name)
end

if Rails.env.development?
  # User accounts
  (1..10).each do |i|
    u = User.new(
        username: "user#{i}",
        email: "user#{i}@example.com",
        password: "1234"
    )
    u.save!

    puts "#{i} test users created..." if (i % 5 == 0)

  end

  # Job offers
  require 'faker'
  I18n.reload!
  (1..50).each do |i|
    Job.create(
      title: Faker::Company.catch_phrase,
      content_md: (1..3).map { Faker::Lorem.paragraph(10) }.join("\n\n"),
      user: admin,
      keywords: (1..5).map { Faker::Hacker.adjective }.join(', '),
      city: "#{Faker::Address.street_address}, #{Faker::Address.city}",
      job_length: [:permanent, :temporary, :contract].sample,
      job_type: [:full_time, :part_time].sample,
      suitable_for_graduates: i % 3 == 0,
      category: Category.all.sample,
      salary: Faker::Number.number(3).to_i * 100,
      reference: Faker::Company.ein,
    )
    puts "#{i} test job offers created..." if (i % 5 == 0)

  end
end
