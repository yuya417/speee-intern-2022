module ReviewsHelper
  # 価格をフォーマットする
  # 例）20000000 => 2,000万円
  def format_price(price)
    price /= 10_000
    "#{number_with_delimiter(price, delimiter: ',')}万円"
  end

  # 日付をフォーマットする
  # 例）2022-09-12 => 2022年9月
  def format_date(date)
    date.strftime('%Y年%-m月')
  end

  # 日付間の期間の計算
  # 例) 2018年3月と2019年1月 => 10か月
  def months_after_the_sale(date_before, date_after)
    diff_months = (date_after - date_before).numerator / 30
    "売出しから#{diff_months}か月"
  end

  # 平均評価の算出
  def average_satisfaction_level(reviews)
    total_rating = 0

    reviews.each do |review|
      total_rating += review.satisfaction_level
    end

    # TODO: 小数点第2位以下は切り捨てで良いかりょうさんに確認
    (Float(total_rating) / reviews.count).round(2)
  end
end
