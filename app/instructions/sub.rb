class Sub
  def initialize(source)
    @source = source
  end

  def execute(model)
    if @source.is_a? Integer
      model.a(model.a - @source)
    elsif @source.is_a? Array
      data = model.pending_core(@source[0])
      model.a(model.a - data)
    else
      model.a(model.a - model.send(@source))
    end
  end
end
