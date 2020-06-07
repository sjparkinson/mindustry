FROM alpine:3.2 AS build

RUN apk --update add curl ca-certificates

RUN curl -o server-release.jar \
  -L https://github.com/Anuken/Mindustry/releases/download/v104.6/server-release.jar

FROM openjdk:15-alpine

LABEL version="104.6"
LABEL description="A sandbox tower defense game written in Java."
LABEL maintainer="sam.james.parkinson@gmail.com"

RUN mkdir -p /opt/mindustry/config && \
  addgroup -S mindustry && \
  adduser -S mindustry -G mindustry && \
  chown -R mindustry:mindustry /opt/mindustry

USER mindustry:mindustry

WORKDIR /opt/mindustry

COPY --from=build /server-release.jar server-release.jar

VOLUME [ "/opt/mindustry/config" ]

EXPOSE 6567
EXPOSE 6567/udp

CMD [ "java", "-jar", "/opt/mindustry/server-release.jar", "host" ]
