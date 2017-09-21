FROM jsurf/ansible:latest

ENV DEBOPS_HOME /home/debops

RUN apt-get update && \
    apt-get install --no-install-recommends -y \
      python-netaddr \
	  python-pip \
	  python-ldap \
	  python-passlib \
	  python-setuptools \
	  uuid-runtime \
	  encfs \
	  git \
    && pip install debops \
    && rm -rf /var/lib/apt/lists/* 

ADD debops.cfg /etc
RUN debops-update

ADD entrypoint.sh .

ENTRYPOINT ["/entrypoint.sh"]
	
VOLUME $DEBOPS_HOME
WORKDIR $DEBOPS_HOME
