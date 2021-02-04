FROM debian:latest

# Install C/C++ development software
RUN apt-get update && apt-get install -y gcc g++ make cmake gdb mingw-w64 && \
    ln -s /usr/bin/make /usr/bin/gmake

# # Install clangd-11, clang-tidy-11 and clang-format-11
RUN apt-get update && \
    apt-get install -y wget gnupg2 && \
    echo "deb http://apt.llvm.org/buster/ llvm-toolchain-buster-11 main" > /etc/apt/sources.list.d/llvm-toolchain.list && \
    echo "deb-src http://apt.llvm.org/buster/ llvm-toolchain-buster-11 main" >> /etc/apt/sources.list.d/llvm-toolchain.list && \
    wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key|apt-key add - && \
    apt-get update && \
     apt-get install -y clangd-11 clang-format-11 clang-tidy-11