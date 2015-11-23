require_relative 'controller'
require_relative 'parser'
require_relative 'instructions/instructions'
require_relative 'model'
fail if ARGV.length != 1
v1 = ARGV[0]
sets = Parser.new.parse_file(v1)
cont = Controller.new(sets)
cont.main_loop
