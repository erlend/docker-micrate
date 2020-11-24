FROM crystallang/crystal:0.35.1-alpine AS dependencies
RUN apk add --no-cache sqlite-static sqlite-dev

FROM dependencies AS build
WORKDIR /build
COPY micrate/shard.* ./
RUN shards install --production

COPY micrate ./
RUN shards build micrate --local --production --static --time

FROM scratch
COPY --from=build /build/bin/micrate /
ENTRYPOINT ["/micrate"]
