class Model
  attr_accessor :ic
  def initialize(instructions)
    @a = 0
    @b = 0
    @ic = 0
    @instructions = instructions
  end

  def instruction_loop
    while @ic < @instructions.length
      curr_ic = @ic
      increase_instruction_counter
      @instructions[curr_ic].execute(self)
      assess_ic
    end
  end

  def increase_instruction_counter
    if !is_jump_type?(@instructions[@ic])
      @ic +=1
    end
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
    puts param
  end

  def null
    0
  end

  def null(param)
  end

  private

  def is_jump_type?(type)
    ( type.is_a? Jmp ) || ( type.is_a? Jnz ) || ( type.is_a? Jgz )
    || ( type.is_a? Jlz ) || ( type.is_a? Jez )
  end
end
