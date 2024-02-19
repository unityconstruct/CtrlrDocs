# Efficient-Round-Function
This takes advantage of the limits of the double precision numbers. It does rounding with only Addition, which is computationally efficient.
```lua
function round(num)
    return num + (2^52 + 2^51) - (2^52 + 2^51)
end
```