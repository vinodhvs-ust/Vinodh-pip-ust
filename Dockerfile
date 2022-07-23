ROM python:3.8-alpine

RUN wget https://s3.amazonaws.com/aws-cli/awscli-bundle.zip && unzip awscli-bundle.zip && rm awscli-bundle.zip

RUN ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws

CMD [ "aws", "--version" ]