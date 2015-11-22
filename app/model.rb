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
    @ic = [@ic,0].max
  end

  def a(param = @a)
    @a = param
  end


  def in
    gets.chomp.to_i
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
    type == :jmp || type == :jnz || type == :jgz || type == :jlz || type == :jez
  end
end
