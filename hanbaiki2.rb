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
    puts "----------------"
    @products.each_with_index do |product, idx|
      puts "#{idx + 1} #{product.name} #{product.price}"
    end
    puts "----------------"
  end

  def insert_money
    print "投入金額を入力して下さい。: "
    value = gets.to_i
    @deposit += value

    puts "#{value}円 投入しました。"
  end

  def buy
    print "商品番号を入力して下さい。: "
    number = gets.to_i
    puts "----------------"
    if @products[number - 1].price <= @deposit
      puts "#{@products[number - 1].name} を購入しました。"
      @deposit -= @products[number - 1].price
      if @deposit > 0
        puts "#{@deposit}円 のお釣りが返却されます。"
      end
    else
      puts "投入金額が不足しています。"
    end
  end
end

# 飲み物データ
product_data = [
  ["コーラ", 100],
  ["緑茶", 110],
  ["黒烏龍茶", 180],
]

# 飲み物を用意する
products = product_data.each.map { |param| Product.new(*param) }
# 中身が空の自販機を用意して飲み物を補充する
vm = VendingMachine.new
vm.add_product(products)
# 商品一覧を表示
vm.show_products
# お金を投入する
vm.insert_money
# 買う
vm.buy
