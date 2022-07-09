# frozen_string_literal: true

class Task < ApplicationRecord

  belongs_to :board

  validates :name, presence: true

  enum status: { todo: 0, doing: 1, done: 2, other: 99 }

end
