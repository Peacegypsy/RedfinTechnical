# required for program to run correctly
require 'httparty'
require 'date'
require 'terminal-table'

# creating a class structure, setting which attributes of the class object are readable, and the address the request is made to.
class FoodTrucks
  attr_reader :RESULTS_QTY, :FIELDS, :HOUR_STRING, :MINUTE_STRING, :WEEK_DAY, :CTIME , :TIME_OF_QUERY, :query
  include HTTParty
  base_uri "https://data.sfgov.org/resource/jjew-r69b.json"

  def initialize
    @date = DateTime.now
    @RESULTS_QTY = 10
    @FIELDS = 'applicant,location, optionaltext'
    @HOUR_STRING = "#{DateTime.now.hour}"
    @MINUTE_STRING = "#{DateTime.now.minute}"
    @WEEK_DAY = "#{DateTime.now.cwday}"
    @CTIME = "\'#{@HOUR_STRING}:#{@MINUTE_STRING}\'"
    @TIME_OF_QUERY = "#{@CTIME} BETWEEN start24 AND end24"
    @query = "?$select=#{@FIELDS}&$where=#{@TIME_OF_QUERY} AND dayorder=#{@WEEK_DAY}&$order=applicant ASC&$limit=#{@RESULTS_QTY}"

  end
# defining the response from the api and establishing the offset to limit the number of responses
  def query_response(offset = 0)
    query = "#{@query}&$offset=#{offset}"
    return self.class.get(query).parsed_response
  end
end
# setting variables for pagination
  num = 0
  page = 1
  cont_to_next_page = true
  response = FoodTrucks.new.query_response(0)

# creating an array to fill the table
  def fill_table_items(data)
    foodtrucks = []
    data.each do |truck|
    foodtrucks.push([truck["applicant"],truck["location"]])
    end
    return foodtrucks
  end
# build the table from the data
    def build_table(response)
      table = Terminal::Table.new do |t|
        t.title = "Food trucks"
        t.headings = ['Name', 'Location']
        t.rows = fill_table_items(response)
        t.style = { :border_top => true, :border_bottom => true}
      end
      return table

    end
# method to show more trucks
    def show_more(num)
      response = FoodTrucks.new.query_response(num)
      return response
    end

  while cont_to_next_page
    if response.length == 0
      puts "That is all of the Food Trucks available."
      break
    end

    puts build_table(response)
# allows user to see all items from the list or exit.
    if page == 1
      puts "Would you like to see the full list? (Y or N): "
      user_choice = gets.chomp.downcase
      until user_choice == "y" || user_choice == "n"
        puts "Enter y for YES to show more trucks, or n for no to stop: "
        user_choice = gets.chomp.downcase
      end

      if user_choice == "y"
        num += 10
        response = show_more(num)
        page += 1
      else
        user_choice == "n"
        cont_to_next_page = false
        print "Thank you. Exiting."
        break

      end
 # allows user to see more items from the list, see previous, or exit.
    else
        puts "NEXT (page), PREV (page) , or EXIT? "
        user_choice = gets.chomp.upcase
        until user_choice == "NEXT" || user_choice == "PREV" || user_choice == "EXIT"
          puts "Please enter NEXT, PREV, or EXIT"
          user_choice = gets.chomp.upcase
        end
        if user_choice == "NEXT"
          num += 10
          response = show_more(num)
        elsif user_choice == "PREV"
          num -= 10
          response = show_more(num)
        elsif user_choice == "EXIT"
          puts "Thank you. Exiting."
          break
        end
    end
end
