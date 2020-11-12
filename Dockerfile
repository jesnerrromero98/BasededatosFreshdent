FROM mcr.microsoft.com/mssql/server:2019-latest
COPY ./freshdent.sql .
ENV ACCEPT_EULA="Y"
ENV SA_PASSWORD ="JesElk15*"
CMD ["/opt/mssql-tools/bin/sqlcmd -i freshdent.sql -S localhost -U SA -P JesElk15*"]