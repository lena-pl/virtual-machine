class Mov
  def initialize (source, destination)
    @source = source
    @destination = destination
  end

  def execute(model)
    if @source.is_a? Integer
      model.send(@destination, @source)
    else
      model.send(@destination, model.send(@source))
    end
  end
end
