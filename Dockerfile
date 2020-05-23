FROM debian:buster-slim AS build

RUN apt-get update && \
  apt-get install -y curl && \
  rm -rf /var/lib/apt/lists/*

RUN curl -o server-release.jar \
  -L https://github.com/Anuken/Mindustry/releases/download/v104.6/server-release.jar

FROM openjdk:15-slim

RUN mkdir /opt/mindustry && \
  mkdir /opt/mindustry/config

COPY --from=build /server-release.jar /opt/mindustry/server-release.jar

VOLUME [ "/opt/mindustry/config" ]

EXPOSE 6567
EXPOSE 6567/udp

CMD [ "java", "-jar", "/opt/mindustry/server-release.jar", \
  "host," \
  "config", "name", "WFH Covid-19," \
  "playerlimit", "8" ]