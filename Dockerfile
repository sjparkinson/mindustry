FROM alpine:3.2 AS build

RUN apk --update add curl ca-certificates

RUN curl -o server-release.jar \
  -L https://github.com/Anuken/Mindustry/releases/download/v104.6/server-release.jar

FROM openjdk:15-alpine

LABEL version="104.6"
LABEL description="A sandbox tower defense game written in Java."
LABEL maintainer="sam.james.parkinson@gmail.com"

RUN mkdir /opt/mindustry && \
  mkdir /opt/mindustry/config

COPY --from=build /server-release.jar /opt/mindustry/server-release.jar

VOLUME [ "/opt/mindustry/config" ]

EXPOSE 6567
EXPOSE 6567/udp

ENTRYPOINT ["java", "-jar", "/opt/mindustry/server-release.jar"]

CMD [ "host,playerLimit", "8" ]