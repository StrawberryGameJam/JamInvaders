
function update(first, second)
    dx = first and "first"
            or second and "second"
            or 0

    print(dx)
end


update(true, false)
update(true, true)
update(false, false)
update(false, true)