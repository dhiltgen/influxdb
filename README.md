# Building

```bash
make
```

# Starting

```bash
docker run \
    --restart=always \
    -v $(pwd)/data:/data \
    -p 8083:8083 -p 8086:8086 -p 8088:8088 \
    dhiltgen/influxdb
```

# Initial admin

Point your browser to http://localhost:8083 and edit the initial query
that pops up to establish the initial admin account.  It should look
something like this (replace the password with something better)

`CREATE USER admin WITH PASSWORD 'secret' WITH ALL PRIVILEGES`

Then you can create a DB with something like

`CREATE DATABASE sensors`

