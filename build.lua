-- l3build configuration for esoterica

module = "esoterica"

sourcefiledir = "tex"
docfiledir    = "doc"

sourcefiles  = {"*.sty", "*.def"}
installfiles = {"*.sty", "*.def"}
typesetfiles = {"esoterica.tex"}
textfiles    = {"README.md", "LICENSE"}

checkengines = {"pdftex", "xetex", "luatex"}
stdengine    = "pdftex"
checkruns    = 1
