class Jmp
  def initialize(ic)
    @ic = ic
  end

  def execute(model)
    puts "pre inc jump ic #{model.ic}"
    puts "#{model.ic += @ic} INCREMENT FROM JUMP"
  end
end
