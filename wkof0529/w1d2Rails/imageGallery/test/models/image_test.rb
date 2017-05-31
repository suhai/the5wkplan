# == Schema Information
#
# Table name: images
#
#  id                 :integer          not null, primary key
#  image              :string
#  image_title        :string
#  image_file_size    :string
#  image_content_type :string
#  image_description  :string
#  category_id        :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

require 'test_helper'

class ImageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
