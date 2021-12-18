
horizontal_position = 0
vertical_position = 0

commands = readlines("../inputs/day02.txt")

for command in commands
    direction = split(command)[1]
    magnitude = parse(Int, split(command)[2])

    if direction == "up"
        global vertical_position += magnitude
    elseif direction == "down"
        global vertical_position -= magnitude
    elseif direction == "forward"
        global horizontal_position += magnitude
    end
end

depth = -vertical_position

println("Day 02 Part 1 Solution: ", horizontal_position * depth)


horizontal_position = 0
vertical_position = 0
aim = 0

for command in commands
    direction = split(command)[1]
    magnitude = parse(Int, split(command)[2])

    if direction == "up"
        global aim += magnitude
    elseif direction == "down"
        global aim -= magnitude
    elseif direction == "forward"
        global horizontal_position += magnitude
        global vertical_position += aim * magnitude
    end
end

depth = -vertical_position

println("Day 02 Part 2 Solution: ", horizontal_position * depth)