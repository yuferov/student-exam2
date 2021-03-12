FROM centos:7.8.2003

USER root

WORKDIR /

RUN yum install -y python3 python3-pip

WORKDIR /root/webapp

RUN python3 -m venv venv
ENV PATH="venv/bin/:$PATH"
RUN pip install -e .

ENV FLASK_APP=js_example
ENV LANG=en_US.utf-8

EXPOSE  5000

ENTRYPOINT ["python", "-m", "flask", "run", "--host=0.0.0.0"]

