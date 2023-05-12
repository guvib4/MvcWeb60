docker build -t img_mvc60 .
docker run -it --rm -p 5000:80 -p 5100:443 --name mvc60 img_mvc60
docker rmi mvc60
