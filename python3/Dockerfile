FROM quay.io/pypa/manylinux1_x86_64

RUN echo 'export PATH=/opt/conda/bin:$PATH' > /etc/profile.d/conda.sh
RUN wget  --no-check-certificate https://repo.continuum.io/archive/Anaconda3-4.2.0-Linux-x86_64.sh -O ~/anaconda.sh
RUN /bin/bash ~/anaconda.sh -b -p /opt/conda
RUN rm ~/anaconda.sh

COPY gromacs /root/gromacs
COPY get_gmx /root/get_gmx

CMD /bin/bash
