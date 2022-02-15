command! Dbg call Putprintf("DEBUG'\n'")

fu! Putprintf(string)
	put='printf(\"'.a:string.'\");'
endfu
