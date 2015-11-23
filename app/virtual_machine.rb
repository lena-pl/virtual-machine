require_relative 'model'
require_relative 'parser'
require_relative 'instructions/instructions'
fail if ARGV.length != 1
v1 = ARGV[0]
model = Model.new(Parser.new.parse_file(v1))

model.instruction_loop
