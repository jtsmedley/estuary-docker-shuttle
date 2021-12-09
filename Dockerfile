FROM golang:1.16.11-stretch
RUN apt-get update && apt-get install -y wget jq hwloc ocl-icd-opencl-dev git libhwloc-dev pkg-config make
WORKDIR /usr/src/estuary
RUN git clone https://github.com/application-research/estuary . && \
    git reset --hard 58cf9b2837187fded29ad183bb551922842e02fc && \
    make clean all
COPY start.sh /usr/src/estuary/start.sh
CMD /usr/src/estuary/start.sh



