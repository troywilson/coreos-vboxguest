FROM fedora:32

RUN yum -y install kmod

COPY install.sh /

RUN chmod +x /install.sh

ENTRYPOINT ["/install.sh"]
