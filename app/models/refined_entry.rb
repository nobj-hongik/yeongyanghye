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
end
