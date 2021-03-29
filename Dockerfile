FROM centos:7.8.2003

ENV PYTHON=python3

RUN yum install -y $PYTHON $PYTHON-pip && \
    useradd -aG wheel jenkins

USER jenkins

COPY . /var/webapp
WORKDIR /var/webapp

RUN pip3 install --user jenkins -e .

ENV FLASK_APP=js_example
ENV LANG=en_US.utf-8

EXPOSE  5000

#ENTRYPOINT [ "flask" ]
#CMD [ "run", "--host=0.0.0.0" ]
