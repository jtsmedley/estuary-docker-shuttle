FROM golang:1.18.0-stretch
RUN apt-get update && apt-get install -y wget jq hwloc ocl-icd-opencl-dev git libhwloc-dev pkg-config make
WORKDIR /usr/src/estuary
RUN git clone https://github.com/application-research/estuary . && \
    make clean all
COPY start.sh /usr/src/estuary/start.sh
RUN chmod +x /usr/src/estuary/start.sh
CMD /usr/src/estuary/start.sh



