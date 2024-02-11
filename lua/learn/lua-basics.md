# lua basics

## keywords
The following keywords are reserved and cannot be used as names:
```output
     and       break     do        else      elseif
     end       false     for       function  if
     in        local     nil       not       or
     repeat    return    then      true      until     while
```

## other lua tokens

- Lua is a case-sensitive language: and is a reserved word, but And and AND are two different, valid names. As a convention, names starting with an underscore followed by uppercase letters (such as _VERSION) are reserved for internal global variables used by Lua.

The following strings denote other tokens:

```
     +     -     *     /     %     ^     #
     ==    ~=    <=    >=    <     >     =
     (     )     {     }     [     ]
     ;     :     ,     .     ..    ...
```

- Literal strings can be delimited by matching single or double quotes, and can contain the following C-like escape sequences: '\a' (bell), '\b' (backspace), '\f' (form feed), '\n' (newline), '\r' (carriage return), '\t' (horizontal tab), '\v' (vertical tab), '\\' (backslash), '\"' (quotation mark [double quote]), and '\'' (apostrophe [single quote]). Moreover, a backslash followed by a real newline results in a newline in the string. A character in a string can also be specified by its numerical value using the escape sequence \ddd, where ddd is a sequence of up to three decimal digits. (Note that if a numerical escape is to be followed by a digit, it must be expressed using exactly three digits.) Strings in Lua can contain any 8-bit value, including embedded zeros, which can be specified as '\0'.

