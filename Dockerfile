FROM python:3.12

WORKDIR /usr/src/app

RUN apt-get update && \
    apt-get upgrade && \
    apt-get -y install --no-install-recommends postgresql-client-common postgresql-client

COPY requirements.txt ./ 

COPY install-requirements.sh  ./

RUN pip install --upgrade pip && \
    chmod +x install-requirements.sh && \
    bash install-requirements.sh

COPY . .

RUN chmod +x entrypoint.sh && \
    chmod +x migrate.sh

CMD ["./entrypoint.sh"]