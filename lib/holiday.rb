require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
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

  holiday_hash[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above
  # add the second argument, which is a supply, to BOTH the
  # Christmas AND the New Year's arrays
  holiday_hash[:winter].each {
    |holiday, array|
    array.push(supply)
  }
end


def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
 holiday_hash[:spring][:memorial_day].push(supply)
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  # code here
  # remember to return the updated hash
  holiday_hash[season][holiday_name] = supply_array
  holiday_hash
end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
 holiday_hash[:winter].values.flatten
end

def all_supplies_in_holidays(holiday_hash)
list = []
holiday_hash.each {
  |season, holiday|
  puts season.to_s.capitalize + ":"
  holiday.each {
    |holiday, supplies|
    holiday_format = holiday.to_s.split("_").collect {|supply| supply.capitalize}.join(" ")
    puts "  " + holiday_format + ": " + supplies.join(", ")
  }
}
list
end

def all_holidays_with_bbq(holiday_hash)
holiday_w_bbq = []
  holiday_hash.each {
    |season, holiday|
     holiday.each {
      |holiday, supplies|
      if supplies.include? ("BBQ")
        holiday_w_bbq.push(holiday)
      end
    }
  }
  holiday_w_bbq
end
