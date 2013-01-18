require 'formula'

class Euca2ools < Formula
  url 'https://github.com/eucalyptus/euca2ools/archive/2.1.2.tar.gz'
  homepage 'http://www.eucalyptus.com/download/euca2ools'
  md5 '9a517e7bed703652a2264048e5a98588'

  def install
    system "easy_install boto"
    system "python setup.py install"
    system "easy_install M2Crypto"
  end
end
