## * Parse an Standard SPDX License from a **plain-text** string.

import options
from strutils import strip

type Licenses* {.pure.} = enum ## Standard SPDX Licenses. See https://github.com/spdx/license-list-data/blob/master/text/
  diffmark = 91
  fsful = 197
  dvipdfm = 209
  fsfap = 223
  fsfullr = 233
  fair = 243
  libtool = 253
  zed = 259
  dotseqn = 260
  nlpl = 262
  beerware = 263
  blessing = 269
  ssh = 324
  gnuJavamail = 340
  swift = 347
  gpl30withLinkingException = 359
  wtfpl = 434
  psOrPdfFont = 438
  glulxe = 461
  psfrag = 478
  crossword = 479
  gccWithException = 481
  adsl = 487
  bootloaderWithException = 503
  newsletr = 504
  ntp0 = 526
  wsuipa = 527
  mif = 528
  gpl30WithLinkingSourceException = 531
  lzma = 536
  xskat = 541
  i2pGplJavaWithException = 564
  ecos = 574
  font = 581
  barr = 594
  haskellReport = 601
  apafml = 616
  uBootWithException = 622
  linuxSyscallNote = 623
  spencer86 = 627
  openvpnOpensslException = 628
  gpl20WithFontException = 630
  tcpWrappers = 647
  borceux = 658
  zeroBsd = 659
  occtWithException = 662
  bisonWithException = 672
  tuBerlin10 = 690
  latex2e = 705
  ntp = 712
  abstyles = 731
  leptonica = 739
  isc = 822
  ibmPibs = 841
  rsaMd = 868
  llvmException = 873
  mirOs = 885
  afmparse = 887
  gl2ps = 897
  efl10 = 906
  mit0 = 914
  classpathException = 918
  efl20 = 921
  spencer94 = 935
  linuxOpenIb = 938
  xerox = 962
  qtGplException = 964
  gpl20withClasspathException = 973
  crystalstacker = 981
  antlrPd = 986
  libselinux10 = 1035
  curl = 1042
  cube = 1059
  bsd1clause = 1065
  nunit = 1078
  rdisc = 1096
  mitFeh = 1104
  mit = 1107
  json = 1112
  smlnj = 1121
  noweb = 1125
  hpndSellVariant = 1131
  zlib = 1132
  libtiff = 1139
  mitCmu = 1142
  nokiaQtException = 1167
  hpnd = 1172
  qtLgplException = 1176
  postgresql = 1194
  qwtException = 1208
  unlicense = 1210
  xnet = 1248
  wxwindows = 1266
  mitAdvertising = 1269
  wxwindowsException = 1278
  bsd2clause = 1287
  bsdSourceCode = 1291
  qhull = 1306
  x11 = 1336
  bsl10 = 1337
  fawkesRuntimeException = 1343
  eurosym = 1348
  giftware = 1351
  tuBerlin20 = 1368
  bahyph = 1371
  spencer99 = 1375
  bsd2clauseNetbsd = 1383
  gnuplot = 1392
  mup = 1458
  fltkException = 1469
  bsd3clause = 1479
  openjdkAssemblyException = 1483
  sgiB20 = 1502
  mpich2 = 1509
  bsd2clauseFreebsd = 1516
  mitnfa = 1530
  libpng20 = 1538
  blueoak10 = 1550
  ecos20 = 1564
  autoconfException20 = 1572
  ccPddc = 1591
  icu = 1596
  bsd4clause = 1622
  bsd3clauseWithAttribution = 1625
  bsd3clauseClear = 1660
  mitEnna = 1667
  bsd3clauseNoNuclearWarranty = 1682
  bsd3clauseNoNuclearLicense = 1688
  bsd3clauseNoNuclearLicense2014 = 1692
  bzip2106 = 1718
  freertosException = 1735
  bsd4clauseUc = 1770
  adobe2006 = 1775
  psutils = 1788
  w3c20150513 = 1795
  bsd3clauseOpenMpi = 1806
  upl10 = 1834
  autoconfException30 = 1841
  plexus = 1845
  gpl30withAutoconfException = 1855
  netcdf = 1880
  bzip2105 = 1926
  redhat389exception = 1930
  naumen = 1951
  makeindex = 1954
  oldap201 = 1976
  oldap20 = 1980
  imlib2 = 2001
  xinetd = 2023
  multics = 2040
  gplCc10 = 2043
  jpnic = 2044
  tosl = 2060
  vsl10 = 2062
  zpl21 = 2068
  intel = 2070
  saxpath = 2084
  ruby = 2105
  oldap26 = 2112
  swl = 2128
  oldap24 = 2130
  ampas = 2176
  oldap25 = 2177
  oldap28 = 2198
  oldap27 = 2200
  oldap21 = 2219
  oldap22 = 2228
  oldap221 = 2241
  zpl20 = 2244
  tcl = 2250
  dsdp = 2259
  entessa = 2266
  oldap23 = 2268
  oldap222 = 2270
  saxPd = 2316
  psf20 = 2345
  aml = 2357
  xfree86 = 2377
  bsd3clauseLbnl = 2388
  ecl10 = 2394
  zend20 = 2461
  xpp = 2475
  apache10 = 2502
  apache11 = 2513
  tmate = 2514
  aal = 2531
  simpl20 = 2548
  caldera = 2553
  bsd2clausePatent = 2568
  mspl = 2636
  w3c = 2684
  clispException20 = 2697
  jasper20 = 2734
  php30 = 2843
  php301 = 2853
  unicodeDfs2015 = 2859
  zpl11 = 2864
  unicodeDfs2016 = 2884
  msRl = 3026
  vostrom = 3056
  w3c19980720 = 3095
  digiruleFossException = 3116
  infoZip = 3147
  universalFossException10 = 3153
  smppl = 3171
  euDatagrid = 3200
  mtll = 3203
  nrl = 3272
  sshOpenssh = 3374
  cnriPython = 3380
  gccException31 = 3421
  gpl30withGccException = 3427
  parity700 = 3457
  imatix = 3475
  oglCanada20 = 3693
  ofl10 = 3851
  sendmail = 3899
  cnriJython = 3916
  sendmail823 = 3971
  torque11 = 3998
  cnriPythonGplCompatible = 4002
  libpng = 4132
  ijg = 4227
  ofl11norfn = 4244
  egenix = 4250
  ofl11 = 4291
  qpl10 = 4339
  vim = 4440
  doc = 4471
  afl11 = 4661
  ngpl = 4676
  artistic10 = 4806
  sleepycat = 4945
  artistic10cl8 = 5136
  ogtsl = 5234
  openssl = 5307
  oldap11 = 5338
  oldap12 = 5341
  nbpl10 = 5369
  amdplpa = 5617
  oldap13 = 5740
  oldap14 = 5818
  ftl = 5961
  ogluk20 = 5980
  artistic10perl = 6004
  ogluk10 = 6036
  condor11 = 6076
  intelacpi = 6086
  unicodetou = 6170
  bsdprotection = 6240
  ogluk30 = 6254
  clartistic = 6349
  liliqp11 = 6618
  scea = 6667
  lal12 = 6853
  cc010 = 6915
  lgpl30orlater = 7430
  etalab20 = 8098
  cernohl11 = 8131
  lal13 = 8134
  liliqrplus11 = 8329
  nlod10 = 8689
  artistic20 = 8728
  liliqr11 = 8754
  mulanpsl10 = 8776
  lppl10 = 8835
  zimbra14 = 8865
  osl10 = 8908
  afl21 = 8942
  ypl11 = 8953
  afl20 = 8957
  zimbra13 = 8958
  ypl10 = 8969
  ipa = 9054
  cernohl12 = 9184
  python20 = 9271
  copyleftnext030 = 9625
  frameworx10 = 9644
  osl11 = 9650
  copyleftnext031 = 9682
  osl21 = 9859
  osl20 = 9871
  osl30 = 10290
  afl30 = 10299
  apache20 = 10342
  cdlapermissive10 = 10356
  ccbynd10 = 10393
  ucl10 = 10533
  ccbyncnd10 = 10931
  cdlasharing10 = 11121
  oclc20 = 11141
  ecl20 = 11190
  ccby10 = 11300
  epl10 = 11319
  shl05 = 11442
  shl051 = 11475
  aladdin = 11536
  cpl10 = 11569
  ipl10 = 11598
  ccbynd20 = 11613
  lpl102 = 11720
  nposl30 = 11756
  ccbync10 = 11822
  ccbynd25 = 11832
  lpl10 = 11849
  glide = 11954
  gpl10 = 12172
  gpl10orlater = 12173
  gpl10only = 12222
  sissl12 = 12345
  ccbysa10 = 12413
  imagemagick = 12415
  ccby20 = 12474
  ccbyncnd20 = 12616
  ccby25 = 12683
  ccbyncnd25 = 12841
  ccbyncsa10 = 12951
  eupl10 = 12988
  eupl11 = 13227
  sgib10 = 13454
  ccbync20 = 13487
  taprohl10 = 13514
  ccbync25 = 13686
  eupl12 = 13859
  lppl11 = 13900
  erlpl11 = 13963
  lppl12 = 13976
  occtpl = 13981
  nasa13 = 13992
  ccbysa20 = 14014
  epl20 = 14041
  netsnmp = 14132
  ccbysa25 = 14223
  sissl = 14369
  sgib11 = 14453
  lgpllr = 14522
  mpl20 = 14976
  ccbyncsa20 = 15064
  ccbyncsa25 = 15273
  pddl10 = 15452
  dfsl10 = 15507
  agpl10orlater = 15815
  cddl10 = 16478
  ccbynd40 = 16628
  ccbynd30 = 16805
  ccby40 = 16813
  gpl20plus = 17292
  ccbyncnd40 = 17324
  cddl11 = 17366
  ccbync40 = 17516
  freeimage = 17548
  gpl20orlater = 17621
  gpl20 = 17622
  ccbyncnd30 = 17729
  lppl13a = 17866
  gfdl11 = 17956
  gfdl11orlater = 17959
  mpl10 = 17984
  ccbysa40 = 18108
  lppl13c = 18465
  ccby30 = 18531
  ccbyncsa40 = 18742
  catosl11 = 19064
  apsl10 = 19425
  ccbync30 = 19468
  apsl12 = 19589
  osetpl21 = 19723
  odcby10 = 19785
  apsl11 = 19894
  apsl20 = 20024
  motosoto = 20092
  opl10 = 20114
  gfdl12 = 20259
  gfdl12orlater = 20263
  gsoap13b = 20431
  watcom10 = 20757
  nokia = 20800
  rscpl = 20843
  npl10 = 20890
  cecill20 = 21100
  ccbysa30 = 21154
  ccbyncsa30 = 21202
  cecillb = 21315
  rhecos11 = 21480
  cecill11 = 21525
  cecill10 = 21651
  snia = 21689
  cecillc = 21772
  cecill21 = 21855
  sugarcrm113 = 21920
  gfdl13 = 22778
  gfdl13orlater = 22782
  spl10 = 23134
  cuaopl10 = 23374
  mpl11 = 23442
  bittorrent10 = 23838
  nosl = 24233
  interbase10 = 24457
  lgpl20orlater = 24773
  odbl10 = 24945
  lgpl21orlater = 25905
  lgpl21 = 25910
  bittorrent11 = 27692
  npl11 = 27741
  cpal10 = 28219
  sspl10 = 29295
  rpsl10 = 30015
  rpl15 = 31739
  rpl11 = 33686
  agpl30orlater = 33876
  gpl30orlater = 34469
  apl10 = 46252

