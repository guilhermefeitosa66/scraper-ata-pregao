#encoding: utf-8
# autor: Guilherme Feitoza <guilhermefeitosa66@gmail.com>
require 'nokogiri'
require 'axlsx'

puts 'Carregando arquivo...'

html = Nokogiri::HTML(File.open('ata.html', "r:UTF-8", &:read))
html = html.xpath('/html/body/table[2]/tbody/tr[4]/td/table')

puts 'extraindo dados: '

Axlsx::Package.new do |p|
  p.workbook.add_worksheet(:name => "ata") do |sheet|
    sheet.add_row ['ITEM', 'DESCRIÇÃO', 'DESCRIÇÃO COMPLEMENTAR', 'QUANTIDADE', 'UND', 'VALOR']

    html.each_with_index do |element, index|    
      if index.even?
        row = []
        row << element.at_xpath('tbody/tr[1]/td/text()').text.strip.gsub("\n", "").gsub("\r", "")
        row << element.at_xpath('tbody/tr[2]/td/table/tbody/tr[1]/td/text()').text.strip
        row << element.at_xpath('tbody/tr[2]/td/table/tbody/tr[2]/td/text()').text.strip
        row << element.at_xpath('tbody/tr[2]/td/table/tbody/tr[4]/td[1]').text.strip.gsub("Quantidade: \r\n", "").gsub(',', '.').to_f
        row << element.at_xpath('tbody/tr[2]/td/table/tbody/tr[4]/td[2]').text.strip.gsub("Unidade de fornecimento: \r\n", "")
        row << element.at_xpath('tbody/tr[2]/td/table/tbody/tr[5]/td[1]').text.strip.gsub("Valor Estimado: R$ \r\n", "").gsub(",", ".").to_f
        # p row; exit
        sheet.add_row row
        print '.'
      end
    end
  end

  p.serialize('ata.xlsx')
end

puts ''
puts 'Finalizado!'