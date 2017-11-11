require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  holiday_hash[:summer][:fourth_of_july][1]
  # given that holiday_hash looks like this:
  # {
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
  # }
  # return the second element in the 4th of July array
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  holiday_hash[:winter].each do |holiday, array|
    array.push(supply)
  end
end

def add_supply_to_memorial_day(holiday_hash, supply)
  holiday_hash[:spring][:memorial_day].push(supply)
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  holiday_hash[season][holiday_name] = supply_array
  holiday_hash
end

def all_winter_holiday_supplies(holiday_hash)
  winter_array = []
  holiday_hash[:winter].each do |holiday, array|
    array.each do |element|
      winter_array.push(element)
    end
  end
  winter_array
end

def all_supplies_in_holidays(holiday_hash)
  holiday_hash.each do |season, hol_values|
    puts "#{season.to_s.capitalize}:"
    hol_values.each do |holiday, hol_arrays|
      print_holiday = holiday.to_s.split("_")
      holiday_caps = print_holiday.collect {|element| element.capitalize}
      holiday_string = holiday_caps.join(" ")
      puts "  #{holiday_string}: #{hol_arrays.join(", ")}"
    end
  end
end

  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.


def all_holidays_with_bbq(holiday_hash)
  positives = []
  holiday_hash.each do |season, holiday|
    holiday.each do |holiday, array|
      array.each do |element|
        positives.push(holiday) if element == "BBQ"
      end
    end
  end
  positives
end
