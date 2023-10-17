FROM python:slim

WORKDIR /root/aliendao

RUN apt update -y && apt install git git-lfs -y

COPY * .

RUN pip install -r requirements.txt
