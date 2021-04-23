FROM node:12

RUN apt-get -y install git && \
    mkdir -p /workspace

WORKDIR /workspace

RUN git clone https://github.com/googleapis/code-suggester /workspace && \
    npm install && \
    npm run compile && \
    npm link && \
    chmod u+x entrypoint.sh

ENTRYPOINT  ["/workspace/entrypoint.sh"]