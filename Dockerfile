FROM mcr.microsoft.com/mssql/server:2019-latest
COPY ./freshdent.sql .
ENV ACCEPT_EULA="Y"
ENV SA_PASSWORD ="JesElk15*"
RUN (/opt/mssql/bin/sqlservr --accept-eula & ) | grep -q "Service Broker manager has started" && /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P "JesElk15*" -d master -i freshdent.sql