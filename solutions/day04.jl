using StaticArrays

raw_data = readlines("../inputs/day04_example.txt")

bingo_number_str = raw_data[1]
boards_str = raw_data[3:end]
num_boards = Int((length(boards_str) + 1) / 6)

function vecvec_to_matrix(vecvec)
    dim1 = length(vecvec)
    dim2 = length(vecvec[1])
    my_array = zeros(Int64, dim1, dim2)
    for i = 1:dim1
        for j = 1:dim2
            my_array[i, j] = vecvec[i][j]
        end
    end
    return my_array
end

function board_str2num(lines)
    board_vecvec = [[parse(Int, val) for val in split(line, " ", keepempty = false)] for line in lines]
    return [vecvec_to_matrix(board) for board in board_vecvec]
end

function check_numbers(numbers, board)
    return [board .== num for num in numbers]
end

function check_bingo(numbers, board)
    board_check = check_numbers(numbers, board)
    col_sum = sum(board_check, dims = 1)
    row_sum = sum(board_check, dims = 2)

    return row_sum
end

boards = [board_str2num(boards_str[6*(ii-1)+1:6*(ii-1)+5]) for ii in range(1, num_boards)]


display(boards[1])
println("")
display(boards[2])
println("")
display(boards[3])
println("")

display(check_numbers(boards[2], [10, 16, 15, 9, 19]))