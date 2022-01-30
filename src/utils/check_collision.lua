function check_collision(lower_limit, higher_limit, position, objetct_width)
    return ((position + objetct_width > higher_limit) and (position < lower_limit))
end