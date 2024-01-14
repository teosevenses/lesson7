require_relative "with_manufacturer"
require_relative "instance_counter"

class Train
  include InstanceCounter
  include WithManufacturer

  @@all = []

  attr_reader :type, :num, :wagons
  attr_accessor :route, :station

  class ValidationError < StandardError
  end

  def self.find(num)
    all.find { |train| num == train.num }
  end

  def initialize(num)
    @num = num
    @wagons = []
    @@all << self
        raise ValidationError, "Некорректные данные, пример номера 123-45, 222" unless valid?
    register_instance
  end

  def self.all
    @@all
  end
    
  def move_forward
    if route != nil && station != nil 
      self.station = station + 1    
    end
  end 

  def move_back
    if route != nil && station != nil 
      self.station = station - 1    
    end
  end 

  def yield_wagons(&block)
    @wagons.each do |wagon|
      block.call(wagon)
    end
  end

  private 

  def valid?
    num.is_a?(String) && /^[0-9а-яА-Я]{3}(-[0-9a-zA-Z]{2})?\Z/.match?(num)
  end

end