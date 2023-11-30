docker build  . -t temp-image
docker create --name temp-container -t temp-image
docker cp temp-container:/out .
docker rm temp-container

echo "Building the cpp file"
aarch64-linux-gnu-g++ -o ./out/test testlib.cpp

echo "Copying everything to qemu"
scp -r out/ root@192.168.7.2:/usr/share/lib-test/


