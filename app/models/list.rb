# frozen_string_literal: true

class List < ApplicationRecord

  has_many :cards, class_name: 'Task'

  belongs_to :board

end
