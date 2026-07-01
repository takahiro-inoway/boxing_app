# app/models/boxer.rb
require "open-uri"
require "nokogiri"

class Boxer < ApplicationRecord
  def self.search(search)
    if search
      where("name LIKE ? OR weight_class LIKE ?", "%#{search}%", "%#{search}%")
    else
      all
    end
  end

  # Wikipediaから概要をスクレイピングするメソッド
  def fetch_wikipedia_summary
    return "名前が登録されていません" if name.blank?

    # 検索用URL（名前をエンコード）
    url = "https://ja.wikipedia.org/wiki/#{URI.encode_www_form_component(name)}"

    begin
      # HTMLを取得して解析
      html = URI.open(url, "User-Agent" => "Mozilla/5.0 (Windows NT 10.0; Win64; x64)")
      doc = Nokogiri::HTML(html)

      # Wikipediaの最初の本文段落（pタグ）を取得
      # 最初の方にある中身のあるpタグを探す
      summary = ""
      doc.css("section > p").each do |p|
        if p.text.strip.present?
          summary = p.text.gsub(/\[\d+\]/, "") # [1] などの注釈を除去
          break
        end
      end

      summary.present? ? summary.truncate(200) : "Wikipediaに該当する記述が見つかりませんでした。"
    rescue OpenURI::HTTPError
      "Wikipediaに「#{name}」の記事が見つかりませんでした。"
    rescue => e
      "情報の取得に失敗しました: #{e.message}"
    end
  end
end
