class Swp
  def execute(model)
    a = model.a
    model.send(:a,model.send(:b))
    model.send(:b,a)
  end
end
