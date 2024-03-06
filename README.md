# .config

Welcome to my `.config`

## Usage

`.config_entities` directory has all entities and we create symlinks to utilize them.

When there is no `.config` directory in your home directory:

```shell
$ cd ~
$ git clone https://github.com/fur0ut0/.config
$ cd .config
$ ./init.sh
```

When there is already `.config` directory in your home directory:

```shell
$ cd ~
$ mv .config config
$ git clone https://github.com/fur0ut0/.config
$ mv config/* .config
$ cd .config
$ ./init.sh
```

`setup.sh` provides a script to install utility packages:

```shell
$ ./setup.sh
```
