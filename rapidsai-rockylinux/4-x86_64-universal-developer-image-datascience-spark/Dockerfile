FROM quay.io/rhcsdel/datascience-developer-image-custom:22.10-cuda11.5-devel-rockylinux8-py3.9-20221119

#ARG spark_uid=185
ARG spark_uid=1001
ARG RAPIDS_SPARK=22.10.0
ARG RAPIDS_SCALA=2.12
ARG CUDF_SPARK=22.10.0
ARG SPARK=3.3.1
ARG HADOOP=3.3.4
ARG jmx_prometheus_javaagent_version=0.17.2
ARG aws_java_sdk_version=1.12.340
ARG guava_version=31.1
ARG hadoop_version=3
ARG hadoop_full_version=3.3.1
ARG py4j_version=0.10.9
ARG TINI_VERSION=v0.19.0

USER root

RUN set -ex && \
    ln -s /lib /lib64 && \
    mkdir -p /opt/spark && \
    mkdir -p /opt/spark/jars && \
    mkdir -p /opt/spark/examples && \
    mkdir -p /opt/spark/work-dir && \
    mkdir -p /opt/sparkRapidsPlugin && \
    touch /opt/spark/RELEASE && \
    rm /bin/sh && \
    ln -sv /bin/bash /bin/sh && \
    echo "auth required pam_wheel.so use_uid" >> /etc/pam.d/su && \
    chgrp root /etc/passwd && chmod ug+rw /etc/passwd

WORKDIR /tmp

ADD https://archive.apache.org/dist/spark/spark-${SPARK}/spark-${SPARK}-bin-without-hadoop.tgz /tmp

RUN tar zxvf spark-${SPARK}-bin-without-hadoop.tgz \
 && rm spark-${SPARK}-bin-without-hadoop.tgz

RUN mv spark-${SPARK}-bin-without-hadoop/jars /opt/spark/jars \
 && mv spark-${SPARK}-bin-without-hadoop/bin /opt/spark/bin \
 && mv spark-${SPARK}-bin-without-hadoop/sbin /opt/spark/sbin \
 && mv spark-${SPARK}-bin-without-hadoop/kubernetes/dockerfiles/spark/entrypoint.sh /opt/ \
 && mv spark-${SPARK}-bin-without-hadoop/examples /opt/spark/examples \
 && mv spark-${SPARK}-bin-without-hadoop/kubernetes/tests /opt/spark/tests \
 && mv spark-${SPARK}-bin-without-hadoop/data /opt/spark/data \
 && rm -rf spark-${SPARK}-bin-without-hadoop

ADD https://repo1.maven.org/maven2/com/nvidia/rapids-4-spark_${RAPIDS_SCALA}/${RAPIDS_SPARK}/rapids-4-spark_${RAPIDS_SCALA}-${RAPIDS_SPARK}.jar /tmp
RUN mv rapids-4-spark_${RAPIDS_SCALA}-${RAPIDS_SPARK}.jar /opt/sparkRapidsPlugin

ADD https://repo1.maven.org/maven2/ai/rapids/cudf/${CUDF_SPARK}/cudf-${CUDF_SPARK}-cuda11.jar /tmp
RUN mv cudf-${CUDF_SPARK}-cuda11.jar /opt/sparkRapidsPlugin

ADD https://github.com/apache/spark/blob/master/examples/src/main/scripts/getGpusResources.sh /tmp

RUN chmod +x getGpusResources.sh \
 && mv getGpusResources.sh /opt/sparkRapidsPlugin

ENV SPARK_HOME /opt/spark

WORKDIR /opt/spark/work-dir
RUN chmod g+w /opt/spark/work-dir

ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /usr/bin/tini
RUN chmod +rx /usr/bin/tini

WORKDIR /

# Setup for the Prometheus JMX exporter.
# Add the Prometheus JMX exporter Java agent jar for exposing metrics sent to the JmxSink to Prometheus.
ADD https://repo1.maven.org/maven2/io/prometheus/jmx/jmx_prometheus_javaagent/${jmx_prometheus_javaagent_version}/jmx_prometheus_javaagent-${jmx_prometheus_javaagent_version}.jar /prometheus/
RUN chmod 0644 prometheus/jmx_prometheus_javaagent*.jar

