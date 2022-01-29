function check_collision(lower_limit, higher_limit, position, objetct_widht)
    return (position < lower_limit or position+objetct_widht > higher_limit) 
end