FROM        nginx
RUN         rm -rf /usr/share/nginx/html/*
COPY        ./ /usr/share/nginx/html/.
COPY        nginx-default.conf /etc/nginx/conf.d/default.conf
ARG         NR_API_KEY
RUN         curl -Ls https://download.newrelic.com/install/newrelic-cli/scripts/install.sh | bash \
RUN         NEW_RELIC_API_KEY=${NR_API_KEY} NEW_RELIC_ACCOUNT_ID=6258820 NEW_RELIC_REGION=US /usr/local/bin/newrelic install -n nginx-open-source-integration -y




