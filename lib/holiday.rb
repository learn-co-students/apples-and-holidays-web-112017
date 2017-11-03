require 'pry'

holiday_hash = {
  :winter => {
    :christmas => ["Lights", "Wreath"],
    :new_years => ["Party Hats"]
  },
  :summer => {
    :fourth_of_july => ["Fireworks", "BBQ"]
  },
  :fall => {
    :thanksgiving => ["Turkey"]
  },
  :spring => {
    :memorial_day => ["BBQ"]
  }
}

def second_supply_for_fourth_of_july(holiday_hash)
  # given that holiday_hash looks like this:

  # return the second element in the 4th of July array
  holiday_hash.map do |season, holidays|
    if season == :summer
      holidays.map do |holiday, array|
        return array[1]
      end
    end
  end
end


def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above
  # add the second argument, which is a supply, to BOTH the
  # Christmas AND the New Year's arrays
  holiday_hash.map do |season, holidays|
    if season == :winter
      holidays.map do |holiday, array|
        array << supply
      end
    end
  end
end


def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
  holiday_hash.map do |season, holidays|
    if season == :spring
      holidays.map do |holiday, array|
        array << supply
      end
    end
  end
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  # code here
  # remember to return the updated hash
  holiday_hash.map do |seasons, holidays|
    if seasons == season
      holidays[holiday_name]= supply_array
    end
  end
  holiday_hash
end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
  new_array = []
  holiday_hash.each do |seasons, holidays|
    if seasons = :winter
      holidays.each do |holiday, supply_list|
        supply_list.each {|supply| new_array << supply}
      end
    end
  end
  new_array
end

def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.
  holiday_hash.each do |seasons, holidays|
    puts "#{seasons.to_s.capitalize}:"
    holidays.each do |holiday, supply_list|
      h_string = holiday.to_s.split("_").map {|word| word.capitalize}.join(" ")
      supply_string = "  #{h_string}: "
      supply_list.each_with_index do |supply, index|
        if index == 0
          supply_string << "#{supply}"
        else
          supply_string << ", #{supply}"
        end
      end
      puts supply_string
    end
  end
end

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  new_array = []
  holiday_hash.map do |seasons, holidays|
    holidays.map do |holiday, supply_list|
      supply_list.map do |supply|
        if supply == "BBQ"
          new_array << holiday
        end
      end
    end
  end
  new_array
end
