-- Compiled by Saturnus compiler, warning: Changes may be discarded!
local argv = {...};
local function monody_pairs(iterable, ...)
  local argv = {...};
  local next = pairs(iterable);
  return table.unpack({function(t, kv, ...)
    local argv = {...};
    local key = next(t, kv ~= nil and kv._0 or nil);
    if key == nil then
      local argv = {...};
      return nil;
    end
    return {_0 = key, _1 = t[key]};
  end, iterable, nil});
end
local function collect_stack(...)
  local argv = {...};
  local stack = {};
  local i = 1;
  while true do
    local argv = {...};
    local info = debug.getinfo(i, 'S');
    if info == nil then
      local argv = {...};
      break;
    end
    stack[i] = info.source;
    i = i + 1;
  end
  return stack;
end
local function panic(message, ...)
  local argv = {...};
  print("PANIC! " .. tostring(message == nil and "" or message));
  for pair in monody_pairs(collect_stack()) do
    local argv = {...};
    if pair ~= nil then
      local argv = {...};
      local _, value;
      do
        local __destructure__ = pair;
        _ = __destructure__._0;
        value = __destructure__._1;
      end
      print("at " .. value);
    end
  end
  error();
end
local Result = {};
Result.__meta__ = {};
Result.__meta__.__call = function(self, struct)
  return setmetatable(struct, self.prototype.__meta__);
end;
Result.prototype = {};
Result.prototype.__meta__ = {};
Result.prototype.__meta__.__index = Result.prototype;
setmetatable(Result, Result.__meta__);
Result.ok = function(value, ...)
  local argv = {...};
  return Result({value = value, ok = true});
end;
Result.err = function(err, ...)
  local argv = {...};
  return Result({err = err, ok = false});
end;
Result.prototype.map = function(self, mapper, ...)
  local argv = {...};
  if self.ok then
    local argv = {...};
    return Result.ok(mapper(self.value));
  else
    local argv = {...};
    return self;
  end
end;
Result.prototype.unwrap = function(self, ...)
  local argv = {...};
  if self.ok then
    local argv = {...};
    return self.value;
  end
  panic('Unwrap result error: ' .. tostring(self.err));
end;
Result.prototype.unwrap_err = function(self, ...)
  local argv = {...};
  if not self.ok then
    local argv = {...};
    return self.err;
  end
  panic('Unwrap err result error: result is OK!');
end;
Result.prototype.unwrap_or = function(self, alternative, ...)
  local argv = {...};
  if self.ok then
    local argv = {...};
    return self.value;
  end
  return alternative;
end;
Result.prototype.expect = function(self, message, ...)
  local argv = {...};
  if self.ok then
    local argv = {...};
    return self.value;
  end
  panic('Expected result value: ' .. tostring(message));
end;
Result.prototype.to_iter = function(self, ...)
  local argv = {...};
  if self.ok then
    local argv = {...};
    local out = {};
    out[self.value] = self.value;
    return pairs(out);
  end
  return pairs({});
end;
local Option = {};
Option.__meta__ = {};
Option.__meta__.__call = function(self, struct)
  return setmetatable(struct, self.prototype.__meta__);
end;
Option.prototype = {};
Option.prototype.__meta__ = {};
Option.prototype.__meta__.__index = Option.prototype;
setmetatable(Option, Option.__meta__);
Option.some = function(value, ...)
  local argv = {...};
  return Option({value = value, some = true});
end;
Option.none = function(...)
  local argv = {...};
  return Option({some = false});
end;
Option.prototype.map = function(self, mapper, ...)
  local argv = {...};
  if self.some then
    local argv = {...};
    return Option.some(mapper(self.value));
  else
    local argv = {...};
    return self;
  end
end;
Option.prototype.unwrap = function(self, ...)
  local argv = {...};
  if self.some then
    local argv = {...};
    return self.value;
  end
  panic('Attempting to unwrap empty option');
