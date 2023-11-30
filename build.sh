docker build . -t temp-image
docker create --name temp-container -t temp-image
docker cp temp-container:/app/publish .
scp app/publish/ 192.168.7.2:/usr/share/lib-test