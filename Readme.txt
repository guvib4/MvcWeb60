docker build -t test .
docker run -it --rm -p 5000:80 -p 5100:443 --name test test
docker rmi test
