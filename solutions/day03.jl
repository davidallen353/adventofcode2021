

raw_data = readlines("../inputs/day03.txt")
num_bits = length(raw_data[1])

function line2ints(line)
    return map(x -> parse(Int, x), collect(line))
end

function get_power_consumption(data)


    function get_gamma(average_vals)
        output_string = ""
        for val in average_vals
            if val < 0.5
                output_string = output_string * "0"
            else
                output_string = output_string * "1"
            end
        end
        return parse(Int, output_string, base = 2)
    end

    function get_epsilon(average_vals)
        output_string = ""
        for val in average_vals
            if val < 0.5
                output_string = output_string * "1"
            else
                output_string = output_string * "0"
            end
        end
        return parse(Int, output_string, base = 2)
    end

    column_sums = sum(data)
    average_value = column_sums / length(data)

    gamma = get_gamma(average_value)
    epsilon = get_epsilon(average_value)

    return gamma * epsilon

end

int_data = map(x -> line2ints(x), raw_data)

power_consumption = get_power_consumption(int_data)
println("Day 03 Part 1 Solution: ", power_consumption)

function get_most_common_in_col(data, index)
    average_val = sum(data) / length(data)
    if average_val[index] >= 0.5
        return 1
    else
        return 0
    end
end

function get_least_common_in_col(data, index)
    average_val = sum(data) / length(data)
    if average_val[index] > 0.5
        return 0
    else
        return 1
    end
end

function filter_by_most_common_index(data, index)
    filter_val = get_most_common_in_col(data, index)
    return data[map(x -> x[index] == filter_val, data)]
end

function filter_by_least_common_index(data, index)
    filter_val = get_least_common_in_col(data, index)
    return data[map(x -> x[index] == filter_val, data)]
end

function get_oxygen_rating(data)
    output_data = data
    for ii in range(1, num_bits)
        if length(output_data) == 1
            break
        else
            output_data = filter_by_most_common_index(output_data, ii)
        end
    end

    output_string = ""
    for bit in output_data[1]
        output_string = output_string * string(bit)
    end
    return parse(Int, output_string, base = 2)
end

function get_co2_rating(data)
    output_data = data
    for ii in range(1, num_bits)
        _backup_data = output_data
        if length(output_data) == 1
            break
        else
            output_data = filter_by_least_common_index(output_data, ii)
        end

        if length(output_data) == 0
            output_data = _backup_data
        end
    end

    output_string = ""
    for bit in output_data[1]
        output_string = output_string * string(bit)
    end
    return parse(Int, output_string, base = 2)
end

oxygen_rating = get_oxygen_rating(int_data)
co2_rating = get_co2_rating(int_data)
life_support = oxygen_rating * co2_rating


println("Day 03 Part 2 Solution: ", life_support)