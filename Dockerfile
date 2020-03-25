FROM crystallang/crystal:0.33.0 AS build

RUN apt-get update -q && \
    apt-get upgrade -y && \
    apt-get install libsqlite3-dev 

WORKDIR /build

COPY shard.yml shard.lock ./
RUN shards install --production

COPY src src
RUN shards build --production

FROM scratch

COPY --from=build /build/bin /bin
COPY --from=build /usr/lib/x86_64-linux-gnu/libsqlite3.so.0 /usr/lib/x86_64-linux-gnu/
COPY --from=build /lib/x86_64-linux-gnu/libpcre.so.3 /lib/x86_64-linux-gnu/
COPY --from=build /lib/x86_64-linux-gnu/libm.so.6 /lib/x86_64-linux-gnu/
COPY --from=build /lib/x86_64-linux-gnu/libpthread.so.0 /lib/x86_64-linux-gnu/
COPY --from=build /usr/lib/x86_64-linux-gnu/libevent-2.1.so.6 /usr/lib/x86_64-linux-gnu/
COPY --from=build /lib/x86_64-linux-gnu/libdl.so.2 /lib/x86_64-linux-gnu/
COPY --from=build /lib/x86_64-linux-gnu/libgcc_s.so.1 /lib/x86_64-linux-gnu/
COPY --from=build /lib/x86_64-linux-gnu/libc.so.6 /lib/x86_64-linux-gnu/
COPY --from=build /lib64/ld-linux-x86-64.so.2 /lib64/

ENV DATABASE_PROVIDER=DATABASE_URL

ENTRYPOINT ["/bin/micrate"]
