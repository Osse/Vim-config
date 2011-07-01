syn region texRefZone matchgroup=texStatement start="\\\(c\|C\)ref{"           end="}\|%stopzone\>"              contains=@texRefGroup
syn region texRefZone matchgroup=texStatement start="\\todo\(\[[^]]\+\]\)\?{"  end="}\|%stopzone\>"              contains=@texRefGroup
syn region texFigure  matchgroup=texSection   start='\\begin\s*{\s*figure\s*}' end='\\end\s*{\s*figure\s*}' fold contains=@texFoldGroup,@Spell
syn cluster texFoldGroup          add=@texFigure
syn cluster texPartGroup          add=@texFigure
syn cluster texChapterGroup       add=@texFigure
syn cluster texSectionGroup       add=@texFigure
syn cluster texSubSectionGroup    add=@texFigure
syn cluster texSubSubSectionGroup add=@texFigure
