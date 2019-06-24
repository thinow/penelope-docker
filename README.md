# Penelope Docker

The tool [Penelope](https://github.com/pettarin/penelope) pre-installed in a Docker image.

## Usage

> [Docker](https://www.docker.com/) must be installed before to use the following command lines.

```bash
# Try to display the help page of Penelope
docker run thinow/penelope -h
```

From now you are able to run all the commands provided by Penelope (see the [original documentation](https://github.com/pettarin/penelope#usage)). You need to replace `penelope` with `docker run -v $(pwd):/opt/penelope thinow/penelope`. For instance :

```bash
# Convert en->it dictionary dict.csv (in CSV format) into output.zip (in StarDict format)
docker run -v $(pwd):/opt/penelope thinow/penelope -i dict.csv -j csv -f en -t it -p stardict -o output.zip
```

## Contributing

```bash
# Build the Docker image
make build

# Push an image to the Docker Hub
make push
```