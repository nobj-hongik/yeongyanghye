# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
AdminUser.create!(email: 'admin@likelion.org', password: 'password', password_confirmation: 'password') if Rails.env.development?

csv_text = File.read(Rails.root.join('lib', 'seeds', 'test.CSV'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'UTF-8')
csv.each do |row|
  t = Nutrition.new
  t.howtext = row['섭취법문장']
  t.name = row['제품명']
  t.function = row['기능']
  t.company = row['회사']
  t.shape = row['형태']
  t.howword = row['섭취법단어']
  t.except = row['주의사항']
  t.companyinfo = row['기업정보']
  t.save
end