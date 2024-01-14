require_relative "instance_counter"


class Route
  include InstanceCounter
  attr_reader :stations, :trains

  #создаем маршрут

  def initialize(first_station, last_station)
    @stations = [first_station, last_station]
    @trains = []
    register_instance
  end

  #добавляем станцию
  def add_station(station)
    @stations.insert(-2, station)
  end

  #удаляем станцию
  def delete_station(station)
    @stations.delete(station)
  end

  def list_stations
    puts "Список станций"
    stations.each_with_index do |x, y| 
      puts "#{y}. #{x.name}"
    end
  end

  def readable_stations
      stations.map { |x| x.name }.join("-")
  end
end