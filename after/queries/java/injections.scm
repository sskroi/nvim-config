; extends

; SQL highlighting in raw string literals
((string_fragment) @injection.content
  (#lua-match? @injection.content "^%s*SELECT%s*")
  (#set! injection.language "sql"))

((string_fragment) @injection.content
  (#lua-match? @injection.content "^%s*INSERT%s*")
  (#set! injection.language "sql"))

((string_fragment) @injection.content
  (#lua-match? @injection.content "^%s*UPDATE%s*")
  (#set! injection.language "sql"))

((string_fragment) @injection.content
  (#lua-match? @injection.content "^%s*DELETE%s*")
  (#set! injection.language "sql"))

((string_fragment) @injection.content
  (#lua-match? @injection.content "^%s*ALTER%s*")
  (#set! injection.language "sql"))

((string_fragment) @injection.content
  (#lua-match? @injection.content "^%s*WITH%s*")
  (#set! injection.language "sql"))

((string_fragment) @injection.content
  (#lua-match? @injection.content "^%s*CREATE%s*")
  (#set! injection.language "sql"))


((multiline_string_fragment) @injection.content
  (#lua-match? @injection.content "^%s*SELECT%s*")
  (#set! injection.language "sql"))

((multiline_string_fragment) @injection.content
  (#lua-match? @injection.content "^%s*INSERT%s*")
  (#set! injection.language "sql"))

((multiline_string_fragment) @injection.content
  (#lua-match? @injection.content "^%s*UPDATE%s*")
  (#set! injection.language "sql"))

((multiline_string_fragment) @injection.content
  (#lua-match? @injection.content "^%s*DELETE%s*")
  (#set! injection.language "sql"))

((multiline_string_fragment) @injection.content
  (#lua-match? @injection.content "^%s*ALTER%s*")
  (#set! injection.language "sql"))

((multiline_string_fragment) @injection.content
  (#lua-match? @injection.content "^%s*WITH%s*")
  (#set! injection.language "sql"))

((multiline_string_fragment) @injection.content
  (#lua-match? @injection.content "^%s*CREATE%s*")
  (#set! injection.language "sql"))

