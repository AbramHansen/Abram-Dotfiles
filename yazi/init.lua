function Linemode:size_and_mtime()
	local time = math.floor(self._file.cha.mtime or 0)
	if time == 0 then
		time = ""
	elseif os.date("%Y", time) == os.date("%Y") then
		time = os.date("%b %d %I:%M %p", time)
	else
		time = os.date("%b %d %Y", time)
	end

	local size = self._file:size()
	return string.format("%s %s", size and ya.readable_size(size) or "-", time)
end

th.git = th.git or {}
th.git.modified_sign =   "  Modified"
th.git.staged_sign =     "    Staged"
th.git.untracked_sign =  " Untracked"
th.git.ignored_sign =    "   Ignored"
th.git.deleted_sign =    "   Deleted"
th.git.updated_sign =    "  Conflict"
th.git.unmodified_sign = "Unmodified"
require("git"):setup()
