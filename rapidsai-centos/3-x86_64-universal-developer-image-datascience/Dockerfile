FROM quay.io/rhcsdel/datascience-developer-image:22.10-cuda11.5-devel-rl8-py3.9

USER root

RUN dnf update -y

RUN source activate rapids \
    && python -m pip install --upgrade pip
    
RUN source activate rapids \
 && python3 -m pip install tensorflow --no-cache-dir
RUN mkdir -p /rapids/notebooks/tf/tensorflow-tutorials && chmod -R a+rwx /rapids/notebooks/tf/
RUN mkdir /.local && chmod a+rwx /.local
WORKDIR /rapids/notebooks/tf/tensorflow-tutorials
RUN wget https://raw.githubusercontent.com/tensorflow/docs/master/site/en/tutorials/keras/classification.ipynb
RUN wget https://raw.githubusercontent.com/tensorflow/docs/master/site/en/tutorials/keras/overfit_and_underfit.ipynb
RUN wget https://raw.githubusercontent.com/tensorflow/docs/master/site/en/tutorials/keras/regression.ipynb
RUN wget https://raw.githubusercontent.com/tensorflow/docs/master/site/en/tutorials/keras/save_and_load.ipynb
RUN wget https://raw.githubusercontent.com/tensorflow/docs/master/site/en/tutorials/keras/text_classification.ipynb
RUN wget https://raw.githubusercontent.com/tensorflow/docs/master/site/en/tutorials/keras/text_classification_with_hub.ipynb

RUN source activate rapids \
 && mamba install -y -n rapids pytorch boto3 lxml ipympl GPUtil humanize beautifulsoup4 ipyleaflet elasticsearch elasticsearch-dsl python-confluent-kafka trino-python-client prefect great-expectations plotly_express folium pydeck h3-py -c conda-forge \
# Dask optional dependencies
 && mamba install -y -n rapids fastparquet sqlalchemy xxhash murmurhash -c conda-forge \
# Datascientist DGA
 && mamba install -y -n rapids pillow -c conda-forge

RUN source activate rapids \
 && yum install cmake -y \
 && pip3 install horovod[all-frameworks]
 
RUN source activate rapids \
 && pip3 install purestorage \
 && pip3 install s3fs

RUN source activate rapids \
 && python -m pip install --upgrade pip \
 && pip3 install scipy \
 && pip3 install torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/cu115

RUN source activate rapids \
    && mamba install -y -n rapids streamlit

RUN source activate rapids \
    && mamba install -y -n rapids transformers spacy yake pdf2image pytesseract

RUN source activate rapids \
    && pip3 install paddlepaddle paddle-bfloat paddlepaddle-gpu paddleocr scikit-fda pika aio-pika confluent-kafka apache-airflow dbt SQLAlchemy minio SQLAlchemy elasticsearch dpkt

RUN source activate rapids \
    && mamba install -y -n rapids -c conda-forge dvc

RUN curl -Lo https://repo1.maven.org/maven2/io/trino/trino-cli/402/trino-cli-402-executable.jar \
    && mv trino-cli-402-executable.jar trino \
    && chmod +x trino \
    && mv trino /usr/local/bin

RUN curl -Lo https://dl.min.io/client/mc/release/linux-amd64/mc \
    && chmod +x mc \
    && mv mc /usr/local/bin

RUN curl -O https://mirror.openshift.com/pub/rhacs/assets/3.71.2/bin/Linux/roxctl \
    && chmod +x roxctl \
    && mv roxctl /usr/local/bin

RUN yum update -y

RUN source activate rapids \
    && python -m pip install --upgrade pip

USER 1001
