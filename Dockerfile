FROM python:3.8.2-buster

RUN apt-get update

RUN apt install -y netcat

COPY . /src 
WORKDIR /src

RUN make env

ENV IS_CI=true
ENV APP=redisolar
ENV PORT=8081
ENV DATABASE=redis
ENV REDIS_HOST=redis
ENV REDIS_PORT=6379

ENTRYPOINT [ "./shell/app.sh" ]