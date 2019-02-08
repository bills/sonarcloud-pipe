FROM openjdk:8-jre-alpine
RUN apk update && apk add bash curl unzip

ENV SCANNER_CLI_VER 3.3.0.1492
RUN curl -L https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-$SCANNER_CLI_VER.zip -o /tmp/sonar-scanner-cli.zip
RUN mkdir -p /usr/bin/sonar-scanner-cli \
    && unzip -uo /tmp/sonar-scanner-cli.zip -d /usr/bin/sonar-scanner-cli \
    && chmod -R 755 /usr/bin/sonar-scanner-cli \
    && rm /tmp/sonar-scanner-cli.zip
COPY pipe /usr/bin/
RUN chmod 755 /usr/bin/run-scanner.sh
ENV PATH $PATH:"/usr/bin/sonar-scanner-cli/sonar-scanner-$SCANNER_CLI_VER/bin"

ENTRYPOINT ["/usr/bin/run-scanner.sh"]
