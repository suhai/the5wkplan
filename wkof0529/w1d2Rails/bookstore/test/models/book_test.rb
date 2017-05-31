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

require 'test_helper'

class BookTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
