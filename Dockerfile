FROM mcr.microsoft.com/mssql/server:2019-latest
COPY ./query .
ENV ACCEPT_EULA="Y"
ENV SA_PASSWORD ="JesElk15*"
RUN /opt/mssql-tools/bin/sqlcmd -i create-db.sql -S localhost -U SA -P JesElk15*