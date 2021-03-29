FROM centos:7.8.2003

RUN yum install -y python3 python3-pip

COPY . /var/webapp
WORKDIR /var/webapp

RUN  pip3 install -e . && \
     useradd -MG wheel jenkins

ENV FLASK_APP=js_example
ENV LANG=en_US.utf-8

EXPOSE  5000

ENTRYPOINT [ "/bin/bash" ]
CMD [ "flask", "run", "--host=0.0.0.0" ]
