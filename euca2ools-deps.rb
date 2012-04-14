require 'formula'

class Euca2oolsDeps < Formula
  url 'http://open.eucalyptus.com/sites/all/modules/pubdlcnt/pubdlcnt.php?nid=1346&file=http://eucalyptussoftware.com/downloads/releases/euca2ools-1.3.1-src-deps.tar.gz'
  homepage 'http://open.eucalyptus.com/downloads'
  version '1.3.1'
  md5 'a33ee3a129fa9135d9896cc9fc5a621a'

  def install
    install_boto
    install_m2crypto
  end
  
  def install_boto
    system <<-EOS
      easy_install boto
    EOS
  end
  
  def install_m2crypto
    system <<-EOS
      easy_install M2Crypto
    EOS
  end
end
