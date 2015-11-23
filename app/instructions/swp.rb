class Swp
  def execute(model)
    a = model.a
    model.a(model.b)
    model.b = a
  end
end
