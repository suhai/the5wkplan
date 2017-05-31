# == Schema Information
#
# Table name: authors
#
#  id         :integer          not null, primary key
#  first_name :string
#  last_name  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Author < ApplicationRecord
  has_many :books,
    primary_key: :id,
    foreign_key: :author_id,
    class_name: :Book

  validates :first_name, presence: true
	validates :last_name, presence: true
end
