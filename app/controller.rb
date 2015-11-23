#controller.rb

class Controller

  def initialize(instruction_sets)
    @cores = instruction_sets.map do |set|
      Model.new(set)
    end
    @in_proccess = true

  end

  def main_loop
    #execute all
    #loop until all processes done
    # => check out buffers and add to in buffers if needed


    ex = Thread.new{ execute_all }

    while @in_proccess
      @cores.each.with_index do |core,index|
        if !core.out_buffer.empty?
          core_entry = core.out_buffer.shift
          transfer_value(index,core_entry[0],core_entry[1])
        end

      end
    end
    ex.join
  end

  def execute_all
    threads = []
    @cores.each do |core|
      threads.push Thread.new { core.instruction_loop }
    end

    threads.each do |thread|
      thread.join
    end
    @in_proccess = false
  end

  def transfer_value(from,to,value)
    puts "TRANSFERING VALUE #{value} FROM #{from} TO #{to}"
    @cores[to].in_buffer.push([from,value])
  end


end
