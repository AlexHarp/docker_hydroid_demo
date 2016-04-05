mkdir -p ./hydroid/api/src/
git clone https://github.com/GeoscienceAustralia/hydroid.git ./hydroid/api/src/
mkdir -p ./hydroid/web/src/
git clone https://github.com/GeoscienceAustralia/hydroid-client.git ./hydroid/web/src/
docker-compose build .
