syn region Foo start='^@@' end='\ze\n\(@@\|diff\)' contains=ALLBUT,Foo,Foo2 fold
syn region Foo2 start='^diff' end='\ze\ndiff' contains=ALLBUT,Foo2 fold
