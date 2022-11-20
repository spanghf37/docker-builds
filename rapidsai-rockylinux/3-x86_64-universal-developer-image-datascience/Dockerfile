FROM quay.io/rhcsdel/datascience-developer-image:22.10-cuda11.5-devel-rockylinux8-py3.9

USER root

RUN dnf update -y

RUN source activate rapids \
    && python -m pip install --upgrade pip

USER 1001

RUN mkdir -p /rapids/notebooks/tf/tensorflow-tutorials && chmod -R a+rwx /rapids/notebooks/tf/

USER 0
RUN mkdir /.local && chmod a+rwx /.local && chown -R 1001:1001 /.local
USER 1001

WORKDIR /rapids/notebooks/tf/tensorflow-tutorials
RUN wget https://raw.githubusercontent.com/tensorflow/docs/master/site/en/tutorials/keras/classification.ipynb
RUN wget https://raw.githubusercontent.com/tensorflow/docs/master/site/en/tutorials/keras/overfit_and_underfit.ipynb
RUN wget https://raw.githubusercontent.com/tensorflow/docs/master/site/en/tutorials/keras/regression.ipynb
RUN wget https://raw.githubusercontent.com/tensorflow/docs/master/site/en/tutorials/keras/save_and_load.ipynb
RUN wget https://raw.githubusercontent.com/tensorflow/docs/master/site/en/tutorials/keras/text_classification.ipynb
RUN wget https://raw.githubusercontent.com/tensorflow/docs/master/site/en/tutorials/keras/text_classification_with_hub.ipynb

USER root

RUN source activate rapids \
 && mamba install -y -n rapids -c conda-forge \
                        tensorflow \
 && conda clean -afy \
 && find /opt/conda/ -follow -type f -name '*.a' -delete \
 && find /opt/conda/ -follow -type f -name '*.pyc' -delete \
 && find /opt/conda/ -follow -type f -name '*.js.map' -delete
    
RUN source activate rapids \
 && mamba install -y -n rapids -c conda-forge \
                        boto3 lxml ipympl GPUtil humanize beautifulsoup4 ipyleaflet \
                        elasticsearch elasticsearch-dsl python-confluent-kafka trino-python-client \
 && conda clean -afy \
 && find /opt/conda/ -follow -type f -name '*.a' -delete \
 && find /opt/conda/ -follow -type f -name '*.pyc' -delete \
 && find /opt/conda/ -follow -type f -name '*.js.map' -delete
 
RUN source activate rapids \
 && mamba install -y -n rapids -c conda-forge \                        
                        prefect great-expectations plotly_express folium pydeck h3-py  \
                        fastparquet sqlalchemy xxhash murmurhash dvc pillow \
 && conda clean -afy \
 && find /opt/conda/ -follow -type f -name '*.a' -delete \
 && find /opt/conda/ -follow -type f -name '*.pyc' -delete \
 && find /opt/conda/ -follow -type f -name '*.js.map' -delete
 
RUN source activate rapids \
 && mamba install -y -n rapids -c conda-forge \                        
                        s3fs scipy streamlit transformers spacy yake pdf2image pytesseract \
 && conda clean -afy \
 && find /opt/conda/ -follow -type f -name '*.a' -delete \
 && find /opt/conda/ -follow -type f -name '*.pyc' -delete \
 && find /opt/conda/ -follow -type f -name '*.js.map' -delete
 
RUN source activate rapids \
 && mamba install -y -n rapids -c conda-forge \
                        pika aio-pika python-confluent-kafka apache-airflow dbt-core dbt-postgres \
 && conda clean -afy \
 && find /opt/conda/ -follow -type f -name '*.a' -delete \
 && find /opt/conda/ -follow -type f -name '*.pyc' -delete \
 && find /opt/conda/ -follow -type f -name '*.js.map' -delete
 
RUN source activate rapids \
 && mamba install -y -n rapids -c conda-forge \                        
                        SQLAlchemy minio SQLAlchemy elasticsearch dpkt h5py rich \
 && conda clean -afy \
 && find /opt/conda/ -follow -type f -name '*.a' -delete \
 && find /opt/conda/ -follow -type f -name '*.pyc' -delete \
 && find /opt/conda/ -follow -type f -name '*.js.map' -delete

