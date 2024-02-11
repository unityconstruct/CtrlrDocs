# CtrlrDocs/lua/lib

- staging place for aggregating "all things Lua"
  - pull everything here
  - parse
  - organize into a hierarchy
  - add method header with @param & @result if applicable & known
  - add comments
  - test in panel
- review Ctrlr's LuaBind API and create 'wrapper methods' for each
  - create overloaded methods that all target a base method that accept all parameters so logic is in one place, but able to reach it in various ways
  - then add Util layer that implements the local Lua Scripts with value add functionality, error handling, and convenience methods
  - check the 60-lessons blogs for design patterns
    - document these
    - add to this library & feel around for derivative options
