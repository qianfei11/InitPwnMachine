FROM ubuntu:16.04

# Apt packages
RUN sed -i -re 's/([a-z]{2}\.)?archive.ubuntu.com|security.ubuntu.com/mirrors.tuna.tsinghua.edu.cn/g' /etc/apt/sources.list
RUN apt-get clean

RUN dpkg --add-architecture i386 && apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    git nasm python \
    build-essential \
    python-dev python-pip python-setuptools \
    libc6-dbg \
    libc6-dbg:i386 \
    gcc-multilib g++-multilib \
    gdb-multiarch \
    gcc g++ \
    wget \
    curl \
    glibc-source \
    cmake \
    python-capstone \
    socat \
    netcat \
    ruby \
    lxterminal \
    zsh && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# python/ruby packages & gdb-plugin
RUN pip install -i https://pypi.tuna.tsinghua.edu.cn/simple pip -U && \
    python -m pip install -i https://pypi.tuna.tsinghua.edu.cn/simple --no-cache-dir --upgrade pwntools && \
    gem install one_gadget && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN cd ~/ && \
    git clone https://github.com/longld/peda.git && \
    echo "source ~/peda/peda.py" >> ~/.gdbinit

RUN cd ~/ && \
    git clone https://github.com/scwuaptx/Pwngdb.git && \
    cp ~/Pwngdb/.gdbinit ~/

ENV LANG C.UTF-8

VOLUME ["/pwn"]
WORKDIR /pwn

CMD ["/bin/zsh"]

