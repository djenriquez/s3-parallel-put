FROM python:2-slim

ENV WORKDIR /opt/s3-parallel-put/
WORKDIR $WORKDIR

COPY requirements.txt requirements.txt
RUN pip install -r $WORKDIR/requirements.txt

ADD s3-parallel-put ${WORKDIR}

RUN apt-get update && apt-get install -y \
  wget \
  libmagic-dev

RUN ln -s $WORKDIR/s3-parallel-put /usr/bin/s3-parallel-put

ENTRYPOINT ["s3-parallel-put"]

CMD ["-h"]