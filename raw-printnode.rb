require 'rubygems'
require 'bundler/setup'

require 'dotenv'; Dotenv.load;
require 'printnode'
require 'base64'

zpl = '^XA^CFA,50^FO100,100^FDHello World^FS^XZ'
payload = Base64.encode64 zpl

printnode = PrintNode::Client.new PrintNode::Auth.new(ENV.fetch('PRINTNODE_API_KEY'))
job = PrintNode::PrintJob.new ENV.fetch('PRINTNODE_PRINTER_ID'), 'Sample Raw String', 'raw_base64', payload, 'Printnode Raw PoC'
printnode.create_printjob job
puts 'Successfuly created printjob'
