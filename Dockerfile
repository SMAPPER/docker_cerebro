FROM centos:latest

MAINTAINER Justin Henderson justin@hasecuritysolutions.com

RUN yum -y install wget java
RUN mkdir /opt/cerebro
RUN wget https://github.com/lmenezes/cerebro/releases/download/v0.6.5/cerebro-0.6.5.tgz
RUN tar xzvf cerebro-0.6.5.tgz
RUN mv cerebro-0.6.5/* .
RUN rmdir cerebro-0.6.5
RUN rm cerebro-0.6.5.tgz -f
RUN useradd -ms /bin/bash cerebro
RUN chown -R cerebro: /opt/cerebro
USER cerebro

EXPOSE 9000

STOPSIGNAL SIGTERM

CMD /opt/cerebro/bin/cerebro
