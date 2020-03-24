Micrate
=======

A tiny [micrate](https://github.com/amberframework/micrate) Docker image.

Usage
-----

Configure the database by setting the `DATABASE_URL` environment variable and
mount your migrations at `/db/migrations`.

You can configure the database using a different variable name by setting the
`DATABASE_PROVIDER` variable.

### Tags

| Name        | Supported database engines |
| ----------- | -------------------------- |
| `latest`    | SQLite, PostgreSQL, MySQL  |
| `postgres`  | PostgreSQL                 |
| `mysql`     | MySQL                      |
| `sqlite`    | SQLite                     |

### Example

    docker run --rm \
               --env=DATABASE_URL="postgresql://..." \
               --volume=./db/migrations:/db/migrations \
               erlend/micrate up
