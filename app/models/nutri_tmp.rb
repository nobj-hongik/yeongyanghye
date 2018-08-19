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
    @count = 0
    target = NutriTmp.order("RANDOM()").pluck(:id, :name, :company).to_a
    target.each do |i,n,c|
      return if @count == 1000
      next if n.blank? || c.blank?
      query_s = (c.to_s.gsub(/\s+/, "") + " " + n.to_s).gsub(/\(.*?\)/, '').gsub("주식회사","")
      search_results = Naver::Search.shop(query: query_s)
      sleep 0.1
      if search_results.items[0].blank?
        next
      else
        e = NutriTmp.find(i)
        RefinedEntry.create(howtext: e.howtext,
                            name: e.name,
                            function: e.function,
                            company: e.company,
                            shape: e.shape,
                            howword: e.howword,
                            except: e.except,
                            companyinfo: e.companyinfo)
        puts query_s
        @count += 1
      end
    end
    puts "------- 기모띠 _ 완료 -------"
    puts @count
  end
end
