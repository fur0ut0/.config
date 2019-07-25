# .config

* For placed on `~/.config`

## Usage

```shell
$ cd ~
$ git clone https://github.com/float168/.config config
$ mkdir -p .config
$ mv config/.@(!(.|)) config/* .config
$ cd .config
$ ./link_extra.sh
```