func parseLicense*(licenseTxtContent: string; default: Licenses): Licenses {.inline.} =
  ## Parse an Standard SPDX License from `licenseTxtContent` **plain-text** license,
  ## if can not be parsed returns `default`. Algorithm is as fast. Works at compile-time.
  ##
  ## **See also:**
  ## * SPDX https://spdx.org/licenses
  assert licenseTxtContent.len > 0
  result = try: Licenses(licenseTxtContent.strip.len) except: default

func parseLicense*(licenseTxtContent: string): Option[Licenses] {.inline.} =
  ## Parse an Standard SPDX License from `licenseTxtContent` **plain-text** license,
  ## if can not be parsed returns `none(Licenses)`. Algorithm is as fast. Works at compile-time.
  ##
  ## **See also:**
  ## * SPDX https://spdx.org/licenses
  assert licenseTxtContent.len > 0
  result = try: some(Licenses(licenseTxtContent.strip.len)) except: none(Licenses)


when isMainModule:
  import options, strutils
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
    doAssert parseLicense(wtfplTxt, default = Licenses.mit) == Licenses.wtfpl
    doAssert parseLicense(wtfplTxt).get() == Licenses.wtfpl

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
    doAssert parseLicense(zeroBsdTxt, default = Licenses.mit) == Licenses.zerobsd
    doAssert parseLicense(zeroBsdTxt).get() == Licenses.zerobsd

    const fairTxt = """Fair License <Copyright Information>

Usage of the works is permitted provided that this instrument is retained
with the works, so that any entity that uses the works is notified of this
instrument.

DISCLAIMER: THE WORKS ARE WITHOUT WARRANTY.
"""
    doAssert parseLicense(fairTxt, default = Licenses.mit) == Licenses.fair
    doAssert parseLicense(fairTxt).get() == Licenses.fair

    const beerwareTxt = """"THE BEER-WARE LICENSE" (Revision 42):

<phk@FreeBSD.ORG> wrote this file. As long as you retain this notice you can
do whatever you want with this stuff. If we meet some day, and you think this
stuff is worth it, you can buy me a beer in return Poul-Henning Kamp
"""
    doAssert parseLicense(beerwareTxt, default = Licenses.mit) == Licenses.beerware
    doAssert parseLicense(beerwareTxt,).get() == Licenses.beerware

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
    doAssert parseLicense(curlTxt, default = Licenses.mit) == Licenses.curl
    doAssert parseLicense(curlTxt,).get() == Licenses.curl

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
  doAssert parseLicense(iscTxt, default = Licenses.mit) == Licenses.isc
  doAssert parseLicense(iscTxt,).get() == Licenses.isc

  ## Works with invalid Data (Not a License).
  doAssert parseLicense("Invalid data", default = Licenses.mit) == Licenses.mit
  doAssert parseLicense("Invalid data").isNone()
