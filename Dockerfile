FROM centos:latest

MAINTAINER Justin Henderson justin@hasecuritysolutions.com

RUN yum -y install wget java
RUN mkdir /opt/cerebro
RUN cd /opt/cerebro && wget https://github.com/lmenezes/cerebro/releases/download/v0.6.5/cerebro-0.6.5.tgz
RUN cd /opt/cerebro && tar xzvf cerebro-0.6.5.tgz
RUN mv /opt/cerebro/cerebro-0.6.5/* /opt/cerebro/
RUN rmdir /opt/cerebro/cerebro-0.6.5
RUN rm /opt/cerebro/cerebro-0.6.5.tgz -f
RUN useradd -ms /bin/bash cerebro
RUN chown -R cerebro: /opt/cerebro
USER cerebro

EXPOSE 9000

STOPSIGNAL SIGTERM

CMD /opt/cerebro/bin/cerebro
