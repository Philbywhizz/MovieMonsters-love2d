-- .luacheck configuration file

-- Set of Standard globals used
std = "max+love"

-- Allow defined globals
allow_defined_top = true

-- display warning codes
codes = true

-- display range of warning
ranges = true

-- enable the cache
cache = true

-- disable warnings about unused self
self = false

-- disable warnings about secondary unused variables
unused_secondaries = false

-- ignore some codes
ignore = {
    "212", -- ignore unused arguments
}

-- ignore libraries: we don't care about those
exclude_files = {"**/lib/**"}

files["main.lua"] = {ignore = {"131"}}
