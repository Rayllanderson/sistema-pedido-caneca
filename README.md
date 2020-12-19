# Sistema pedido de canecas
[![NPM](https://img.shields.io/npm/l/react)](https://github.com/Rayllanderson/sistema-pedido-caneca/blob/master/LICENSE) 

# Sobre o projeto

Sistema pedido de canecas é uma aplicação desenvolvida a pedido do meu irmão, para que o ajudasse a ter mais controle sobre os pedidos de canecas personalizadas.

Este é um sistema que consiste em um gerenciamento de pedidos personalizados, em que os dados são coletados em
<a href="https://github.com/Rayllanderson/pedido-de-caneca"> pedido de canecas</a> e, depois, após o cliente realizar
o pedido, eles serão listados em uma aba de pedidos realizados. Dentro dela, mostrará todos os clientes que realizaram pedidos. Acessando 
um dos clientes, você tem acesso às canecas que foram solicitadas na página de pedidos. acessando a caneca escolhida, terá acesso às 
informações descritas pelo cliente para a caneca específica, como também as fotos, podendo subir mais arquivos, caso necessário.

A aplicação também possui filtros, upload de arquivos, controle dos temas e formas de entregas.
Os filtros ajudam a encontrar uma caneca que está em uma determinada etapa.  Upload de arquivo fica para
as canecas dos clientes, caso haja alterações. E, por fim, o controle de temas e formas de entregas, que ficam
totalmente acessíveis, possibilitando salvar, editar e excluir qualquer um deles a qualquer momento.
Os temas e formas de entregas possui relação direta com os temas e formas de entregas listados na página de pedidos.

## Layout web

<h3> Tela Inicial </h3>

![Inicial ](https://github.com/Rayllanderson/assets/blob/master/pedido-de-caneca/home.png)

<h3> Tela de clientes </h3>

![Inicial ](https://github.com/Rayllanderson/assets/blob/master/pedido-de-caneca/clientes.png)

<h3> Tela de canecas de um cliente </h3>

![Inicial ](https://github.com/Rayllanderson/assets/blob/master/pedido-de-caneca/filters.png)

<h3> Tela da caneca escolhida </h3>

![Inicial ](https://github.com/Rayllanderson/assets/blob/master/pedido-de-caneca/caneca.png)


## Mobile

<h3> Tela de canecas e enviando mensagem para o cliente</h3>

<img src="https://github.com/Rayllanderson/assets/blob/master/pedido-de-caneca/canecas_m.jpeg" width="48%"/>  <img src="https://github.com/Rayllanderson/assets/blob/master/pedido-de-caneca/sendMsg_m.jpeg" width="48%"/>

<h3> Upload de arquivo e editando um tema </h3>

<img src="https://github.com/Rayllanderson/assets/blob/master/pedido-de-caneca/upload_m.jpeg" width="48%"/>  <img src="https://github.com/Rayllanderson/assets/blob/master/pedido-de-caneca/editTheme_m.jpeg" width="48%"/>

<h3> Tela com todas as canecas e acessando uma caneca</h3>

<img src="https://github.com/Rayllanderson/assets/blob/master/pedido-de-caneca/todas%20canecas_m.jpeg" width="48%"/>  <img src="https://github.com/Rayllanderson/assets/blob/master/pedido-de-caneca/caneca2_m.jpeg" width="48%"/>

## Modelo conceitual
![Modelo Conceitual](https://github.com/Rayllanderson/assets/blob/master/pedido-de-caneca/modelo%20conceitual(sistema).jpeg)

# Tecnologias utilizadas
## Back end
- Java
- JDBC
- Servlet
- Maven
## Front end
- JSP / HTML
- JQuery / JS
- Bootstrap / CSS
- Dropzone.js

## Implantação em produção
- localhost (apenas conectado com banco de dados em produção)
- Banco de dados: MySQL

# Como executar o projeto

Pré-requisitos: Java 11, Apache tomcat 9

Download war: https://github.com/Rayllanderson/assets/blob/master/pedido-de-caneca/sistema-pedido-caneca.war

Após ter o java e o tomcat instalado, basta apenas fazer o deploy do war via tomcat, ou jogar o arquivo war para a pasta <i> apache-tomcat-9\webapps </i>

# Autor

Rayllanderson Gonçalves Rodrigues