- Literal strings can also be defined using a long format enclosed by long brackets. We define an opening long bracket of level n as an opening square bracket followed by n equal signs followed by another opening square bracket. So, an opening long bracket of level 0 is written as [[, an opening long bracket of level 1 is written as [=[, and so on. A closing long bracket is defined similarly; for instance, a closing long bracket of level 4 is written as ]====]. A long string starts with an opening long bracket of any level and ends at the first closing long bracket of the same level. Literals in this bracketed form can run for several lines, do not interpret any escape sequences, and ignore long brackets of any other level. They can contain anything except a closing bracket of the proper level.

- For convenience, when the opening long bracket is immediately followed by a newline, the newline is not included in the string. As an example, in a system using ASCII (in which 'a' is coded as 97, newline is coded as 10, and '1' is coded as 49), the five literal strings below denote the same string:
```
     a = 'alo\n123"'
     a = "alo\n123\""
     a = '\97lo\10\04923"'
     a = [[alo
     123"]]
     a = [==[
     alo
     123"]==]
```

- A numerical constant can be written with an optional decimal part and an optional decimal exponent. Lua also accepts integer hexadecimal constants, by prefixing them with 0x. Examples of valid numerical constants are
```
     3   3.0   3.1416   314.16e-2   0.31416E1   0xff   0x56
```

- A comment starts with a double hyphen (--) anywhere outside a string. If the text immediately after -- is not an opening long bracket, the comment is a short comment, which runs until the end of the line. Otherwise, it is a long comment, which runs until the corresponding closing long bracket. Long comments are frequently used to disable code temporarily.

## Types

- There are eight basic types in Lua:
  - `nil`: Nil is the type of the value nil, whose main property is to be different from any other value; it usually represents the absence of a useful value
  - `boolean`: Boolean is the type of the values false and true
  - `number`: Number represents real (double-precision floating-point) numbers
  - `string`: String represents arrays of characters
  - `function`: Lua can call (and manipulate) functions written in Lua and functions written in C (see §2.5.8).
  - `userdata`: The type userdata is provided to allow arbitrary C data to be stored in Lua variables. This type corresponds to a block of raw memory and has no pre-defined operations in Lua, except assignment and identity test. However, by using metatables, the programmer can define operations for userdata values (see §2.8). Userdata values cannot be created or modified in Lua, only through the C API. This guarantees the integrity of data owned by the host program.
  - `thread`: The type thread represents independent threads of execution and it is used to implement coroutines (see §2.11). Do not confuse Lua threads with operating-systwem threads. Lua supports coroutines on all systems, even those that do not support threads.
  - `table`: The type table implements associative arrays, that is, arrays that can be indexed not only with numbers, but with any value (except nil). Tables can be heterogeneous; that is, they can contain values of all types (except nil). Tables are the sole data structuring mechanism in Lua; they can be used to represent ordinary arrays, symbol tables, sets, records, graphs, trees, etc. To represent records, Lua uses the field name as an index. The language supports this representation by providing a.name as syntactic sugar for a["name"]. There are several convenient ways to create tables in Lua (see §2.5.7).

### Notes
- Both nil and false make a condition false; any other value makes it true
- (It is easy to build Lua interpreters that use other internal representations for numbers, such as single-precision float or long integers; see file luaconf.h.)
- Lua is 8-bit clean: strings can contain any 8-bit character, including embedded zeros ('\0') (see §2.1).
- Like indices, the value of a table field can be of any type (except nil). In particular, because functions are first-class values, table fields can contain functions. Thus tables can also carry methods (see §2.5.9).
- Tables, functions, threads, and (full) userdata values are objects: variables do not actually contain these values, only references to them. 
- Assignment, parameter passing, and function returns always manipulate references to such values; these operations do not imply any kind of copy.
- The library function type returns a string describing the type of a given value.
## Coercion
- Lua provides automatic conversion between string and number values at run time. Any arithmetic operation applied to a string tries to convert this string to a number, following the usual conversion rules. Conversely, whenever a number is used where a string is expected, the number is converted to a string, in a reasonable format. For complete control over how numbers are converted to strings, use the format function from the string library (see string.format).



## Variables
var.Name = var["Name"]

## Global Vars exist in a global 'environment table
- functions inherit the env table
- `_env.x = gettable_event(_env,"x")`
- `gettable_event()` doesn't exist as an accessible function in lua, but just shows _env.x equivalency

## Control Structures
- The control structures if, while, and repeat have the usual meaning and familiar syntax:

  - `while exp do block end`
  - `repeat block until exp`
  - `if exp then block {elseif exp then block} [else block] end`

- Lua also has a for statement, in two flavors (see §2.4.5).
- The condition expression of a control structure can return any value. Both false and nil are considered false. All values different from nil and false are considered true (in particular, the number 0 and the empty string are also true).
- In the repeat–until loop, the inner block does not end at the until keyword, but only after the condition. So, the condition can refer to local variables declared inside the loop block.
- The return statement is used to return values from a function or a chunk (which is just a function). Functions and chunks can return more than one value, and so the syntax for the return statement is
  - `return [explist]`
- The break statement is used to terminate the execution of a while, repeat, or for loop, skipping to the next statement after the loop:
  - `break`
  - A break ends the innermost enclosing loop.
- The return and break statements can only be written as the last statement of a block. If it is really necessary to return or break in the middle of a block, then an explicit inner block can be used, as in the idioms do return end and do break end, because now return and break are the last statements in their (inner) blocks.

## For Loop
```lua
for v = e1, e2, e3 do block end
```
- is equivalent to the code:
```lua
     do
       local var, limit, step = tonumber(e1), tonumber(e2), tonumber(e3)
       if not (var and limit and step) then error() end
       while (step > 0 and var <= limit) or (step <= 0 and var >= limit) do
         local v = var
         block
         var = var + step
       end
     end
```
### Note the following:
- All three control expressions are evaluated only once, before the loop starts. They must all result in numbers.
- var, limit, and step are invisible variables. The names shown here are for explanatory purposes only.
- If the third expression (the step) is absent, then a step of 1 is used.
- You can use break to exit a for loop.
- The loop variable v is local to the loop; you cannot use its value after the for ends or is broken. If you need this value, assign it to another variable before breaking or exiting the loop.
