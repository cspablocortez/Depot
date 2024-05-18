require "test_helper"

class ProductTest < ActiveSupport::TestCase
  fixtures :products

  def new_product(image_url)
    Product.new(title: "My Book Title",
      description: "yyy",
      price: 1,
      image_url: image_url)
  end

  test "image url" do 
    ok = %w{ fred.gif fred.jpg fred.png FRED.JPG FRED.Jpg https://example.com/image.png }

    bad = %w{ fred.docx elias.ppt landers.pdf definitely_not_a_virus_lol.exe }

    ok.each do |image_url| 
      assert new_product(image_url).valid?, "#{image_url} must be valid"
    end

    bad.each do |image_url|
      assert new_product(image_url).invalid?, "#{image_url} must be invalid"
    end

  end

  test "product attributes must not be empty" do
    product = Product.new
    assert product.invalid?
    assert product.errors[:title].any?    
    assert product.errors[:description].any?    
    assert product.errors[:price].any?    
    assert product.errors[:image_url].any?    
  end

  test "product price must be positive" do 
    product = Product.new(title: "My book title",
      description: "yyy",
      image_url: "zzz.jpg")

    product.price = -400
    assert product.invalid?
    assert_equal ["must be greater than or equal to 0.01"],
      product.errors[:price]

    product.price = 0
    assert product.invalid?
    assert_equal ["must be greater than or equal to 0.01"],
      product.errors[:price]

    product.price = 1
    assert product.valid?
  end
end
