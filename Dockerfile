FROM ubuntu:latest

RUN apt-get update && apt-get install -y openjdk-8-jdk && apt-get install unzip

RUN \
    apt-get update && \
    apt-get install -y python3 python3-pip

# Install PySpark and Numpy
RUN \
    pip3 install --upgrade pip && \
    pip3 install numpy && \
    pip3 install pandas && \
    pip3 install matplotlib && \
    pip3 install pyspark && \
    pip3 install jupyterlab && \
    pip3 install tensorflow && \
    pip3 install kaggle

RUN ln -s /usr/bin/python3 /usr/bin/python

WORKDIR /root
RUN mkdir .kaggle

COPY kaggle.json /root/.kaggle/kaggle.json

RUN mkdir /data
WORKDIR /data

RUN kaggle datasets download -d allen-institute-for-ai/CORD-19-research-challenge && unzip CORD-19-research-challenge.zip && rm -rf CORD-19-research-challenge.zip

WORKDIR /root

EXPOSE 8080 4040

CMD ["bash"]