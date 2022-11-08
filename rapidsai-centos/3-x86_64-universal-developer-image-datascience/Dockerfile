FROM quay.io/rhcsdel/universal-developer-image:datascience-base-centos7

USER root

RUN yum update -y

RUN source activate rapids \
    && python -m pip install --upgrade pip
    
RUN source activate rapids \
 && python3 -m pip install tensorflow --no-cache-dir
RUN mkdir -p /rapids/notebooks/tf/tensorflow-tutorials && chmod -R a+rwx /rapids/notebooks/tf/
RUN mkdir /.local && chmod a+rwx /.local
RUN apt-get update && apt-get install -y --no-install-recommends wget git
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
    && mamba install -y -n rapids transformers paddlepaddle paddle-bfloat paddlepaddle-gpu paddleocr scikitfda spacy yake pdf2image pytesseract

RUN yum update -y

RUN source activate rapids \
    && python -m pip install --upgrade pip

USER 1001
