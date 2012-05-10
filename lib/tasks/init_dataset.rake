require "csv"

namespace :db do
  namespace :data do
    task :init => :environment do

      data = CSV.read("data/shipList.csv")

      data.each do |line|
        s = Ship.new
        s.name = line[0]

        o = Operator.where :name => line[1]
        if o.count > 0 then
          puts "Add to Operator #{o.last.name}"
          s.operator_id = o.last.id
        else
          puts "Save Operator : #{line[1]}"
          o = Operator.new :name => line[1]
          o.save!
          s.operator_id = o.id
        end

        c = ShipClass.where :name => line[2]
        if c.count > 0 then
          puts "Add to ShipClass #{c.last.name}"
          s.ship_class_id = c.last.id
        else
          puts "Save ShipClass : #{line[2]}"
          c = ShipClass.new :name => line[2]
          c.save!
          s.ship_class_id = c.id
        end

        s.call_sign = line[3]
        s.email = line[4]
        s.phone = line[5] 

        puts "Save Ship(#{s.name}, #{Operator.find(s.operator_id).name}, #{ShipClass.find(s.ship_class_id).name}, #{s.phone}, #{s.email})"
        s.save!
      end

      data = CSV.read("data/siteList.csv")

      data.each do |line|
        l = Location.new
        l.name = line[0]
        l.coordinates = [line[1], line[2]]
        l.open = line[3].eql?("open") ? true : false
        l.zone = line[4]
        l.geo = line[5]

        puts "Save Location(#{l.name}, #{l.coordinates}, #{l.open}, #{l.zone}, #{l.geo})"
        l.save!
      end
    end
  end
end
