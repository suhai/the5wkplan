# == Schema Information
#
# Table name: books
#
#  id           :integer          not null, primary key
#  title        :string
#  category_id  :integer
#  author_id    :integer
#  publisher_id :integer
#  isbn         :string
#  year         :string
#  price        :string
#  buy          :string
#  excerpt      :text
#  format       :string
#  pages        :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Book < ApplicationRecord
  belongs_to :category,
    primary_key: :id,
    foreign_key: :category_id,
    class_name: :Category

  belongs_to :author,
    primary_key: :id,
    foreign_key: :author_id,
    class_name: :Author

  belongs_to :publisher,
    primary_key: :id,
    foreign_key: :publisher_id,
    class_name: :Publisher

  validates :title, presence: true
end
