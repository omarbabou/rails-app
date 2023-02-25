class Group < ApplicationRecord
    belongs_to :user
    has_many :entities, foreign_key: :group_id, dependent: :delete_all
  end