require_relative 'model'
require_relative 'parser'
require_relative 'instructions/instructions'

model = Model.new(Parser.new.parse_file("./test.txt"))

model.instruction_loop
