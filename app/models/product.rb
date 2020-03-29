class Product < ApplicationRecord
  include AlgoliaSearch

  validates_presence_of :name, :price, :searchable
  validates_uniqueness_of :name

  algoliasearch per_environment: true do
    attribute :name, :price

    attribute :name_hiragana do
      name.gsub(/[ぁ-んァ-ンー]+/).map do |matched|
        matched.tr("ァ-ン", "ぁ-ん")
      end
    end

    attribute :name_katakana do
      name.gsub(/[ぁ-んァ-ンー]+/).map do |matched|
        matched.tr("ぁ-ん", "ァ-ン")
      end
    end

    attribute :searchable do
      searchable?
    end

    searchableAttributes  ["name", "name_hiragana", "name_katakana"]
    attributesForFaceting ["searchable"]
  end
end
