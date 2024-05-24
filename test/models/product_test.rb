require "test_helper"

class ProductTest < ActiveSupport::TestCase

  def new_product(image_url)
    product = Product.new
    product.title = "My Book Title"
    product.description = "yyy"
    product.price = 19.99
    product.image_url = image_url
    return product
  end

  # test "product successfully created" do 
  #   product = new_product("foo.jpg")
  #   assert product.valid?
  #   assert_equal "foo", product.notices
  # end

  test "product attributes must not be empty" do
    product = Product.new
    assert product.invalid?
    assert product.errors[:title].any?
    assert product.errors[:description].any?
    assert product.errors[:price].any?                  # In Rails, if validations fail, error messages are added
    assert product.errors[:image_url].any?              # to the `errors` collection of the model.
  end

  test "product price must be positive" do 
    product = Product.new(title: "My Book Title",
                          description: "yyy",
                          price: 1,
                          image_url: "zzz.jpg")

    product.price = -1
    assert product.invalid?
    assert_equal ["must be greater than or equal to 0.01"], product.errors[:price]

    product.price = 0
    assert product.invalid?
    assert_equal ["must be greater than or equal to 0.01"], product.errors[:price]

    product.price = 1
    assert product.valid?
  end

  test "product price is a number" do 
    product = Product.new(title: "My Book Title",
                          description: "yyy",
                          price: 1,
                          image_url: "zzz.jpg")

    product.price = "a cool price"
    assert product.invalid?
    assert_equal ["is not a number"], product.errors[:price]
  end

  test "product price is rounded up" do 
    product = Product.new(title: "My Book Title",
                          description: "yyy",
                          price: 1,
                          image_url: "zzz.jpg")

    product.price = 19.999
    assert product.valid?
    assert_equal product.price, 20
  end

  test "Image URL" do
    ok = %w{ foo.gif foo.jpg foo.png foo.JPG foo.Jpg https://example.com/foo.png }
    bad = %w{ foo.doc foo.gif/more foo.jpg.more }

    ok.each do |image_url|
      product = new_product(image_url)
      assert product.valid?, product.errors[:image_url]
    end

    bad.each do |image_url|
      assert new_product(image_url).invalid?, "#{image_url} must be invalid" # this is just the display message in the test area, not what the user sees For that, see above.
    end
  end


end
