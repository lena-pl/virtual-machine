class Sub
  def initialize(source)
    @source = source
  end

  def execute
    model.a-=model.send(@source)
  end
end
