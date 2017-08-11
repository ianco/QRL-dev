FROM python:2.7-wheezy
RUN apt-get update && apt-get install -y telnet
RUN pip install jsonpickle 
RUN pip install leveldb 
RUN pip install Twisted==16.0.0 
RUN pip install blessings 
RUN pip install statistics
RUN pip install ntplib
RUN pip install simplejson
WORKDIR /home/osboxes/Projects/QRL
CMD bash


