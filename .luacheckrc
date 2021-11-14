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

-- disable warnings about secondary unused variables
unused_secondaries = false

-- ignore libraries: we don't care about those
exclude_files = {"**/lib/**"}
