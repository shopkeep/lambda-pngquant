FROM lambci/lambda:build-python3.6

COPY build.sh /usr/local/bin/
CMD [ "build.sh" ]
