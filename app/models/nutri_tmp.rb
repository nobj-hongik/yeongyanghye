class NutriTmp < ApplicationRecord
  def self.generate_nutri
    csv_text = File.read(Rails.root.join('lib', 'csv', 'nutri_db.CSV'))
    csv = CSV.parse(csv_text, :headers => true, :encoding => 'UTF-8')
    csv.each do |row|
      t = self.new
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
  end

#20834부터 다시 필터링 ㄱ
  def self.search_naver
    @original = NutriTmp.all.size
    target = NutriTmp.all.pluck(:name).to_a.uniq
    target.each do |n|
      search_results = Naver::Search.shop(query: n.to_s)
      if search_results.items[0].blank?
        puts "삭제 : " + n
        NutriTmp.where(name: n).destroy_all
      end
      sleep 0.1
    end
    puts "------- 검색 결과 -------"
    puts "원래 데이터 개수 : " + @original
    @after = NutriTmp.all.size
    puts "보정 후 데이터 개수 : " + @after
  end
end
