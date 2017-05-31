# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Category < ApplicationRecord
  has_many :books,
    primary_key: :id,
    foreign_key: :category_id,
    class_name: :Book

  validates :name, presence: true,
		        length: {minimum:3}
end
