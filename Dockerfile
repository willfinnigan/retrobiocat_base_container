FROM continuumio/miniconda3:23.10.0-1

RUN apt-get update
RUN apt-get -y install ncbi-blast+ graphviz libgl1

RUN wget https://fastdl.mongodb.org/tools/db/mongodb-database-tools-debian10-x86_64-100.2.1.deb
RUN apt-get install ./mongodb-database-tools-debian10-x86_64-100.2.1.deb
COPY . /
RUN conda env create -n rbc -f env.yml
SHELL ["conda", "run", "-n", "rbc", "/bin/bash", "-c"]

RUN apt-get update && apt-get -y install poppler-utils ghostscript python3-tk

RUN conda install -c conda-forge chemicalite

RUN pip install -r requirements.txt

