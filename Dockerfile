FROM openjdk:8-jre-alpine

WORKDIR /home

ENV componentName "CoreConfigService"
ENV componentVersion 3.0.3

RUN apk --no-cache add \
	git \
	unzip \
	wget \
	bash \
	&& git clone --branch master --single-branch --depth 1 https://github.com/symbiote-h2020/CoreConfigProperties.git \
	&& echo "Downloading $componentName $componentVersion" \
	&& wget "https://jitpack.io/com/github/symbiote-h2020/$componentName/$componentVersion/$componentName-$componentVersion-run.jar" \
    && touch bootstrap.properties \
    && echo "spring.cloud.config.server.git.uri=file://$PWD/CoreConfigProperties" >> bootstrap.properties \
    && echo "server.port=8888" >> bootstrap.properties \
	&& rm CoreConfigProperties/application.properties \
	&& ln -s $PWD/application-custom.properties CoreConfigProperties/application.properties

EXPOSE 8888

CMD java -Xmx1024m -Duser.home=/home -Dspring.output.ansi.enabled=NEVER -jar $(ls *.jar)
