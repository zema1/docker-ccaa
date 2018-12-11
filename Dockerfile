FROM centos:7

ENV SECRET ccaa
ENV CADDYUSER ccaa
ENV CADDYPASS ccaa

COPY aria2.conf /etc/ccaa/

COPY caddy.conf.template /etc/ccaa/

COPY upbt.sh /etc/ccaa/

COPY ccaa /usr/sbin/

COPY ccaa.sh /etc/ccaa/

COPY setinfo.sh /etc/ccaa/

RUN chmod +x /etc/ccaa/upbt.sh

RUN chmod +x /usr/sbin/ccaa

RUN bash /etc/ccaa/ccaa.sh

EXPOSE 6080

EXPOSE 6800

EXPOSE 51413

VOLUME ["/data"]

CMD ["/bin/bash", "/etc/ccaa/setinfo.sh"]
