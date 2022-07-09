# frozen_string_literal: true

class Board < ApplicationRecord

  validates :name, presence: true

end
