#!/usr/local/bin



local s = "a cool function is gfind"
    local words = {}
    for w in string.gfind(s, '(%a+)' ) do
        table.insert(words, w)
    end
print("Original Text: ["..s.."]")
for i=1,#words,1 do
    print(string.format('%d : %s',i,words[i]))
end
    