import atexit
import os
import readline
import sys
import pathlib


data_home = pathlib.PosixPath( os.getenv("XDG_DATA_HOME", "~/.local/share") ).expanduser()
hist_dir = data_home / ("python%d" % sys.version_info.major)
if not hist_dir.is_dir():
    hist_dir.mkdir(parents = True)

hist_file = hist_dir / "history"
try:
    readline.read_history_file(hist_file)
    readline.set_history_length(1000)
except FileNotFoundError:
    pass

atexit.register(readline.write_history_file, hist_file)

