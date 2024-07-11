-- Compiled by Saturnus compiler, warning: Changes may be discarded!
local argv = {...};
local trait, mixin, abstract, param, is_string;
do
  local __destructure__ = require('monody');
  trait = __destructure__.trait;
  mixin = __destructure__.mixin;
  abstract = __destructure__.abstract;
  param = __destructure__.param;
  is_string = __destructure__.is_string;
end
local Solver = {};
Solver.__meta__ = {};
Solver.__meta__.__call = function(self, struct)
  return setmetatable(struct, self.prototype.__meta__);
end;
Solver.prototype = {};
Solver.prototype.__meta__ = {};
Solver.prototype.__meta__.__index = Solver.prototype;
setmetatable(Solver, Solver.__meta__);
Solver.prototype.resolve = function(self, source, ...)
  local argv = {...};
  if self.cache[source] ~= nil then
    local argv = {...};
    return self.cache[source];
  end
  local url = self:resolve_url(source);
  local src = http.get(url).readAll();
  local mod = load(src, source, "bt", {require = require});
  self.cache[source] = mod();
  return self.cache[source];
end;
trait()(Solver, "Solver");
Solver.prototype.resolve_url = function(self, source, ...)
  local argv = {...};
end;
trait()(Solver, "Solver");
Solver.prototype.is_valid = function(self, source, ...)
  local argv = {...};
end;
trait()(Solver, "Solver");
local HttpSolver = {};
HttpSolver.__meta__ = {};
HttpSolver.__meta__.__call = function(self, struct)
  return setmetatable(struct, self.prototype.__meta__);
end;
HttpSolver.prototype = {};
HttpSolver.prototype.__meta__ = {};
HttpSolver.prototype.__meta__.__index = HttpSolver.prototype;
setmetatable(HttpSolver, HttpSolver.__meta__);
HttpSolver.new = function(...)
  local argv = {...};
  return HttpSolver({cache = {}});
end;
mixin(Solver)(HttpSolver, "HttpSolver");
HttpSolver.prototype.is_valid = function(self, source, ...)
  local argv = {...};
  return source:find("^https?://") ~= nil;
end;
mixin(Solver)(HttpSolver, "HttpSolver");
HttpSolver.prototype.resolve_url = function(self, source, ...)
  local argv = {...};
  return source;
end;
mixin(Solver)(HttpSolver, "HttpSolver");
local GithubSolver = {};
GithubSolver.__meta__ = {};
GithubSolver.__meta__.__call = function(self, struct)
  return setmetatable(struct, self.prototype.__meta__);
end;
GithubSolver.prototype = {};
GithubSolver.prototype.__meta__ = {};
GithubSolver.prototype.__meta__.__index = GithubSolver.prototype;
setmetatable(GithubSolver, GithubSolver.__meta__);
GithubSolver.new = function(...)
  local argv = {...};
  return GithubSolver({cache = {}});
end;
mixin(Solver)(GithubSolver, "GithubSolver");
GithubSolver.prototype.is_valid = function(self, source, ...)
  local argv = {...};
  return source:find("^github:") ~= nil;
end;
mixin(Solver)(GithubSolver, "GithubSolver");
GithubSolver.prototype.resolve_url = function(self, source, ...)
  local argv = {...};
  local _, segment;
  do
    local __destructure__ = {source:match("^github:(.+)")};
    _ = __destructure__[0];
    segment = __destructure__[1];
  end
  return "https://raw.githubusercontent.com/" .. segment;
end;
mixin(Solver)(GithubSolver, "GithubSolver");
local PastebinSolver = {};
PastebinSolver.__meta__ = {};
PastebinSolver.__meta__.__call = function(self, struct)
  return setmetatable(struct, self.prototype.__meta__);
end;
PastebinSolver.prototype = {};
PastebinSolver.prototype.__meta__ = {};
PastebinSolver.prototype.__meta__.__index = PastebinSolver.prototype;
setmetatable(PastebinSolver, PastebinSolver.__meta__);
PastebinSolver.new = function(...)
  local argv = {...};
  return PastebinSolver({cache = {}});
end;
mixin(Solver)(PastebinSolver, "PastebinSolver");
PastebinSolver.prototype.is_valid = function(self, source, ...)
  local argv = {...};
  return source:find("^pastebin:") ~= nil;
end;
mixin(Solver)(PastebinSolver, "PastebinSolver");
PastebinSolver.prototype.resolve_url = function(self, source, ...)
  local argv = {...};
  local _, segment;
  do
    local __destructure__ = {source:match("^pastebin:(.+)")};
    _ = __destructure__[0];
    segment = __destructure__[1];
  end
  return "https://pastebin.com/raw/" .. segment;
end;
mixin(Solver)(PastebinSolver, "PastebinSolver");
local http_solver = HttpSolver.new();
local github_solver = GithubSolver.new();
local pastebin_solver = PastebinSolver.new();
local function grab(source, ...)
  local argv = {...};
  if http_solver:is_valid(source) then
    local argv = {...};
    return http_solver:resolve(source);
  elseif github_solver:is_valid(source) then
    local argv = {...};
    return github_solver:resolve(source);
  elseif pastebin_solver:is_valid(source) then
    local argv = {...};
    return pastebin_solver:resolve(source);
  else
    local argv = {...};
    return require(source);
  end
end
return {grab = grab};