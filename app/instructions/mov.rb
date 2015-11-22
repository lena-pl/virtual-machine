class Mov
  def initialize (source, destination)
    @source = source
    @destination = destination
  end

  def execute(model)
    model.send(@destination, model.send(@source))
  end
end
