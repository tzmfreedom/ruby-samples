#!/usr/bin/env ruby

require 'rqrcode'

qrcode = RQRCode::QRCode.new('https://github.com')
# File.write('qr.svg', qrcode.as_svg)
# File.write('qr.png', qrcode.as_png)
puts qrcode.to_s
