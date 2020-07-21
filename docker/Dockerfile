FROM openjdk:8u252-jdk-buster

MAINTAINER zang

RUN sed -i 's#http://deb.debian.org#https://mirrors.aliyun.com#g' /etc/apt/sources.list

RUN set -eux; \
	apt-get update; \
	apt-get install -y --no-install-recommends \
		procps \
        vim \
		expect \
		git \
	; \
	rm -rf /var/lib/apt/lists/*

COPY . /tmp/

#ENV BITBUCKET_HOME=/opt/atlassian/bitbucket/6.10.5 \
#    PATH=${PATH}:${BITBUCKET_HOME}/bin

RUN chmod a+x /tmp/answer.sh \
 && /usr/bin/expect /tmp/answer.sh \
 && mv /tmp/*.jar /opt/atlassian/bitbucket/6.10.5/app/WEB-INF/lib \
 && chown -R atlbitbucket:atlbitbucket /opt/atlassian/bitbucket/6.10.5/app/WEB-INF/lib \
 && mv /tmp/entrypoint.sh /usr/bin \
 && chmod a+x /usr/bin/entrypoint.sh \
 && rm -rf /tmp/* 

# /var/atlassian/application-data

WORKDIR /opt/atlassian/bitbucket/6.10.5

ENTRYPOINT ["entrypoint.sh"]