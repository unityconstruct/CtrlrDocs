#!/usr/bin/lua
-- Code from Programming in Lua: 16 – Object-Oriented Programming
-- https://www.lua.org/pil/16.html
-- https://www.lua.org/pil/16.1.html
-- https://www.lua.org/pil/16.2.html


Name = "SimpleTonName"


-- Account = { balance=0,
--                 withdraw = function (self, v)
--                              self.balance = self.balance - v
--                            end
-- }

Account = {balance = 0}

---Creates a new account using an existing definition. 
--- Illustrates Object Oriented Programming in Lua and 
--- how 'self' is used to create self-referencing objects
---@param o any Account to create
function Account:new (o)
    o = o or {} -- create object if not provider by arguments
    setmetatable(o,self)
    self.__index = self
    return o
end


function Account:deposit (dblCurrency)
    print("Account:Deposit: Balance: " .. self.balance .. " Add: " .. dblCurrency)
    self.balance = self.balance + dblCurrency
    print("Account:Deposit: New Balance: " .. self.balance)
end

function Account:withdraw (dblCurrency)
    print("Account:Withdrawl: Balance: " .. self.balance .. " Subtract: " .. dblCurrency)
    if dblCurrency > self.balance then 
        print("Account:Withdrawl:Error:Insufficient Funds: Balance: " .. self.balance .. " WithdrawlAttempt: " .. dblCurrency)
        error"insufficient funds" 
    end
    self.balance = self.balance - dblCurrency
    print("Account:Withdrawl: New Balance" .. self.balance)
end


function Account:printBalance(account)
    
    print("Balance: " .. self.balance)
    
end

SpecialAccount = Account:new()
s = SpecialAccount:new{limit=1100.00}

function SpecialAccount:withdraw (dblCurrency)
    print("SpecialAccount:Withdrawl: Balance: " .. self.balance .. " Subtract: " .. dblCurrency)
    if dblCurrency - self.balance >= self:getLimit() then
      print("SpecialAccount:Withdrawl:Error:Insufficient Funds: Balance: " .. self.balance .. " WithdrawlAttempt: " .. dblCurrency)
      error"insufficient funds"
    end
    self.balance = self.balance - dblCurrency
    print("SpecialAccount:Withdrawl: New Balance" .. self.balance)
end

function SpecialAccount:getLimit ()
    print("SpecialAccount:getLimit: " .. (self.limit or 0))
    return self.limit or 0
end

function s:getLimit ()
    print("s:Account:getLimit: " .. (self.balance * 0.10))
    return self.balance * 0.10
end

print("Account:")
Account.deposit(Account, 200.00)
Account.printBalance(Account)
Account:withdraw(95.00)
Account.printBalance(Account)
print("SpecialAccount:")
SpecialAccount.printBalance(s)
s:deposit(1100.00)
SpecialAccount.printBalance(s)
s:withdraw(200.00)
SpecialAccount.printBalance(s)
s:withdraw(200.00)
SpecialAccount.printBalance(s)
s:withdraw(200.00)
SpecialAccount.printBalance(s)
s:withdraw(200.00)
SpecialAccount.printBalance(s)
s:withdraw(200.00)
SpecialAccount.printBalance(s)
s:withdraw(200.00)
SpecialAccount.printBalance(s)
s:withdraw(200.00)
SpecialAccount.printBalance(s)


