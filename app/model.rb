class Model
  attr_accessor :a
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
      puts @instructions[curr_ic]
      @instructions[curr_ic].execute
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
