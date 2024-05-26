aws ecr get-login-password --region ap-southeast-1 | docker login --username AWS --password-stdin location.dkr.ecr.ap-southeast-1.amazonaws.com
docker build --platform=linux/amd64 -t angel_hack_flask_server .
docker push location.dkr.ecr.ap-southeast-1.amazonaws.com/angel_hack_flask:latest