require 'rubygems'
require 'bundler/setup'

require 'dotenv'; Dotenv.load;
require 'net/telnet'

zpl = '^XA^CFA,50^FO100,100^FDHello World^FS^XZ'

begin
  printer = Net::Telnet::new 'Host' => ENV.fetch('PRINTER_IP'), 'Port' => ENV.fetch('PRINTER_PORT'), 'Timeout' => 0
  printer.cmd(zpl) {|c| print c}
rescue Net::ReadTimeout # these printers don't like to close their connections
  printer.close
  puts 'Sent ZPL'
end
