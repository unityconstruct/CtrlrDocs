#!/usr/bin/lua

function inout()
  local inp = assert(io.open(arg[1], "rb"))
  local out = assert(io.open(arg[2], "wb"))
  local data = inp:read("*all")
  data = string.gsub(data, "\r\n", "\n")
  out:write(data)
  assert(out:close())
end

local filename = "/home/setup/data/git-ctrlr/CtrlrXY/CtrlrDocs/lua/learn/play/io/data.csv"
-- local inp = assert(io.open(filename))
-- local currentLine = inp:read("*line")
-- print(currentLine)
-- assert(inp:close())

function readTextFile(pathString)

  -- open file, read lines to lines{}, then close
  local inp = assert(io.open(pathString))
  local lines = {}
  for line in inp:lines() do
    table.insert(lines,line)
  end
  inp:close()

  -- iterate the lines{} table to extract each row and each cell
  local rows = {}      -- stores each csv row
  for i=1,#lines,1 do  -- iterate rows
    print(lines[i])
    local l = lines[i] -- single csv row
    local row = {}     -- single row capture
    -- token count must equal number of patterns specified in gmatch pattern
    --for x,y,z in string.gmatch(l,'(%a+),(%a+),(%a+)') do  -- support non-quoted csv values
    for a,b,c,d,e,f,g,h,i in string  -- iterated cells
        .gmatch(l,'"(.+)","(.+)","(.+)","(.+)","(.+)","(.+)","(.+)","(.+)","(.+)"') do  -- "(.+)" = "(and any number of printable chars)"
        row[1] = a
        row[2] = b
        row[3] = c
        row[4] = d
        row[5] = e
        row[6] = f
        row[7] = g
        row[8] = h
        row[9] = i
    end
    rows[#rows+1] = row

    print(#row)
    print(#rows)



  end

  -- iterate the table of rows, and concatenate cells (replacing "" with ")
  for i=1,#rows,1 do
    local rowstring = ""
    for j=1,#rows[i] do
       rowstring = rowstring .. string.format('%-20s: ',  -- tabulate with 20 char padding
        string.gsub(rows[i][j],'""','"' )                 -- replace double with single quote
       )
    end
    print(rowstring)
end

--   local currentLine = inp:read("*line")
--   print(currentLine)
--   assert(inp:close())

end
filename = "/home/setup/data/git-ctrlr/CtrlrXY/CtrlrDocs/lua/learn/play/io/emu.csv"
readTextFile(filename)
--local data = inf:read("*all")
