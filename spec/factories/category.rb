# frozen_string_literal: true

FactoryBot.define do
  factory :category do
    sequence :name do |i|
      "category_#{i}"
    end
  end
end
