#Set OS

FROM docker.io/continuumio/miniconda3:24.1.2-0

MAINTAINER Ze_Pedro

#RUN apt-get update -y

#RUN apt-get --qq -y install curl tar bzip2 git zip wget
#Pull the Pipeline


#RUN mkdir folder
#RUN git clone https://github.com/tgac-vumc/QDNAseq.snakemake/ #Original github repository
RUN git clone --single-branch --branch Docker_container_version https://github.com/jppmatos/QDNAseq.snakemake/

#RUN cd QDNAseq.snakemake
WORKDIR /QDNAseq.snakemake
#install packages from yaml-file
RUN conda config --set channel_priority flexible
RUN conda install -c conda-forge mamba
RUN mamba env update -n base --file environment.yaml
 

#RUN conda config --add channels defaults
#RUN conda config --add channels bioconda
#RUN conda config --add channels conda-forge
#RUN conda config --add channels r

#RUN conda install python=3.9 samtools bwa==0.7.17 snakemake==7.32.4 pyyaml picard==2.20.8 fastqc \
#     perl-bioperl \ 
#     perl-dbd-mysql \
#     bioconductor-qdnaseq.hg19 \
#     bioconductor-biobase \
#     bioconductor-cghcall \
#     bioconductor-cghregions \
#     bioconductor-limma \
#     bioconductor-impute \
#     r-matrixstats \
#     r-r.cache \
#     r-denstrip \
#     r-flexmix \
#     r-gtools \
#     r-mass \
#     r-devtools==2.4.3 \
#     r-ggplot2 \
#     r-survival \
#     r-readxl \
#     -y

#RUN conda env update  -n base --file environment.yaml --prune

#RUN conda env create --file environment.yaml -y -n tester_QDNAseq
#RUN conda init && conda activate tester_QDNAseq
#install non-conda R-dependencies
RUN Rscript r-dependencies.R


