syn region texRefZone		matchgroup=texStatement start="\\\(c\|C\)ref{"	end="}\|%stopzone\>"	contains=@texRefGroup
syn region texRefZone		matchgroup=texStatement start="\\todo\(\[[^]]\+\]\)\?{"	end="}\|%stopzone\>"	contains=@texRefGroup
