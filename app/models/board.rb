# frozen_string_literal: true

class Board < ApplicationRecord

  validates :name, presence: true

  has_many :lists

  store_accessor :trello,
    :id,
    :name,
    :url,
    prefix: true
end
