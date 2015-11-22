class Sub
  def initialize(source)
    @source = source
  end

  def execute(model)
    if @source.is_a? Integer
      model.a(model.a - @source)
    else
      model.a(model.a - model.send(@source))
    end
  end
end