# Setup dependencies for AWS S3 access.
ADD https://repo1.maven.org/maven2/com/google/guava/guava/${guava_version}-jre/guava-${guava_version}-jre.jar $SPARK_HOME/jars
RUN chmod 644 $SPARK_HOME/jars/guava-${guava_version}-jre.jar

# Hadoop
WORKDIR /tmp
ADD https://downloads.apache.org/hadoop/common/hadoop-${hadoop_full_version}/hadoop-${hadoop_full_version}.tar.gz /tmp
RUN tar -xvzf hadoop-${hadoop_full_version}.tar.gz
RUN mv hadoop-${hadoop_full_version} /opt/hadoop
ENV HADOOP_HOME /opt/hadoop

# AWS S3
ADD https://repo1.maven.org/maven2/com/amazonaws/aws-java-sdk-bundle/${aws_java_sdk_version}/aws-java-sdk-bundle-${aws_java_sdk_version}.jar $HADOOP_HOME/share/hadoop/tools/lib
RUN chmod 0644 $HADOOP_HOME/share/hadoop/tools/lib/aws-java-sdk-bundle*.jar

WORKDIR /

RUN mkdir -p /etc/metrics/conf
COPY conf/metrics.properties /etc/metrics/conf
COPY conf/prometheus.yaml /etc/metrics/conf

# Prepare work-dir for LOGS (spark-history-server)
RUN mkdir -p /${SPARK_HOME}/work-dir && chmod g+w /${SPARK_HOME}/work-dir

WORKDIR /tmp
ADD https://archive.apache.org/dist/spark/spark-${SPARK}/spark-${SPARK}-bin-hadoop${hadoop_version}.tgz /tmp

WORKDIR /tmp
RUN tar xvf spark-${spark_version}-bin-hadoop${hadoop_version}.tgz
#RUN mkdir ${SPARK_HOME}/python && 
RUN mv /tmp/spark-${SPARK}-bin-hadoop${hadoop_version}/python/lib ${SPARK_HOME}/python
RUN rm -Rf /tmp/spark-${SPARK}-bin-hadoop${hadoop_version} && rm -f /tmp/spark-${SPARK}-bin-hadoop${hadoop_version}.tgz

ENV SPARK_DIST_CLASSPATH="$HADOOP_HOME/etc/hadoop:$HADOOP_HOME/share/hadoop/common/lib/*:$HADOOP_HOME/share/hadoop/common/*:$HADOOP_HOME/share/hadoop/hdfs:$HADOOP_HOME/share/hadoop/hdfs/lib/*:$HADOOP_HOME/share/hadoop/hdfs/*:$HADOOP_HOME/share/hadoop/yarn:$HADOOP_HOME/share/hadoop/yarn/lib/*:$HADOOP_HOME/share/hadoop/yarn/*:$HADOOP_HOME/share/hadoop/mapreduce/lib/*:$HADOOP_HOME/share/hadoop/mapreduce/*:/contrib/capacity-scheduler/*.jar:$HADOOP_HOME/share/hadoop/tools/lib/*"
ENV SPARK_EXTRA_CLASSPATH="$SPARK_DIST_CLASSPATH"

RUN ls -l ${SPARK_HOME}/python/lib/py4j-*

ENV PYTHONPATH ${SPARK_HOME}/python/lib/pyspark.zip:${SPARK_HOME}/python/lib/py4j-${py4j_version}-src.zip:$PYTHONPATH

RUN chown -R 1001:1001 /opt/spark && \
    chown -R 1001:1001 /opt/hadoop && \
    chown -R 1001:1001 /opt/prometheus && \
    chown -R 1001:1001 /opt/sparkRapidsPlugin && \
    chown -R 1001:1001 /etc/metrics/conf
    
WORKDIR $SPARK_HOME/work-dir

ENTRYPOINT [ "/opt/entrypoint.sh" ]

# Specify the User that the actual main process will run as
USER ${spark_uid}

RUN cat /opt/entrypoint.sh
