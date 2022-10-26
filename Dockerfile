FROM nvcr.io/nvidia/pytorch:22.09-py3

ADD . /app

WORKDIR /app

RUN apt update -y && apt install -y

RUN python -m pip install --upgrade pip

RUN pip install -r requirements.txt

ARG USERNAME=user
ARG USER_ID=1000
ARG USER_GID=$USER_ID
RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_ID --gid $USER_GID -m $USERNAME

USER $USERNAME