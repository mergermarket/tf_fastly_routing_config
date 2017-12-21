FROM python:3-alpine
COPY requirements.txt .

ENV TERRAFORM_VERSION=0.11.1

ENV TERRAFORM_PROVIDER_TEMPLATE_VERSION=1.0.0

ENV PYTHONDONTWRITEBYTECODE donot

RUN apk update && apk add ca-certificates curl git openssl wget && \
    update-ca-certificates && \
    cd /tmp && \
    wget -q https://releases.hashicorp.com/terraform/$TERRAFORM_VERSION/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
        unzip terraform_*_linux_amd64.zip -d /usr/bin && \
    wget -q https://releases.hashicorp.com/terraform-provider-template/${TERRAFORM_PROVIDER_TEMPLATE_VERSION}/terraform-provider-template_${TERRAFORM_PROVIDER_TEMPLATE_VERSION}_linux_amd64.zip && \
        unzip terraform-provider-template_*_linux_amd64.zip -d /usr/bin && \
    rm -rf /tmp/* /var/cache/apk/* /var/tmp/*

RUN pip install --no-cache-dir -r requirements.txt
ADD infra /infra
