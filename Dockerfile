FROM quay.io/pypa/manylinux1_x86_64

COPY build.sh /root/build.sh
COPY build_conda_package.sh /root/build_conda_package.sh
COPY meta.yaml /root/meta.yaml

RUN echo 'export PATH=/opt/conda/bin:$PATH' > /etc/profile.d/conda.sh
RUN wget  --no-check-certificate https://repo.continuum.io/archive/Anaconda2-4.1.0-Linux-x86_64.sh -O ~/anaconda.sh
RUN /bin/bash ~/anaconda.sh -b -p /opt/conda
RUN rm ~/anaconda.sh

CMD /bin/bash
