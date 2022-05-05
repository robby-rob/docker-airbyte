FROM mikefarah/yq:4
USER yq
ARG version=master
RUN mkdir /home/yq/output && \
    cd /tmp && \
    wget https://raw.githubusercontent.com/airbytehq/airbyte/$version/.env && \
    wget https://raw.githubusercontent.com/airbytehq/airbyte/$version/docker-compose.yaml && \
    cp .env /home/yq/output/.env && \
    cat docker-compose.yaml | \
        yq 'del(.services.*.ports)' | \
        yq '.services.*.networks.[0] = "backend"' | \
        yq '.networks.backend.name = "airbyte-backend"' | \
        cat > /home/yq/output/docker-compose.yaml
ENTRYPOINT ["sh"]