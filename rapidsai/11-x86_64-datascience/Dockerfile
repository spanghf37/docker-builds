ARG IMAGE_NAME
FROM ${IMAGE_NAME}:11.5.2-rapidsai-devel-almalinux8

USER root

RUN dnf update -y

RUN source activate rapids \
    && python -m pip install -–upgrade pip

RUN npm -v && npm install -g npm@latest

RUN mamba install -y -n rapids streamlit

RUN npm install -g pm2 \
    && npm install -g --unsafe-perm node-red \
    && pm2 start /usr/bin/node-red -- -v \
    && pm2 info node-red \
    && pm2 save \
    && pm2 startup systemd

RUN npm install -g n8n \
    && pm2 start /usr/bin/n8n -- -v \
    && pm2 info n8n \
    && pm2 save \
    && pm2 startup systemd

RUN python --version

USER 1001