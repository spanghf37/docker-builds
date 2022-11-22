FROM docker.io/grafana/grafana:9.2.3

RUN grafana-cli plugins install grafana-clickhouse-datasource

RUN grafana-cli plugins install volkovlabs-echarts-panel

RUN grafana-cli plugins install ae3e-plotly-panel

RUN grafana-cli plugins install yesoreyeram-boomtheme-panel

RUN grafana-cli plugins install marcusolsson-json-datasource

RUN grafana-cli plugins install michaeldmoore-multistat-panel

RUN grafana-cli plugins install golioth-websocket-datasource

RUN mkdir -p /var/lib/grafana/plugins/trino

COPY https://github.com/starburstdata/grafana-trino/archive/refs/heads/main.zip /var/lib/grafana/plugins/trino

RUN unzip /var/lib/grafana/plugins/trino/main.zip

RUN ls /var/lib/grafana/plugins/trino
