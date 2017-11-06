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
  holiday_hash.each do |season, holiday|
    holiday.each do |day, supplies|
      if day == :fourth_of_july
        return supplies[1]
      end
    end
  end
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above
  # add the second argument, which is a supply, to BOTH the
  # Christmas AND the New Year's arrays
  holiday_hash.each do |season, holiday|
    holiday.each do |day, supplies|
      supplies << supply
    end
  end
end


def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
  holiday_hash.each do |season, holiday|
    holiday.each do |day, supplies|
      if day == :memorial_day
        supplies << supply
      end
    end
  end
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  # code here
  # remember to return the updated hash
  holiday_hash[season][holiday_name] = supply_array
  return holiday_hash
end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
  supplies_arr = []
  holiday_hash.each do |season, holiday|
    if season == :winter
      holiday.each do |day, supplies|
        supplies.each do |i|
          supplies_arr << i
        end
      end
    end
  end
  return supplies_arr
end

def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.
  holiday_hash.each do |season, holiday|
    puts "#{season.to_s.capitalize!.chomp}:"
    holiday.each do |day, supplies|
      d = day.to_s.split("_")
      d.each do |word|
        word.capitalize!
      end
      puts "  #{d.join(" ")}: #{supplies.join(", ").chomp}"
    end
  end
end

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  day_key = []
  holiday_hash.each do |season, holiday|
    holiday.each do |day, supplies|
      supplies.each do |i|
        if i == "BBQ"
          day_key << day
        end
      end
    end
  end
  return day_key
end
