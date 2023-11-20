FROM node:20-buster-slim

LABEL version="1.0.10"
LABEL repository="https://github.com/marsen/hexo-action"
LABEL homepage="https://blog.marsen.me"
LABEL maintainer="marsen.lin <admin@marsen.me>"

WORKDIR /usr/app
COPY entrypoint.sh /usr/app/entrypoint.sh
COPY sync_deploy_history.js /usr/app/sync_deploy_history.js

RUN apt-get update > /dev/null && \
    apt-get install -y git openssh-client > /dev/null ; \
    chmod +x /usr/app/entrypoint.sh

ENTRYPOINT ["/usr/app/entrypoint.sh"]