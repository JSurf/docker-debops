FROM williamyeh/ansible:debian8

RUN apt-get update && \
    apt-get install --no-install-recommends -y \
      python-netaddr \
	  python-pip \
    && pip install --upgrade debops \
    && rm -rf /var/lib/apt/lists/* 
