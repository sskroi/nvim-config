; extends

; SQL highlighting in raw string literals
((raw_string_literal) @injection.content
  (#lua-match? @injection.content "^`%s*SELECT%s*")
  (#offset! @injection.content 0 1 0 -1)
  (#set! injection.language "sql"))

((raw_string_literal) @injection.content
  (#lua-match? @injection.content "^`%s*INSERT%s*")
  (#offset! @injection.content 0 1 0 -1)
  (#set! injection.language "sql"))

((raw_string_literal) @injection.content
  (#lua-match? @injection.content "^`%s*UPDATE%s*")
  (#offset! @injection.content 0 1 0 -1)
  (#set! injection.language "sql"))

((raw_string_literal) @injection.content
  (#lua-match? @injection.content "^`%s*DELETE%s*")
  (#offset! @injection.content 0 1 0 -1)
  (#set! injection.language "sql"))

((raw_string_literal) @injection.content
  (#lua-match? @injection.content "^`%s*ALTER%s*")
  (#offset! @injection.content 0 1 0 -1)
  (#set! injection.language "sql"))

((raw_string_literal) @injection.content
  (#lua-match? @injection.content "^`%s*WITH%s*")
  (#offset! @injection.content 0 1 0 -1)
  (#set! injection.language "sql"))

((raw_string_literal) @injection.content
  (#lua-match? @injection.content "^`%s*CREATE%s*")
  (#offset! @injection.content 0 1 0 -1)
  (#set! injection.language "sql"))


;((raw_string_literal) @injection.content
;  (#lua-match? @injection.content "^`%s*[Ss][Ee][Ll][Ee][Cc][Tt]%s*")
;    (#offset! @injection.content 0 1 0 -1)
;    (#set! injection.language "sql"))
;
;((raw_string_literal) @injection.content
;  (#lua-match? @injection.content "^`%s*[Ii][Nn][Ss][Ee][Rr][Tt]%s*")
;    (#offset! @injection.content 0 1 0 -1)
;    (#set! injection.language "sql"))
;
;((raw_string_literal) @injection.content
;  (#lua-match? @injection.content "^`%s*[Uu][Pp][Dd][Aa][Tt][Ee]%s*")
;    (#offset! @injection.content 0 1 0 -1)
;    (#set! injection.language "sql"))
;
;((raw_string_literal) @injection.content
;  (#lua-match? @injection.content "^`%s*[Uu][Pp][Ss][Ee][Rr][Tt]%s*")
;    (#offset! @injection.content 0 1 0 -1)
;    (#set! injection.language "sql"))
;
;((raw_string_literal) @injection.content
;  (#lua-match? @injection.content "^`%s*[Dd][Ee][Ll][Ee][Tt][Ee]%s*")
;    (#offset! @injection.content 0 1 0 -1)
;    (#set! injection.language "sql"))
;
;((raw_string_literal) @injection.content
;  (#lua-match? @injection.content "^`%s*[Rr][Ee][Pp][Ll][Aa][Cc][Ee]%s*")
;    (#offset! @injection.content 0 1 0 -1)
;    (#set! injection.language "sql"))
;
;((raw_string_literal) @injection.content
;  (#lua-match? @injection.content "^`%s*[Aa][Ll][Tt][Ee][Rr]%s*")
;    (#offset! @injection.content 0 1 0 -1)
;    (#set! injection.language "sql"))
;
;((raw_string_literal) @injection.content
;  (#lua-match? @injection.content "^`%s*[Ww][Ii][Tt][Hh]%s*")
;    (#offset! @injection.content 0 1 0 -1)
;    (#set! injection.language "sql"))
;
;((raw_string_literal) @injection.content
;  (#lua-match? @injection.content "^`%s*[Ee][Xx][Pp][Ll][Ll][Aa][Ii][Nn]%s*")
;    (#offset! @injection.content 0 1 0 -1)
;    (#set! injection.language "sql"))
;
;((raw_string_literal) @injection.content
;  (#lua-match? @injection.content "^`%s*[Cc][Rr][Ee][Aa][Tt][Ee]%s*")
;    (#offset! @injection.content 0 1 0 -1)
;    (#set! injection.language "sql"))
;
;((interpreted_string_literal) @injection.content
;  (#lua-match? @injection.content "^`%s*[Ss][Ee][Ll][Ee][Cc][Tt]%s*")
;    (#offset! @injection.content 0 1 0 -1)
;    (#set! injection.language "sql"))
;
;((interpreted_string_literal) @injection.content
;  (#lua-match? @injection.content "^`%s*[Ii][Nn][Ss][Ee][Rr][Tt]%s*")
;    (#offset! @injection.content 0 1 0 -1)
;    (#set! injection.language "sql"))
;
;((interpreted_string_literal) @injection.content
;  (#lua-match? @injection.content "^`%s*[Uu][Pp][Dd][Aa][Tt][Ee]%s*")
;    (#offset! @injection.content 0 1 0 -1)
;    (#set! injection.language "sql"))
;
;((interpreted_string_literal) @injection.content
;  (#lua-match? @injection.content "^`%s*[Uu][Pp][Ss][Ee][Rr][Tt]%s*")
;    (#offset! @injection.content 0 1 0 -1)
;    (#set! injection.language "sql"))
;
;((interpreted_string_literal) @injection.content
;  (#lua-match? @injection.content "^`%s*[Dd][Ee][Ll][Ee][Tt][Ee]%s*")
;    (#offset! @injection.content 0 1 0 -1)
;    (#set! injection.language "sql"))
;
;((interpreted_string_literal) @injection.content
;  (#lua-match? @injection.content "^`%s*[Rr][Ee][Pp][Ll][Aa][Cc][Ee]%s*")
;    (#offset! @injection.content 0 1 0 -1)
;    (#set! injection.language "sql"))
;
;((interpreted_string_literal) @injection.content
;  (#lua-match? @injection.content "^`%s*[Aa][Ll][Tt][Ee][Rr]%s*")
;    (#offset! @injection.content 0 1 0 -1)
;    (#set! injection.language "sql"))
;
;((interpreted_string_literal) @injection.content
;  (#lua-match? @injection.content "^`%s*[Ww][Ii][Tt][Hh]%s*")
;    (#offset! @injection.content 0 1 0 -1)
;    (#set! injection.language "sql"))
;
;((interpreted_string_literal) @injection.content
;  (#lua-match? @injection.content "^`%s*[Ee][Xx][Pp][Ll][Ll][Aa][Ii][Nn]%s*")
;    (#offset! @injection.content 0 1 0 -1)
;    (#set! injection.language "sql"))
;
;((interpreted_string_literal) @injection.content
;  (#lua-match? @injection.content "^`%s*[Cc][Rr][Ee][Aa][Tt][Ee]%s*")
;    (#offset! @injection.content 0 1 0 -1)
;    (#set! injection.language "sql"))
