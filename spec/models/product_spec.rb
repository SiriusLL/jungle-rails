require 'rails_helper'

# RSpec.describe Product, type: :model do
#   describe 'Validations' do
#     it 'should create a new product if it validates' do
#     @category Category.new
#     @product Product.new(name: 'Spiced Rum', price_cents: 10000, quantity: 1, @product.category: @category)
#     expect
#     expect(@product).to be_valid
#   end

#   end
# end



RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'is valid with valid attributes' do
      @category = Category.new
      params = {
      name: 'Spiced Rum',
      description: 'Yummy',
      quantity: 1,
      category: @category,
      price_cents: 10000
      }
      expect(Product.new(params)).to be_valid
    end
    it 'should not create a product if name is missing' do
      @category = Category.new
      params = {
        name: nil,
        description: 'Yummy',
        quantity: 1,
        category: @category,
        price_cents: 10000
        }
      expect(Product.new(params)).to_not be_valid
    end
    it 'should not create a product if price is missing' do
      @category = Category.new
      params = {
        name: 'Spiced Rum',
        description: 'Yummy',
        quantity: 1,
        category: @category,
        price_cents: nil
        }
      expect(Product.new(params)).to_not be_valid
    end
    it 'should not create a product if quantity is missing' do
      @category = Category.new
      params = {
        name: 'Spiced Rum',
        description: 'Yummy',
        quantity: nil,
        category: @category,
        price_cents: 10000
        }
      expect(Product.new(params)).to_not be_valid
    end
    it 'should not create a product if category is missing' do
      @category = Category.new
      params = {
        name: 'Spiced Rum',
        description: 'Yummy',
        quantity: 1,
        category: nil,
        price_cents: 10000
        }
      expect(Product.new(params)).to_not be_valid
    end

  end
end