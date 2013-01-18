require 'formula'

class Euca2ools < Formula
  url 'https://github.com/eucalyptus/euca2ools/archive/2.1.2.tar.gz'
  homepage 'http://www.eucalyptus.com/download/euca2ools'
  md5 '9a517e7bed703652a2264048e5a98588'

  depends_on 'help2man'
  depends_on 'swig'

  def install
    system "easy_install boto"
    system "easy_install M2Crypto"
    system "python setup.py build"
  end
end
