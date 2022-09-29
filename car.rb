class Car
  FAILURE = 'Failure: no parking spot available to park the car.'
  SUCCESS = 'Succees'

  attr_accessor :spot_in_garbage

  def initialize
    @spot_in_garbage = { small: {}, medium: {}, large: {} }
  end
  
  def admit(plat_number, carSize)
    is_small_available, is_medium_available, is_large_available = @spot_in_garbage[:small].empty?, @spot_in_garbage[:medium].empty?, @spot_in_garbage[:large].empty?
    if is_small_available || is_medium_available || is_large_available
      if (carSize == 'small')
          if is_small_available
            @spot_in_garbage[:small] =  { "#{carSize}": plat_number }
          elsif is_medium_available || is_large_available
            if is_medium_available
              @spot_in_garbage[:medium] = { "#{carSize}": plat_number }
            else
              @spot_in_garbage[:large] = { "#{carSize}": plat_number }
            end
          else
            return 'Failure: no parking spot available to park the car.'
          end
          return 'success'
      elsif (carSize == 'medium')
        if is_medium_available
          @spot_in_garbage[:medium] = { "#{carSize}": plat_number }
        elsif @spot_in_garbage[:medium].keys.include?(:small) && is_small_available
          @spot_in_garbage[:small] = { "#{@spot_in_garbage[:medium].keys.first}": @spot_in_garbage[:medium].values.first }
          @spot_in_garbage[:medium] = { "#{carSize}": plat_number }
        elsif is_large_available
          @spot_in_garbage[:large] = { "#{carSize}": plat_number }
        else
          return 'Failure: no parking spot available to park the car.'
        end
        return 'success'
      elsif (carSize == 'large')
        if is_large_available
          @spot_in_garbage[:large] = { "#{carSize}": plat_number }
        elsif @spot_in_garbage[:large].keys.include?(:small) && (is_small_available || is_medium_available)
          puts is_small_available, is_medium_available
          if is_small_available
            @spot_in_garbage[:small] = { "#{@spot_in_garbage[:large].keys.first}": @spot_in_garbage[:large].values.first } if is_small_available
          else
            @spot_in_garbage[:medium] = { "#{@spot_in_garbage[:large].keys.first}": @spot_in_garbage[:large].values.first }
          end
        elsif @spot_in_garbage[:large].keys.include?(:medium) && is_medium_available
          @spot_in_garbage[:medium] = { "#{carSize}": @spot_in_garbage[:large].values.first }  
        else
          return 'Failure: no parking spot available to park the car.'
        end
        @spot_in_garbage[:large] = { "#{carSize}": plat_number }
        return 'success'
      end
    else
      return 'Failure: no parking spot available to park the car.'
    end
  end

  def exit(plat_number)
    return 'success' if is_car_parked(@spot_in_garbage, plat_number)
    return 'Failure: the car is not parked inside the garage'
  end

  private

  def is_car_parked(garage, plat_number)
    if garage.respond_to?(:key?) && garage.values.include?(plat_number)
      @spot_in_garbage[garage.key(plat_number).to_sym] = {}
      return true
    elsif garage.respond_to?(:each)
      inside_garbage = nil
      garage.find { |*a| inside_garbage = is_car_parked(a.last, plat_number) }
      inside_garbage
    end
  end
end


car = Car.new
puts car.admit(1, 'small')
puts car.admit(2, 'small')
puts car.admit(3, 'small')
puts car.exit(2)
puts car.admit(4, 'large')

puts car.spot_in_garbage