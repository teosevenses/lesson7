require_relative "instance_counter"

class Station
  include InstanceCounter
  attr_accessor :trains, :name

  @@all = []

  class ValidationError < StandardError
  end

  def initialize(name)
   @name = name
   @trains = []
   raise ValidationError, "Некорректное наименование станции, длина не менее двух символов" unless valid?
   @@all << self
   register_instance
  end

  def self.all
    @@all
  end

  def add_train(train)
    @trains << train
  end

  def delete_train(train)
    @trains.delete(train)
  end

  def train_type(type)
    @trains.select {|train| train.type == type}.count
  end

  def valid?
    name.is_a?(String) && /^[0-9а-яА-Я]{2,}\Z/.match?(name)
  end

  def yield_trains(&block)
    @trains.each do |train|
      block.call(train)
    end
  end

end