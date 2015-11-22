class Jgz
  def initialize(ic)
    @ic = ic
  end

  def execute(model)
    if model.a > 0
      model.ic += @ic
    end
  end
end
