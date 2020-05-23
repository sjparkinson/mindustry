FROM openjdk:15-slim

RUN apt-get update && \
  apt-get install -y curl && \
  rm -rf /var/lib/apt/lists/*

RUN mkdir /opt/mindustry && \
  mkdir /opt/mindustry/config

RUN curl -o /opt/mindustry/server-release.jar \
  https://github.com/Anuken/Mindustry/releases/download/v104.6/server-release.jar

VOLUME [ "/opt/mindustry/config" ]

EXPOSE 6567
EXPOSE 6567/udp

CMD [ "java", "-jar", "server-release.jar", "host" ]