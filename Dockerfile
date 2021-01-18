FROM debian:latest

# Install C/C++ development software
RUN apt-get update && apt-get install -y gcc g++ make cmake gdb clangd clang-tidy clang-format