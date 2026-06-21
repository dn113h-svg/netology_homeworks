# Cloud Infrastructure 04

## Требования

- Terraform
- Docker и Docker Compose
- Yandex Cloud CLI

## Запуск

1. Перейти в папку Terraform:

```bash
cd src
```

2. Заполнить локальные переменные в `personal.auto.tfvars`:

```hcl
token          = "<yc_oauth_token>"
cloud_id       = "<cloud_id>"
folder_id      = "<folder_id>"
mysql_password = "<mysql_password>"
```

3. Заполнить bucket и ключи доступа к Object Storage для Terraform backend в `backend.hcl`:

```hcl
bucket     = "<tfstate_bucket_name>"
access_key = "<static_access_key>"
secret_key = "<static_secret_key>"
```

4. Инициализировать и применить Terraform:

```bash
terraform init -reconfigure -backend-config=backend.hcl
terraform apply
```

5. Получить параметры инфраструктуры:

```bash
terraform output -raw mysql_host
terraform output -raw container_registry_id
terraform output -raw vm_public_ip
```

6. Собрать и отправить образ приложения в Container Registry:

```bash
cd web_app
docker build -t "web-app:latest" .
```
аутентифицироваться в реестре (https://yandex.cloud/ru/docs/container-registry/operations/authentication)

```bash
docker push "${APP_IMAGE}"
```
7. Зайти на VM и запустить приложение:

```bash
sudo docker pull cr.yandex/<registry_id>/web-app:latest

sudo docker run -d \
  --name web-app \
  --restart always \
  -p 80:5000 \
  -e DB_HOST=<mysql_host> \
  -e DB_PORT=3306 \
  -e DB_USER=app \
  -e DB_PASSWORD=<mysql_password> \
  -e DB_NAME=virtd \
  cr.yandex/<registry_id>/web-app:latest
```

8. Проверить работу:

```bash
curl http://<vm_public_ip>:8090
```
