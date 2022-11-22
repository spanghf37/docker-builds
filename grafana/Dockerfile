FROM docker.io/grafana/grafana:9.2.3

RUN grafana-cli plugins install grafana-clickhouse-datasource

RUN grafana-cli plugins install volkovlabs-echarts-panel

RUN grafana-cli plugins install ae3e-plotly-panel

RUN grafana-cli plugins install yesoreyeram-boomtheme-panel

RUN grafana-cli plugins install marcusolsson-json-datasource

RUN grafana-cli plugins install michaeldmoore-multistat-panel

RUN grafana-cli plugins install golioth-websocket-datasource

RUN find -iname golioth-websocket-datasource

ADD https://github.com/starburstdata/grafana-trino/archive/refs/heads/main.zip /tmp

USER root

RUN unzip /tmp/main.zip -d /tmp/grafana-trino-main \
 && rm /tmp/main.zip \
 && mv /tmp/grafana-trino-main/* /var/lib/grafana/plugins/trino \
 && chown -R grafana:root /var/lib/grafana/plugins/trino

USER grafana
