class Jmp
  def initialize(ic)
    @ic = ic
  end

  def execute(model)
    model.ic += @ic
  end
end
