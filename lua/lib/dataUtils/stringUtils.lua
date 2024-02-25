


-- Write variables to string:
a = 'a'
b = 10
c = string.format('%s%s',a,b)
console('c = '..c)


-- Insert values into a hexstring:
val1 = 1
val2 = 10
hexstring = string.format('f0 18 21 %.2x  55 01 02 5f 01 %.2x 00 6b f7', val1, val2)
-- produces:
--f0 18 21 01 55 01 02 5f 01 0a 00 6b f7