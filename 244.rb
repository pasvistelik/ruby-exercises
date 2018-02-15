require 'benchmark'

def count_checksum(steps_str)
  steps_str.chars.inject(0){|checksum, m| (checksum * 243 + m.ord) % 100_000_007}
end

def get_empty_cell_multiindex(state)
  position_index = state.index('0')
  [position_index / 4, position_index % 4]
end

def get_new_state(state, step_type)
  new_state = state.clone
  i, j = get_empty_cell_multiindex(new_state)
  case step_type
    when "R" then new_state[i*4 + j], new_state[i*4 + j - 1] = new_state[i*4 + j - 1], "0"
    when "L" then new_state[i*4 + j], new_state[i*4 + j + 1] = new_state[i*4 + j + 1], "0"
    when "D" then new_state[i*4 + j], new_state[(i-1)*4 + j] = new_state[(i-1)*4 + j], "0"
    when "U" then new_state[i*4 + j], new_state[(i+1)*4 + j] = new_state[(i+1)*4 + j], "0"
  end
  new_state
end

def try_push_state(states, current_state, step_type, final_state)
  new_state = get_new_state(current_state[0], step_type)

  new_state_obj = [new_state, current_state[1] + step_type, current_state]

  if !is_state_used_before?(new_state_obj) #!states.find{|st| st[0] == new_state}
    states.push(new_state_obj)
  end
  #p states
  new_state == final_state
end

def is_state_used_before?(new_state_obj)
  state = new_state_obj[0]
  current = new_state_obj
  while(current = current[2])
    if state == current[0]
      #p [state, current[0]]
      return true
    end
  end
  false
end



  start_state = "0122112211221122"
  final_state = "0212212112122121"
  #final_state = "1122122210121122"
  #final_state = "1122112212221120"

  start_state, final_state = final_state, start_state

  states = [
    # state, path, prev_state
    [start_state, "", nil]
  ]
  path_finded = false
  #arr = []
  (0..Float::INFINITY).each do |n|
    current_level_states = nil

    current_level_states = states.select{|st| st[1].length == n}

    #p current_level_states
    #puts "\n\n"

    p current_level_states.length

    current_level_states.each do |current_state|


      i, j = get_empty_cell_multiindex(current_state[0])

      path_finded = true if try_push_state(states, current_state, "R", final_state) if j > 0


      path_finded = true if try_push_state(states, current_state, "L", final_state) if j < 3


      path_finded = true if try_push_state(states, current_state, "D", final_state) if i > 0


      path_finded = true if try_push_state(states, current_state, "U", final_state) if i < 3



      #p states
      #puts ""
    end

    p n
    #p states
    #puts ""

    break if path_finded

  end

  #p states
  #p states.map{|s| s[0..1]}
  #p states.select{|st| st[0] == final_state}.map{|s| s[0..1]}
  #p states.map{|s| s[1]}
  p states.select{|st| st[0] == final_state}.map{|s| s[1]}
  #states.map{|s| p [s[0], s[1]]}
  p states.select{|st| st[0] == final_state}.map{|s| s[1]}.inject(0){|sum, i| sum + count_checksum(i)}