RUN source activate rapids \
 && mamba install -y -n rapids -c conda-forge \
                        sentence-transformers python-docx python-pptx pycaret \
                        awscli \
 && conda clean -afy \
 && find /opt/conda/ -follow -type f -name '*.a' -delete \
 && find /opt/conda/ -follow -type f -name '*.pyc' -delete \
 && find /opt/conda/ -follow -type f -name '*.js.map' -delete

RUN source activate rapids \
 && mamba install -y -n rapids -c pytorch -c nvidia \
                        pytorch torchvision torchaudio pytorch-cuda=11.6 \
 && conda clean -afy \
 && find /opt/conda/ -follow -type f -name '*.a' -delete \
 && find /opt/conda/ -follow -type f -name '*.pyc' -delete \
 && find /opt/conda/ -follow -type f -name '*.js.map' -delete

#Encountered problems while solving:
#  - package paddlepaddle-gpu-2.3.2-py39_gpu_cuda10.1_many_linux requires cudatoolkit >=10.1,<10.2, but none of the providers can be installed
#RUN source activate rapids \
# && mamba install -y -n rapids -c https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/Paddle/ -c conda-forge  \
#                         paddlepaddle-gpu==2.3.2 cudatoolkit=11.6 \
# && conda clean -afy \
# && find /opt/conda/ -follow -type f -name '*.a' -delete \
# && find /opt/conda/ -follow -type f -name '*.pyc' -delete \
# && find /opt/conda/ -follow -type f -name '*.js.map' -delete

RUN source activate rapids \
 && mamba install -y -n rapids -c https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/Paddle/ \
                         paddlepaddle \
 && conda clean -afy \
 && find /opt/conda/ -follow -type f -name '*.a' -delete \
 && find /opt/conda/ -follow -type f -name '*.pyc' -delete \
 && find /opt/conda/ -follow -type f -name '*.js.map' -delete

RUN source activate rapids \
 && mamba install -y -n rapids -c bioconda \
                        flair \
 && conda clean -afy \
 && find /opt/conda/ -follow -type f -name '*.a' -delete \
 && find /opt/conda/ -follow -type f -name '*.pyc' -delete \
 && find /opt/conda/ -follow -type f -name '*.js.map' -delete

#scikit-fda requires fdasrsf from conda
RUN source activate rapids \
 && mamba install -y -n rapids -c conda-forge \
                        mlflow fdasrsf \
 && conda clean -afy \
 && find /opt/conda/ -follow -type f -name '*.a' -delete \
 && find /opt/conda/ -follow -type f -name '*.pyc' -delete \
 && find /opt/conda/ -follow -type f -name '*.js.map' -delete
 
RUN source activate rapids \
 && mamba install -y -n rapids -c deepmodeling \
                        horovod \
 && conda clean -afy \
 && find /opt/conda/ -follow -type f -name '*.a' -delete \
 && find /opt/conda/ -follow -type f -name '*.pyc' -delete \
 && find /opt/conda/ -follow -type f -name '*.js.map' -delete

RUN source activate rapids \
    && python -m pip install --no-cache-dir \
                        purestorage dbt-dremio dbt-spark dbt-trino dbt-clickhouse
                        
#paddlepaddle paddle-bfloat paddleocr mlflow[extras] horovod[all-frameworks]

RUN source activate rapids \
    && python -m pip install --no-cache-dir \
                        ludwig nni

RUN source activate rapids \
    && python -m pip install --no-cache-dir \
                        scikit-fda
                        
RUN yum install cmake -y

#Trino cli
RUN curl -LO https://repo1.maven.org/maven2/io/trino/trino-cli/402/trino-cli-402-executable.jar \
    && mv trino-cli-402-executable.jar trino \
    && chmod +x trino \
    && mv trino /usr/local/bin

#Minio cli
RUN curl -LO https://dl.min.io/client/mc/release/linux-amd64/mc \
    && chmod +x mc \
    && mv mc /usr/local/bin

#Stackrox cli
RUN curl -LO https://mirror.openshift.com/pub/rhacs/assets/3.71.2/bin/Linux/roxctl \
    && chmod +x roxctl \
    && mv roxctl /usr/local/bin

RUN yum update -y

RUN source activate rapids \
    && python -m pip install --upgrade pip

RUN source activate rapids \
 && mamba update --all -y -n rapids \
 && conda clean -afy \
 && find /opt/conda/ -follow -type f -name '*.a' -delete \
 && find /opt/conda/ -follow -type f -name '*.pyc' -delete \
 && find /opt/conda/ -follow -type f -name '*.js.map' -delete
 
USER 1001
