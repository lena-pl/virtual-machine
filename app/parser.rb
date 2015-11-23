#parser.rb

#TODO deal with comments ~ optional
class Parser

  def parse_file(filepath)
    current_core_num = 0
    instruction_sets = []
    instrs = File.read(filepath).split("\n").select { |i| !i.empty? }
    instrs.each do |instr|
      if is_core_number?(instr)
        current_core_num = remove_hash(instr).to_i
        instruction_sets.push([])
      else
        params = split_instr(instr)
        check_params(params)
        instruction_sets.last.push(parse_type(params))
      end
    end
    instruction_sets

  end

  private

  def parse_type(params)

    case params.shift
    when "mov"
      parse_mov(params)
    when "swp"
      parse_swap
    when "sav"
      parse_sav
    when "add"
      parse_add(params)
    when "sub"
      parse_sub(params)
    when "jmp"
      parse_jmp(params)
    when "jez"
      parse_jez(params)
    when "jnz"
      parse_jnz(params)
    when "jgz"
      parse_jgz(params)
    when "jlz"
      parse_jlz(params)
    else
      fail "Not a valid instruction"
    end

  end

  def parse_mov(params)
    Mov.new(make_param(params[0]),params[1].to_sym)
  end

  def parse_swap
    Swap.new
  end

  def parse_sav
    Sav.new
  end

  def parse_add(params)
    Add.new(make_param(params[0]))
  end

  def parse_sub(params)
    Sub.new(make_param(params[0]))
  end

  def parse_jmp(params)
    Jmp.new(params[0].to_i)
  end

  def parse_jez(params)
    Jez.new(params[0].to_i)
  end

  def parse_jnz(params)
    Jnz.new(params[0].to_i)
  end

  def parse_jgz(params)
    Jgz.new(params[0].to_i)
  end

  def parse_jlz(params)
    Jlz.new(params[0].to_i)
  end

  def make_param(param)
    if is_integer?(param)
      param.to_i
    elsif is_core_number?(param)
      [param.tr("#","").to_i]
    else
      param.to_sym
    end
  end

  def is_integer?(param)
    param.match(/[0-9]+/)!=nil
  end

  def is_core_number?(param)
    param.match(/^#[0-9]$/) != nil
  end

  def remove_hash(core_number)
    core_number.tr("#","")
  end

  def check_params(instrs)
    if instrs.length == 2
      fail "#{instrs[1]} is not a valid source" if !is_valid_source?(instrs[1])
    elsif instrs.length == 3
      fail "#{instrs[1]} is not a valid source" if !is_valid_source?(instrs[1])
      fail "#{instrs[2]} is not a valid destination" if !is_valid_dest?(instrs[2])
    else
      fail "Too many arguments for #{instrs[0]}!"
    end
  end

  def is_valid_source?(param)
    param == "in" || param == "a" || param == "null" || is_integer?(param) || is_core_number?(param)
  end

  def is_valid_dest?(param)
    param == "out" || param == "a" || param == "null" || is_core_number?(param)
  end

  def split_instr(instr)
    instr = instr.split(/[ ,]+/)
    instr.map(&:downcase)
  end

end
