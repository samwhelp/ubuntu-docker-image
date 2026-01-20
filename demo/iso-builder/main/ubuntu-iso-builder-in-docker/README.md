

# ubuntu-iso-builder-in-docker




## Usage

### help

run

``` sh
make help
```

show

```
Usage:
	$ make [action]

Example:
	$ make
	$ make help

	$ make box-build
	$ make box-run

	$ mate master-build
	$ make master-ubuntu-iso-builder-respin-xfce

```




## Steps

## Steps / Build

> run to build docker-image

``` sh
make box-build
```

> then run to build iso-file in docker

``` sh
make master-build
```

> then or run to build iso-file in docker

``` sh
make master-ubuntu-iso-builder-respin-xfce
```

> check port dir

``` sh
ls -1 port
```
