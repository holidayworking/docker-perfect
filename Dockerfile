FROM swiftdocker/swift

MAINTAINER Hidekazu Tanaka <hidekazu.tanaka@gmail.com>

RUN apt-get update && \
    apt-get install -y libevent-dev libicu-dev libsqlite3-dev libssl-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN git clone https://github.com/PerfectlySoft/Perfect.git

RUN cd Perfect && \
    cd PerfectLib && make && make install && \
    cd ../PerfectServer && make && make install && \
    cd ../Examples && make

RUN mkdir PerfectLibraries && cd PerfectLibraries && ln -s /Perfect/Examples/URL\ Routing/URLRouting.so .

EXPOSE 8181

CMD perfectserverhttp
