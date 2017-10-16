require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    it 'has a valid product' do
      @category = Category.new(name: "somthing")
      @category.save
      @product = Product.new(category_id: @category.id, name: "Testing", quantity: 10, price: 5)
      @product.save

      expect(@product.valid?).to be true
    end

    it 'is invalid without a name' do
      @category = Category.new(name: "somthing")
      @category.save
      @product = Product.new(category_id: @category.id, name: nil, quantity: 10, price: 5)
      @product.save
      puts @product.errors.full_messages

      expect(@product.valid?).to be false
    end

    it 'is invalid without a quantity' do
      @category = Category.new(name: "somthing")
      @category.save
      @product = Product.new(category_id: @category.id, name: "Testing", quantity: nil, price: 5)
      @product.save
      puts @product.errors.full_messages

      expect(@product.valid?).to be false
    end

    it 'is invalid without a price' do
      @category = Category.new(name: "somthing")
      @category.save
      @product = Product.new(category_id: @category.id, name: "Testing", quantity: 10, price: nil)
      @product.save
      puts @product.errors.full_messages

      expect(@product.valid?).to be false
    end

    it 'is invalid without a category' do
      @product = Product.new(category_id: nil, name: nil, quantity: 10, price: 5)
      @product.save
      puts @product.errors.full_messages

      expect(@product.valid?).to be false
   end

  end
end