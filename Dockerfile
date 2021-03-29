FROM centos:7.8.2003

ENV PYTHON=python3

RUN yum install -y $PYTHON $PYTHON-pip

COPY . /var/webapp
WORKDIR /var/webapp

RUN pip3 install -e '.[test]' && \
    useradd -g wheel jenkins && \
    chown wheel:jenkins /var/webapp
    

ENV FLASK_APP=js_example
ENV LANG=en_US.utf-8

EXPOSE  5000

ENTRYPOINT [ "/bin/bash" ]
CMD [ "flask", "run", "--host=0.0.0.0" ]
