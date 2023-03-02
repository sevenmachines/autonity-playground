BASE_DIR=$(pwd)
AT_EXTERNAL_IP=$(curl -sS ifconfig.me)
if [ -z "$BASE_DIR" ]; then echo Could not auto-detect working directory; exit 1; fi
if [ -z "$AT_EXTERNAL_IP" ]; then echo Could not auto-detect external ip; exit 1; fi
cp env_example .env
sed -i "s|BASE_DIR=.*|BASE_DIR=${BASE_DIR}|g" .env
sed -i "s|AT_EXTERNAL_IP=.*|AT_EXTERNAL_IP=${AT_EXTERNAL_IP}|g" .env
docker compose build; docker compose up -d; docker compose logs -f -n 100

