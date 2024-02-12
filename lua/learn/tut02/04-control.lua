#!/usr/bin/lua
value = true
if value then
    print(true)
elseif value ~= true then
    print(false)
else 
    print("nil")
end

local age = 15
if ( age < 16 ) then
    io.write("young","\n")
    localVar = 10
elseif ( age <=16) and (age <18) then
    io.write("you can drive","\n")
else
    io.write("you can vote","\n")
end

print(localVar)

-- NOT

print(string.format("not true =%s", tostring(not true)))

-- no ternary, BUT... yes
age = 13
-- canVote = age > 18 ? true : false
canVote = age > 18 and true or false
io.write("can i vote: ", tostring(canVote),"\n")



-- switch
quote = "aaaaaaaaaaaaabbbbbbbbbbbbbbbbbbbdddddddddddddjjjjjjjjjjjjjeeeeeeeelkjasdfiapoiwenma;lksdfgjadfklgja;sldkf a;lskjfpoijwe lklkj ;askdljf oijsd;lkfj, sfd "

io.write("Quote Length ", string.len(quote), "\n" )
io.write("Quote Length ", #quote, "\n" )
quote = "I am the greatest coder in the world and you know you not as good as me, so 'buzz off' horrible coder-dude "
io.write("Replace I with me: ", string.gsub(quote, "I", "me"), "\n" )



io.write("Index of buzz: ",string.find(quote, "buzz"),"\n")


io.write("Quote Upper",string.upper(quote),"\n")
io.write("Quote Lower",string.lower(quote),"\n")
--io.write("",,"\n")
--io.write("",,"\n")
--io.write("",,"\n")


for i=1,10,1 do
    io.write(i)
end

months = {"Jan", "Feb", "mar", "apr", "may", "june", "jul", "aug", "sep", "oct", "nov", "dec"}

for m,n in ipairs(months) do
    io.write(m, "-", n,  "\n")
end

for o,p in pairs(months) do
    io.write(o, "-", p,  "\n")
end

aTable = {}

for i = 1, 10 do
    aTable[i] = i
end

io.write("Table: ",aTable[1],"\n")
io.write("Table: ",#aTable,"\n")



table.insert(aTable, 1, 0)
io.write("Table: ",aTable[10],"\n")

print(table.concat(aTable, ", "))
print(table.concat(aTable, ","))
print(table.concat(aTable, "0x"))




aMultiTable = {}

for i = 0, 9 do
    aMultiTable[i] = {}
    for j = 0, 9 do
        aMultiTable[i][j] = tostring(i) .. tostring(j)
    end
end


io.write("Table[0][0] : ", aMultiTable[1][2], "\n" )


for i = 0, 9 do
    for j = 0, 9 do
        io.write(aMultiTable[i][j], " : ")
    end
end
io.write("\n")



function getSum(num1, num2)
 return num1 + num2
end


print(string.format("5 + 2 = %d", getSum(5,2)))

function splitString(theString)
    stringTable = {}
    local i = 1

    for str in string.gmatch(theString, "[^%s]+") do
        io.write("")
    end


end


-- Closure

doubleIt = function (x) return x * 2 end

print(doubleIt(4))

function outerFunc()
    local i = 0
    return function()
        i = i + 1
        return i
    end
end

getI = outerFunc()

print(getI())
print(getI())
print(getI())

-- Coroutine - Thread, but can't run in parallel
-- coroutine1, resume(start) will run until yields & then is suspended & pointer moves on
-- Coroutine2, resumt(start) runs util done & never suspends.. but it does complete(dead)
-- coroutine1, will the catch the pointer and proceed. Since 5 will be increated to 6, it will run to complete(dead)

co = coroutine.create(function()
    for i =1,10,1 do
        print(i)
        print(coroutine.status(co))
        if i == 5 then coroutine.yield() end
    end
end)

print(coroutine.status(co))
coroutine.resume(co)
print(coroutine.status(co))


co2 = coroutine.create(function()
    for i=101, 110, 1 do
        print(i)
    end end)

coroutine.resume(co2)
print(coroutine.status(co))
print(coroutine.status(co2))

coroutine.resume(co)
print(coroutine.status(co))
print(coroutine.status(co2))


-- file io

-- r: read
-- w: overwrite or create new
-- a: append
-- r+: read & write existing file
-- w+: Overwrite read or create file
-- a+: append read or create

 
-- module is a library

-- -- convert.lua name filename MUST match
-- -- file1: convert.lua
-- local convert = {}
-- function convert.ftToCm(feet)
--     return feet + 30.48
-- end
-- return convert
-- -- end of file

-- -- file2: convertModule.lua
-- convertModule = require("convert")
-- print(string.format("%.3f cm", convertModule.ftToCm(12)))


-- Faux Object Oriented Programming
Animal = {height = 0, weight = 0, name = "No Name"}

function Animal:new(height, weight, name)
    setmetatable({}, Animal)

    self.height = height
    self.weight = weight
    self.name = name

    return self
end

function Animal:toString()
    animalStr = string.format("%s weighs %.1f lbs, is %.1f in tall",self.name, self.weight, self.height)
    print(animalStr)
end

monkey = Animal:new(60,100,"Monkey") -- instantiate with ':'
Animal.toString(monkey)  -- calling methods using classname.methodname(instantiated object)
print(monkey:toString()) -- calling method using ':'
print(monkey.name)       -- accessing property with '.'


Cat = Animal:new()

function Cat:new(height, weight, name, color)
    setmetatable({}, Cat)

    self.height = height
    self.weight = weight
    self.name = name
    self.color = color

    return self
end


function Cat:toString()
    animalStr = string.format("%s is %s and weighs %.1f lbs, is %.1f in tall", self.name, self.color, self.weight, self.height)
    print(animalStr)
end


cookie = Cat:new(12, 6, "CookieMonster", "Black" )

print(cookie:toString())

cookie.weight = 50
print(Cat.toString(cookie))

























-- io.write("","","\n")
-- io.write("","","\n")
-- io.write("","","\n")
-- io.write("","","\n")
