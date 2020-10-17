class Product
  attr_accessor :name, :price

  def initialize(name, price)
    @name = name
    @price = price
  end
end

class VendingMachine
  def initialize
    @products = []
    @deposit = 0
  end

  def add_product(products)
    products.each do |product|
      @products << product
    end
  end

  def show_products
    puts "お金を入れたあとに商品番号を入力してください。"
    puts
    @products.each_with_index do |product, idx|
      puts "#{idx + 1} #{product.name} #{product.price}"
    end
    puts
  end

  def put_money(amount)
    @deposit += amount

    puts "#{amount}円 投入しました。現在の金額は #{@deposit}円 です。"
  end

  def buy(number)
    if @products[number - 1].price <= @deposit
      puts "#{@products[number - 1].name} を購入しました。"
      @deposit -= @products[number - 1].price
      puts "#{@deposit}円 のお釣りが返却されます。"
    else
      puts "お金が足りませんでした。"
    end
  end
end

product1 = Product.new("コーラ", 100)
product2 = Product.new("おーいお茶", 110)
product3 = Product.new("黒烏龍", 180)

hanbaiki = VendingMachine.new
hanbaiki.add_product([product1, product2, product3])

hanbaiki.show_products

money = gets.to_i
hanbaiki.put_money(money)

number = gets.to_i
hanbaiki.buy(number)