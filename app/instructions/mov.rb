class Mov
  def initialize (source, destination)
    @source = source
    @destination = destination
  end

  def execute(model)
    send_to_destination(model)
  end

  def source_value(model)
    if @source.is_a? Integer
      @source
    elsif @source.is_a? Array
      model.pending_core(@source[0])
    else
      model.send(@source)
    end
  end

  def send_to_destination(model)
    if @destination.is_a? Array
      model.send_to_core(@destination[0], source_value(model))
    else
      model.send(@destination, source_value(model))
    end
  end
end
