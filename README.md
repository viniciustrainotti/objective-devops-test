# Objective DevOps Test

Documento com passos e detalhes referente ao teste executado.
## Tech

Utilizado os seguintes recursos para execução do Teste. 

| Nome | Versão |
| ------ | ------ |
| OS  | Windows 10 Pro |
| Minikube | 1.19.0 |
| Docker |  20.10.7 |
| NodeJS | 12-alpine |


## Deployment - Manual

Considerando que o Minikube e Docker já estão configurados corretamente. Realizar o clone do projeto, executando o comando abaixo em um diretório que seja possível criar uma pasta com o código fonte do projeto. 
Nesse exemplo, é utilizado o caminho opt.

```sh
$ cd /opt/ 
$ git clone https://github.com/viniciustrainotti/objective-devops-test
$ cd objective-devops-test
```

Na pasta do projeto, dentro de kubernetes, será executado os arquivos App-deployment-dockerhub.yaml e App-service-dockerhub.yaml. Esses arquivos contém as configurações de deployment e exposição de serviço para o minikube.

```sh
$ kubectl create ns app
$ kubectl apply -f App-deployment-dockerhub.yaml --namespace=app
$ kubectl apply -f App-service-dockerhub.yaml --namespace=app
```

Caso esteja realizando esses passos em um OS Linux, para verificar a execução da aplicação, é necessário verificar qual ip o minikube adquiriu e linkar com porta 30009 do service.

```sh
$ minikube ip
192.168.49.2
```
Nesse caso, será necessário colocar na URL do browser: http://192.168.49.2:30009

Caso esteja realizando esses passos em um OS Windows, para verificar a execução da aplicação, é necessário executar um comando especifico do minikube service para gerar a url de tunnel correspondente.

```sh
$ minikube service --url objective-devops-test-dockerhub-service --namespace=app
* Starting tunnel for service objective-devops-test-dockerhub-service.
|-----------|-----------------------------------------|-------------|------------------------|
| NAMESPACE |                  NAME                   | TARGET PORT |          URL           |
|-----------|-----------------------------------------|-------------|------------------------|
| app       | objective-devops-test-dockerhub-service |             | http://127.0.0.1:55588 |
|-----------|-----------------------------------------|-------------|------------------------|
http://127.0.0.1:55588
! Because you are using a Docker driver on windows, the terminal needs to be open to run it.
```
Nesse caso, será necessário colocar na URL do browser: http://127.0.0.1:55588

Para maiores informações, esta anexado nesse documento um vídeo explicativo.

---
## Deployment - Automático

Considerando que o Minikube e Docker já estão configurados corretamente. Realizar o clone do projeto, executando o comando abaixo em um diretório que seja possível criar uma pasta com o código fonte do projeto. 
Nesse exemplo, é utilizado o caminho opt.

```sh
$ cd /opt/ 
$ git clone https://github.com/viniciustrainotti/objective-devops-test
$ cd objective-devops-test
```

Na pasta do projeto, dentro de kubernetes, será executado o arquivo deployment.sh que irá subir todo o ambiente. Considerar os argumentos -ns para namespace e -os para o sistema operacional utilizado.

Windows - Recomendado utilizar o Git Bash
```sh
$ cd kubernetes
$ ./deployment.sh -ns app -os windows
```
Linux
```sh
$ cd kubernetes
$ ./deployment.sh -ns app -os linux
```
Como resultado será o mesmo que o deployment manual.

---
## Explicativo do Teste - Vídeo

[![IMAGE ALT TEXT HERE](https://img.youtube.com/vi/uE8Z5ID7L5M/0.jpg)](https://www.youtube.com/watch?v=uE8Z5ID7L5M)
