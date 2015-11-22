class Add
  def initialize(source)
    @source = source
  end

  def execute(model)
    if @source.is_a? Integer
      model.a+=@source
    else
      model.a+=model.send(@source)
    end
  end
end
