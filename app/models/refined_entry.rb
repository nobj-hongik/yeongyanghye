class RefinedEntry < ApplicationRecord
  def self.to_csv
    attributes = %w{id howtext name function company shape howword except companyinfo}

    CSV.generate(headers: true) do |csv|
      csv << attributes
      all.each do |e|
        csv << attributes.map{ |attr| e.send(attr) }
      end
    end
  end

  def self.init_entries
    csv_text = File.read(Rails.root.join('lib', 'csv', 'readytogo.CSV'))
    csv = CSV.parse(csv_text, :headers => true, :encoding => 'UTF-8')
    csv.each do |row|
      t = self.new
      t.howtext = row['Howtext']
      t.name = row['이름']
      t.function = row['Function']
      t.company = row['Company']
      t.shape = row['Shape']
      t.howword = row['Howword']
      t.except = row['Except']
      t.companyinfo = row['Companyinfo']
      t.save
    end
  end

  def self.image_hunter
    target = self.all.where(image: nil)
    target.each do |t|
      query_s = (t.company.to_s.gsub(/\s+/, "") + " " + t.name.to_s).gsub(/\(.*?\)/, '').gsub("주식회사","")
      search_results = Naver::Search.shop(query: query_s)
      sleep 0.1
      if search_results.items[0].blank?
        t.destroy
      elsif search_results.items[0].image.blank?
        next
      else
        image = search_results.items[0].image
        t.update(image: image)
        puts query_s
      end
    end
  end

  def self.howtext_word
    self.all.each do |e|
      target = NutriTmp.where(name: e.name, company: e.company)
      if target.size == 0
        next
      elsif target.size > 0
        target = NutriTmp.where(name: e.name, company: e.company, function: e.function)
      end
      e.update(howtext: target.first.howtext,howword: target.first.howword)
    end
  end

  def self.add_stdr_stnd
    self.all.each do |e|
      target = NutriTmp.where(name: e.name, company: e.company)
      if target.size == 0
        next
      elsif target.size > 0
        target = NutriTmp.where(name: e.name, company: e.company, function: e.function)
      end
      e.update(stdr_stnd: target.first.stdr_stnd)
    end
  end
end
