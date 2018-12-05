FROM openjdk:8-jre-alpine

WORKDIR /home

ENV componentName "CoreConfigService"
ENV componentVersion 3.0.5

RUN apk --no-cache add \
	git \
	unzip \
	wget \
	bash \
	&& echo "Downloading $componentName $componentVersion" \
	&& wget "https://jitpack.io/com/github/symbiote-h2020/$componentName/$componentVersion/$componentName-$componentVersion-run.jar" \
    && touch bootstrap.properties \
    && echo "spring.cloud.config.server.git.uri=file://$PWD/CoreConfigProperties" >> bootstrap.properties \
    && echo "server.port=8888" >> bootstrap.properties

EXPOSE 8888

CMD java -Xmx1024m -Duser.home=/home -Dspring.output.ansi.enabled=NEVER -jar $(ls *.jar)
