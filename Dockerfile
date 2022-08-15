FROM amd64/ubuntu:20.04

WORKDIR /usr/src/app
RUN chmod 777 /usr/src/app

RUN apt update -y

RUN apt install software-properties-common -y && \
        add-apt-repository ppa:deadsnakes/ppa -y && \
        apt install python3.9 -y
        
RUN apt install python3-pip -y

RUN apt install ffmpeg -y

COPY requirements.txt ./
RUN pip3 install --no-cache-dir -r requirements.txt

COPY . .

CMD ["bash", "start.sh"]
