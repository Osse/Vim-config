syn region texRefZone     matchgroup=texStatement start="\\\(c\|C\)ref{"                end="}\|%stopzone\>"                   contains=@texRefGroup
syn region texRefZone     matchgroup=texStatement start="\\todo\(\[[^]]\+\]\)\?{"       end="}\|%stopzone\>"                   contains=@texRefGroup
syn region texFigure      matchgroup=texsection   start='\\begin\s*{\s*figure\s*}'      end='\\end\s*{\s*figure\s*}'      fold contains=texTikzPicture,@texFoldGroup,@Spell
syn region texTikzPicture matchgroup=texSection   start='\\begin\s*{\s*tikzpicture\s*}' end='\\end\s*{\s*tikzpicture\s*}' fold contains=@texFoldGroup,@Spell

syn cluster texChapterGroup       add=texFigure,texTikzPicture
syn cluster texSectionGroup       add=texFigure,texTikzPicture
syn cluster texSubSectionGroup    add=texFigure,texTikzPicture
syn cluster texSubSubSectionGroup add=texFigure,texTikzPicture
