FROM python:3.7

ENV HOME /app
WORKDIR /app

COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt
RUN famcy init dev
RUN famcy deploy dev
RUN cd /app/.local/share/famcy/dev && . venv/bin/activate && pip3 install opencv-python
RUN apt-get update && apt-get install ffmpeg libsm6 libxext6 -y

ENV PYTHONUNBUFFERED 1
WORKDIR /app/.local/share/famcy/dev/venv/lib/python3.7/site-packages
