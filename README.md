# parseLicense

- Parse Standard SPDX Licenses from string to Enum. `parseLicense(s: string): License`.
- [Tests. Documentation. Examples.](https://juancarlospaco.github.io/parselicense) Works at compile-time. Fast algo. `$` Dollar for human-friendly Standard name.


# Use

```nim
  static:
    const wtfplTxt = """DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE

Version 2, December 2004

Copyright (C) 2004 Sam Hocevar <sam@hocevar.net>

Everyone is permitted to copy and distribute verbatim or modified copies of
this license document, and changing it is allowed as long as the name is changed.

DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE

TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION

   0. You just DO WHAT THE FUCK YOU WANT TO.
"""
    doAssert parseLicense(wtfplTxt, default = Licenses.Mit) == Licenses.WTFPL
    doAssert parseLicense(wtfplTxt).get() == Licenses.WTFPL


    const zeroBsdTxt = """Copyright (C) 2006 by Rob Landley <rob@landley.net>

Permission to use, copy, modify, and/or distribute this software for any purpose
with or without fee is hereby granted.

THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES WITH
REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY
AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT,
INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM
LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE
OR OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
PERFORMANCE OF THIS SOFTWARE.
"""
    doAssert parseLicense(zeroBsdTxt, default = Licenses.Mit) == Licenses.ZeroBSD
    doAssert parseLicense(zeroBsdTxt).get() == Licenses.ZeroBSD


    const fairTxt = """Fair License <Copyright Information>

Usage of the works is permitted provided that this instrument is retained
with the works, so that any entity that uses the works is notified of this
instrument.

DISCLAIMER: THE WORKS ARE WITHOUT WARRANTY.
"""
    doAssert parseLicense(fairTxt, default = Licenses.Mit) == Licenses.Fair
    doAssert parseLicense(fairTxt).get() == Licenses.Fair

    const beerwareTxt = """"THE BEER-WARE LICENSE" (Revision 42):

<phk@FreeBSD.ORG> wrote this file. As long as you retain this notice you can
do whatever you want with this stuff. If we meet some day, and you think this
stuff is worth it, you can buy me a beer in return Poul-Henning Kamp
"""
    doAssert parseLicense(beerwareTxt, default = Licenses.Mit) == Licenses.Beerware
    doAssert parseLicense(beerwareTxt,).get() == Licenses.Beerware


    const curlTxt = """COPYRIGHT AND PERMISSION NOTICE Copyright (c) 1996 - 2015, Daniel Stenberg,
<daniel@haxx.se>.

All rights reserved.

Permission to use, copy, modify, and distribute this software for any purpose
with or without fee is hereby granted, provided that the above copyright notice
and this permission notice appear in all copies.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT OF THIRD PARTY RIGHTS. IN NO
EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES
OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
IN THE SOFTWARE.

Except as contained in this notice, the name of a copyright holder shall not
be used in advertising or otherwise to promote the sale, use or other dealings
in this Software without prior written authorization of the copyright holder.
"""
    doAssert parseLicense(curlTxt, default = Licenses.Mit) == Licenses.Curl
    doAssert parseLicense(curlTxt,).get() == Licenses.Curl


  ## Works with lowercased and uppercased Licenses.
  const iscTxt = toLowerAscii("""ISC License Copyright (c) 2004-2010 by Internet Systems Consortium, Inc. ("ISC")

Copyright (c) 1995-2003 by Internet Software Consortium

Permission to use, copy, modify, and /or distribute this software for any
purpose with or without fee is hereby granted, provided that the above copyright
notice and this permission notice appear in all copies.

THE SOFTWARE IS PROVIDED "AS IS" AND ISC DISCLAIMS ALL WARRANTIES WITH REGARD
TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS.
IN NO EVENT SHALL ISC BE LIABLE FOR ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL
DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS,
WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING
OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
""")
  doAssert parseLicense(iscTxt, default = Licenses.Mit) == Licenses.Isc
  doAssert parseLicense(iscTxt,).get() == Licenses.Isc


  ## Works with invalid Data (Not a License).
  doAssert parseLicense("Invalid data", default = Licenses.Mit) == Licenses.Mit
  doAssert parseLicense("Invalid data").isNone()

```


# JavaScript

- [For a version that works on the browser see the javascript folder.](https://github.com/juancarlospaco/parselicense/tree/master/javascript)


# Note

I am looking for a better algo that is small code and more efficient and precise,
I search and only found modules on other languages that compare whole strings,
or compare string lenghts, or compare filenames, or huge `try...except` chains of that.
My algo is what antivirus do basically, it wont need all license files shipped to compare to,
if you have a better algo that is faster smaller code and works at compile-time,
just send a pull request, and it will be merged.
