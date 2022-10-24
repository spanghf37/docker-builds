ARG IMAGE_NAME
FROM ${IMAGE_NAME}:11.5.2-rapidsai-devel-almalinux8

RUN dnf update -y

RUN source activate rapids \
    python -m pip install -–upgrade pip

RUN source activate rapids \
    && python -m pip install streamlit