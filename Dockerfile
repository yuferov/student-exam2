FROM centos:7.8.2003

USER root

RUN yum install -y python3 python3-pip

COPY . /var/webapp
WORKDIR /var/webapp

RUN  pip3 install -e .

ENV FLASK_APP=js_example
ENV LANG=en_US.utf-8

EXPOSE  5000

ENV container docker
RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == \
systemd-tmpfiles-setup.service ] || rm -f $i; done); \
rm -f /lib/systemd/system/multi-user.target.wants/*;\
rm -f /etc/systemd/system/*.wants/*;\
rm -f /lib/systemd/system/local-fs.target.wants/*; \
rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
rm -f /lib/systemd/system/basic.target.wants/*;\
rm -f /lib/systemd/system/anaconda.target.wants/*;
VOLUME [ "/sys/fs/cgroup" ]

CMD [ "flask", "run", "--host=0.0.0.0" ]
