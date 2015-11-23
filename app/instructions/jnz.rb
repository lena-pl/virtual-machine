class Jnz
  def initialize(ic)
    @ic = ic
  end

  def execute(model)
    if model.a != 0
      model.ic += @ic
    else
      model.ic +=1
    end
  end
end
