BASE_DIR=$(pwd)
AT_EXTERNAL_IP=$(curl ifconfig.me)
cp env_example .env
sed -i "s|BASE_DIR=.*|BASE_DIR=${BASE_DIR}|g" .env
sed -i "s|AT_EXTERNAL_IP=.*|AT_EXTERNAL_IP=${AT_EXTERNAL_IP}|g" .env
docker compose build; docker compose up -d

