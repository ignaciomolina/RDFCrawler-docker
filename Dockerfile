FROM alejandrofcarrera/phusion.python
MAINTAINER Ignacio Molina Cuquerella

ENV HOME /usr/lib/rdfcrawler

RUN virtualenv $HOME/.env

RUN $HOME/.env/bin/pip install flask rdflib RDFCrawler

ADD ./my_init.d/ /etc/my_init.d/
ONBUILD ADD ./my_init.d/ /etc/my_init.d/

# Set workdir for container
WORKDIR $HOME

# Expose ports
EXPOSE 5000

# Set default command to execute
CMD /sbin/my_init
