# INSTRUÇÕES PARA UBUNTU >= 18.04 (ou derivados)

Esse script pode ser utilizado para gerar uma planilha a partir da página
da Ata de Realização do Pregão Eletrônico, bastando salvar o arquivo html
com o encoding: utf-8 dentro da pasta do script com o nome:  ata.html

Nesse exemplo foi utilizado a página: 
http://comprasnet.gov.br/livre/pregao/AtaEletronico.asp?co_no_uasg=158959&&uasg=158959&numprp=12020&Seq=

## 1) Instalação do Ruby
```
$ sudo apt install ruby
```

Ou instale o Ruby pelo RVM

```
$ sudo apt install git curl
$ curl -sSL https://get.rvm.io | bash -s -- --path ~/.rvm
$ echo '[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"' >> ~/.bashrc
$ source ~/.bashrc
$ rvm requirements
$ rvm install 2.7.2
$ rvm use 2.7.2 --default
```

## 2) dentro da pasta **scrap-ata/** esse comando para instalar as dependencias:
```
$ bundle install
```

Caso esse comando resulte em erro, instale o bundler, remova o arquivo **Gemfile.lock** e repita o **bundle install**

```
$ rm Gemfile.lock 
$ gem install bundler
$ bundle install
```

## 3) Salve a página da Ata de Pregão Eletrônico dentro da pasta **scrap-ata/** com o nome **ata.html**

## 4) Para gerar a planilha execute o script **scraper.rb**:
```
$ ruby scraper.rb
```

Será criando dentro da pasta onde encontra-se o script um arquivo com o nome **ata.xlsx**

## Inspirado no tutorial:

> https://www.distilled.net/resources/web-scraping-with-ruby-and-nokogiri-for-beginners/