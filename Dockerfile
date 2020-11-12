FROM mcr.microsoft.com/mssql/server:2019-latest
COPY ./query.sql .
ENV ACCEPT_EULA="Y"
ENV SA_PASSWORD ="JesElk15*"
RUN /opt/mssql-tools/bin/sqlcmd -i query.sql -S localhost -U SA -P JesElk15*