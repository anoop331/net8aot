FROM mcr.microsoft.com/dotnet/sdk:8.0-jammy-amd64 AS build

RUN apt-get update && \
	apt-get install -y --no-install-recommends clang zlib1g-dev llvm lld


RUN apt-get -y update && apt-get -y install \
    binutils-aarch64-linux-gnu 

# Copy root file system for ARM64 cross compiling
COPY --from=mcr.microsoft.com/dotnet-buildtools/prereqs:ubuntu-22.04-cross-arm64 /crossrootfs/arm64/ /crossrootfs/arm64/

ADD "https://www.random.org/cgi-bin/randbyte?nbytes=10&format=h" skipcache

COPY . .

WORKDIR AotLib

# RUN ls
# ADD "https://www.random.org/cgi-bin/randbyte?nbytes=10&format=h" skipcache
RUN dotnet publish -f net8.0 -r linux-arm64 -c Release -o /app/publish  -p:SysRoot=/crossrootfs/arm64/ 

WORKDIR /LibTest

RUN dotnet publish -f net8.0 -r linux-arm64 --self-contained true -p:PublishSingleFile=true -o /app/publish

