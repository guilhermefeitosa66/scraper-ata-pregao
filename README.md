INSTRUÇÕES PARA UBUNTU >= 18.04 (ou derivados)

Esse script pode ser utilizado para gerar uma planilha a partir da página
da Ata de Realização do Pregão Eletrônico, bastando salvar o arquivo html
com o encoding: utf-8 dentro da pasta do script com o nome:  ata.html

Nesse exemplo foi utilizado a página: http://comprasnet.gov.br/livre/pregao/AtaEletronico.asp?co_no_uasg=158959&&uasg=158959&numprp=12020&Seq=

1) para executar este script prmeiro instale o Ruby
$ sudo apt install ruby

2) caso o comando seguinte não funcione instale a gem bundler
$ gem install bundler

3) dentro da pasta "scrap-ata/" esse comando para instalar as dependencias:
$ bundle install

4) Para gerar a planilha basta executar o comando:
$ ruby scraper.rb

5) após executar o comando, o arquivo ata.xlsx será gerado.