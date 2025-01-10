#FROM        redhat/ubi9
#RUN         dnf install nginx sudo -y
#RUN         rm -rf /usr/share/nginx/html/*
#COPY        ./ /usr/share/nginx/html/.
#COPY        nginx.conf /etc/nginx/nginx.conf
#ARG         NR_API_KEY
#RUN         curl -Ls https://download.newrelic.com/install/newrelic-cli/scripts/install.sh | bash
#RUN         NEW_RELIC_API_KEY=${NR_API_KEY} NEW_RELIC_ACCOUNT_ID=6258820 NEW_RELIC_REGION=US /usr/local/bin/newrelic install -n nginx-open-source-integration -y
#ENTRYPOINT  ["nginx", "-g", "daemon off;"]
#
#
#
FROM        nginx:stable-alpine3.20-perl
RUN         rm -rf /usr/share/nginx/html/*
COPY        ./ /usr/share/nginx/html/.
COPY        nginx-default.conf /etc/nginx/conf.d/default.conf
COPY        nginx.conf /etc/nginx/nginx.conf
RUN         chown nginx:nginx -R /var/cache/nginx
USER        nginx
