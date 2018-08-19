class CreateNutritions < ActiveRecord::Migration
  def change
    create_table :nutritions do |t|
      t.string :name    #제품명
      t.text :company   #회사
      t.string :shape   #형태
      t.text :function    #기능
      t.text :except    #주의사항
      t.string :image   #제품사진
      t.text :howtext   #섭취법문장
      t.text :howword   #섭취법단어
      t.string :companyinfo #회사정보 GMP인증 대기업
      t.string :certifi   #식약청인증
      t.string :contury   #국내외제품
      t.string :price   #가격정보
      t.belongs_to :user, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
