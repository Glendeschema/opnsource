 sudo apt-get update

sudo apt install docker.io 
sudo systemctl start docker
sudo systemctl enable docker

#Pull the SQL Server 2017 Linux container image from Microsoft Container Registry
docker pull mcr.microsoft.com/mssql/server:2017-latest

sudo docker run -e 'ACCEPT_EULA=Y' -e 'SA_PASSWORD=Munch13w@k@' \
   -p 1433:1433 --name sqlsrv1 \
   -d mcr.microsoft.com/mssql/server:2017-latest

sudo docker exec -it sqlsrv1 /opt/mssql-tools/bin/sqlcmd \
   -S localhost -U SA -P 'Munch13w@k@' \
   -Q 'ALTER LOGIN SA WITH PASSWORD="Munch13w@k@+01"'





