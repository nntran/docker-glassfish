# Glassfish Server 5.0


## How to use it ?

1. Clone this project

2. Build it

```
docker build --rm -t glassfish:5.0 .
```

3. Run

```
docker run --name glassfish -p 8082:8080 -p 4848:4848 -d glassfish:5.0
```

Or you can pull and run the docker image from Docker Hub.

```
docker run --name glassfish -p 8082:8080 -p 4848:4848 -d ntdtfr/glassfish:5.0
```
