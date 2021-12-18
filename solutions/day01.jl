using DelimitedFiles

depths = readdlm("../inputs/day01.txt", '\t', Int, '\n')
changes = diff(depths, dims = 1)

increase_counter = 0
for change in changes
    if change > 0
        global increase_counter += 1
    end
end

println("Day 01 Part 1 Solution: ", increase_counter)


increase_counter = 0

current_window = depths[1:3]

for index in range(2, length(depths) - 2)
    next_window = depths[index:index+2]
    if sum(next_window) > sum(current_window)
        global increase_counter += 1
    end
    global current_window = next_window
end


println("Day 01 Part 2 Solution: ", increase_counter)