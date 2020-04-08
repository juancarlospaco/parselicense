import os, strutils, md5

template sanitize(s: string): string =
  s.multiReplace([(".txt", ""), ("-", " "), ("deprecated_", ""), ("acknowledgement", "")]).strip

func capwords*[T: string](a: T, sep: char=' '): string =
  for word in split(strutils.strip($a), $sep):
      result.add(strutils.capitalizeAscii(word))
      # result.add($sep)
  result = strutils.strip(result).replace(" ", "").replace(".", "")

proc genEnumLicenses(path: string) =
  var enums = "type Licenses* {.pure.} = enum ## Standard SPDX Licenses. See https://github.com/spdx/license-list-data/blob/master/text/\n"
  var dola = "case license ## Standard SPDX Licenses. See https://github.com/spdx/license-list-data/blob/master/text/\n"
  for file in walkPattern("*.txt"):
    echo file
    if '+' notin file:
      var f = readFile(file).strip.toLowerAscii
      var name = sanitize(file.extractFilename)
      enums.add "  " & capwords(name) & " = \"" & getMD5(f) & "\"\n"
      dola.add  "of " & capwords(name) & ": \"" & name & "\"\n"
  writeFile("dollars.nim", dola)
  writeFile("enums.nim", enums)

genEnumLicenses(getCurrentDir())
