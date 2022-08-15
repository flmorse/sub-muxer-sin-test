FROM amd64/ubuntu:20.04

WORKDIR /usr/src/app
RUN chmod 777 /usr/src/app

RUN apt update -y

RUN apt install software-properties-common -y && \
        add-apt-repository ppa:deadsnakes/ppa -y && \
        apt install python3.9 -y
        
RUN apt install python3-pip -y

RUN apt install ffmpeg -y

RUN pip3 install pyrogram==1.2.9 tgcrypto==1.2.2 requests==2.24.0

COPY . .

CMD ["bash", "start.sh"]
