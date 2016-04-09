require 'json'
path = File.join(File.dirname(__FILE__), '../data/products.json')
file = File.read(path)
products_hash = JSON.parse(file)



# Print today's date
puts "Today's Date: #{Time.new.strftime("%d-%m-%Y")}"

puts "                     _            _       "
puts "                    | |          | |      "
puts " _ __  _ __ ___   __| |_   _  ___| |_ ___ "
puts "| '_ \\| '__/ _ \\ / _` | | | |/ __| __/ __|"
puts "| |_) | | | (_) | (_| | |_| | (__| |_\\__ \\"
puts "| .__/|_|  \\___/ \\__,_|\\__,_|\\___|\\__|___/"
puts "| |                                       "
puts "|_|                                       "

  count = 0
  # For each product in the data set:
  products_hash["items"].each do |toy|
    number=0
    total_sales=0
    total_price=0
    # Print the name of the toy
    puts "#{toy["title"]}"
    puts "*************************************"
    # Print the retail price of the toy
    puts "Retail Price: #{toy["full-price"]}"
    # Calculate the total number of purchases
    products_hash["items"][count]["purchases"].each do |user|
      number=number+1
      #Adding both price and shipping cost for individual purchase
      sales=user["price"]
      total_sales=total_sales + sales
      total_price=total_price + user["price"]

    end
    # puts "*******************************************\n"
#Print total number of purchase
    puts "Total number of purchases: #{number}"
    # Print the total amount of sales
    puts "Total amount of sales: #{total_sales}"
    # Calculate and print the average price the toy sold for
    average_price = total_sales / number
    puts "Average Price the toy sold for: #{average_price}"
    # Calculate and print the average discount (% or $) based off the average sales price
    average_sale= total_sales/number
    retailed_price = toy["full-price"].to_f
    discount = (retailed_price - average_sale)
    discount_percentage= (discount/retailed_price)*100
    puts "Average Discount: #{discount_percentage.round(2)}% or $#{discount}"
    puts"\n"
    #Incresing the count
    count=count+1

  end


	puts " _                         _     "
	puts "| |                       | |    "
	puts "| |__  _ __ __ _ _ __   __| |___ "
	puts "| '_ \\| '__/ _` | '_ \\ / _` / __|"
	puts "| |_) | | | (_| | | | | (_| \\__ \\"
	puts "|_.__/|_|  \\__,_|_| |_|\\__,_|___/"
	puts

json = File.open(path,'r:utf-8',&:read) # in case the JSON uses UTF-8
items = JSON.parse(json)['items']
stock_by_brand = items
# For each brand in the data set:
stock_by_brand = { }
items.uniq.each do |item|
  stock_by_brand[ item['brand'] ] ||= 0
  stock_by_brand[ item['brand'] ] += item['stock']
end
  # Count and print the number of the brand's toys we stock
  # Calculate and print the average price of the brand's toys
  puts "Brand Stock:" "#{stock_by_brand}"
  # Calculate and print the total revenue of all the brand's toy sales combined

