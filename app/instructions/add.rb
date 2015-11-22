class Add
  def initialize(source)
    @source = source
  end

  def execute(model)
    model.a+=model.send(@source)
  end
end
