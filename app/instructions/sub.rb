class Sub
  def initialize(source)
    @source = source
  end

  def execute
    if @source.is_a? Integer
      model.a-=@source
    else
      model.a-=model.send(@source)
    end
  end
end
