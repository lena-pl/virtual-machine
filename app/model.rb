class Model
  attr_accessor :ic, :in_buffer, :out_buffer, :b

  def initialize(instructions)
    @a  = 0
    @b  = 0
    @ic = 0
    @instructions = instructions
    @in_buffer  = [] #index 0 is the core number, index 1 is the value
    @out_buffer = []
  end

  def instruction_loop
    while @ic < @instructions.length
      curr_ic = @ic
      increase_instruction_counter
      puts "#EXECUTING #{@instructions[curr_ic]} ON #{self}"
      @instructions[curr_ic].execute(self)
      assess_ic
    end
  end

  def increase_instruction_counter
    if !is_jump_type?(@instructions[@ic])
      @ic +=1
    end
  end

  def pending_core(core_num)
    puts "RUNNING PENDING ON #{self}"
    value = nil
    while value == nil
      if !@in_buffer.empty? && @in_buffer.first[0] == core_num
        value = @in_buffer.shift
      end
    end
    puts "RECEIVED #{value[1]}"
    value[1]
  end

  def send_to_core(core_num,value)
    puts "SENDING TO CORE :#{core_num} WITH #{value} ON #{self}"
    @out_buffer.push([core_num,value])
  end

  def assess_ic
    if @ic < 0
      @ic = @a = @b = 0
    end
  end

  def a(param = @a)
    @a = param
  end


  def in
    print ":"#TODO delete this later

   $stdin.gets.chomp.to_i
  end

  def out(param)
    puts "OUTPUT: #{param}"
  end

  def null
    0
  end

  def null(param)
  end

  private

  def is_jump_type?(type)
    ( type.is_a? Jmp ) || ( type.is_a? Jnz ) || ( type.is_a? Jgz ) || ( type.is_a? Jlz ) || ( type.is_a? Jez )
  end
end
