#controller.rb

class Controller

  def initialize(instruction_sets)
    @cores = instruction_sets.map do |set|
      Model.new(set)
    end

  end

  def main_loop
    #execute all
    #loop until all processes done
    # => check out buffers and add to in buffers if needed
    execute_all
    while 1 == 1
      @cores.each.with_index do |index,core|
        if !core.out_buffer.empty?
          core_entry = core.shift
          transfer_value(index,core_entry[0],core_entry[1])
        end
      end
    end
  end


  def execute_all

    @cores.each do |core|
      fork do
        core.instruction_loop
      end
    end


  end

  def transfer_value(from,to,value)
    @core[to].in_buffer.push([from,value])
  end




end