end;
Option.prototype.unwrap_or = function(self, alternative, ...)
  local argv = {...};
  if self.some then
    local argv = {...};
    return self.value;
  end
  return alternative;
end;
Option.prototype.expect = function(self, message, ...)
  local argv = {...};
  if self.some then
    local argv = {...};
    return self.value;
  end
  panic('Expected option value: ' .. tostring(message));
end;
Option.prototype.to_iter = function(self, ...)
  local argv = {...};
  if self.some then
    local argv = {...};
    local out = {};
    out[self.value] = self.value;
    return pairs(out);
  end
  return pairs({});
end;
local const = function(value, ...)
  return function(...)
    return value;
  end;
end;
local identity = function(a, ...)
  return a;
end;
local function capture(...)
  local argv = {...};
  local tup = {};
  for key in pairs(argv) do
    local argv = {...};
    tup["_" .. (key - 1)] = argv[key];
  end
  return tup;
end
local function mixin(source, ...)
  local argv = {...};
  return function(target, name, ...)
    local argv = {...};
    local root_index = target.prototype.__meta__.__index;
    target.prototype.super = target.prototype.super == nil and {} or target.prototype.super;
    target.prototype.super[source] = source.prototype;
    target.prototype.__meta__.__index = function(t, key, ...)
      local argv = {...};
      if type(root_index) == "function" then
        local argv = {...};
        return root_index(t, key, table.unpack(argv));
      end
      if root_index[key] ~= nil then
        local argv = {...};
        return root_index[key];
      end
      return source.prototype[key];
    end;
  end;
end
local function trait(...)
  local argv = {...};
  return function(target, trait, ...)
    local argv = {...};
    target.__meta__.__call = function(...)
      return panic("Cannot construct a trait class: " .. trait .. " is marked as a trait class!");
    end;
  end;
end
local function abstract(...)
  local argv = {...};
  return function(target, field, name, ...)
    local argv = {...};
    target.prototype[field] = function(...)
      local argv = {...};
      error("Attempting to call abstract method " .. name .. "::" .. field);
    end;
  end;
end
local function find(test, tbl, ...)
  local argv = {...};
  if tbl ~= nil then
    local argv = {...};
    for k in pairs(tbl) do
      local argv = {...};
      if test(tbl[k], k) then
        local argv = {...};
        return k;
      end
    end
    return nil;
  end
  return function(tbl, ...)
    local argv = {...};
    for k in pairs(tbl) do
      local argv = {...};
      if test(tbl[k], k) then
        local argv = {...};
        return k;
      end
    end
  end;
end
local function __arrow_right(left, right, ...)
  local argv = {...};
  return right(left);
end
local function param(name, test, ...)
  local argv = {...};
  return function(target, field, _, args, ...)
    local argv = {...};
    local original = target.prototype.field;
    local i = __arrow_right(args, find(function(field, ...)
      return name == field;
    end));
    if i == nil then
      local argv = {...};
      error("No field named '" .. name .. "' found!");
    end
    target.prototype.field = function(self, ...)
      local argv = {...};
      if not test(argv[i]) then
        local argv = {...};
        error("Runtime check failed: argument '" .. field .. "' has an invalid type!");
      end
      return target.prototype.field(self, table.unpack(argv));
    end;
  end;
end
local function is_string(value, ...)
  local argv = {...};
  return type(value) == "string";
end
local function is_number(value, ...)
  local argv = {...};
  return type(value) == "number";
end
local function is_object(value, ...)
  local argv = {...};
  return type(value) == "table";
end
return {panic = panic, Result = Result, Option = Option, const = const, identity = identity, capture = capture, pairs = monody_pairs, trait = trait, mixin = mixin, abstract = abstract, param = param, is_string = is_string, is_number = is_number, is_object = is_object, collect_stack = collect_stack, __arrow_right = __arrow_right, find = find};