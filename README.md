# Fase 1: Aplicação Flask com Docker

## Objetivo: criar uma aplicação simples com Flask

Comandos (em cd app/backend):

> docker build -t flask-devops-app .
> docker run -p 5000:5000 flask-devops-app

Testes:

> http://localhost:5000
> http://localhost:5000/health



# Fase 2 - Parte 1

## Objetivo: testar terraform com aws_s3_bucket

Comandos:

> terraform init
> terraform validate
> terraform apply
> terraform destroy



# Fase 2 - Parte 2

## Objetivo: criar um repositorio de imagens na aws (ECR) usando terraform e enviar imagem Docker da aplicaçao Flask

Comandos:

> terraform init
> terraform apply

# Login no ECR (Elastic Container Registry)
> aws ecr get-login-password --region eu-west-1 | docker login --username AWS --password-stdin <id_aws>.dkr.ecr.eu-west-1.amazonaws.com

# Tag da imagem local
> docker tag flask-devops-app <id_aws>.dkr.ecr.eu-west-1.amazonaws.com/flask-devops-app

# Push da imagem
> docker push <id_aws>.dkr.ecr.eu-west-1.amazonaws.com/flask-devops-app


# Fase 3

## Objetivo: CI/CD com GitHub Actions + Push para ECR

Criação do .github\workflows\ci-cd.yaml e adição dos secrets consoante a conta aws


# Fase 4

> aws ecr get-login-password --region eu-west-1 | \
docker login --username AWS --password-stdin 092203534677.dkr.ecr.eu-west-1.amazonaws.com

> kubectl create secret docker-registry regcred \
  --docker-server=092203534677.dkr.ecr.eu-west-1.amazonaws.com \
  --docker-username=AWS \
  --docker-password=$(aws ecr get-login-password --region eu-west-1)

> helm unistall myapp
> minikube stop

> helm repo add prometheus-community https://prometheus-community.github.io/helm-charts

> kubectl get secret monitoring-grafana -o jsonpath="{.data.admin-password}" | base64 --decode ; echo (descobrir pass com username admin)
> minikube service monitoring-grafana

