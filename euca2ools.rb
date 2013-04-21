require 'formula'

class Euca2ools < Formula
 depends_on 'python'
 depends_on 'boto' => :python
 depends_on 'M2Crypto' => :python

 url 'https://github.com/eucalyptus/euca2ools/archive/2.1.3.tar.gz'
 homepage 'http://www.eucalyptus.com/download/euca2ools'
 md5 'a76c752e6e7a7eeab978ba69f14788b4'

 def install
   # In order to install into the Cellar, the dir must exist and be in the PYTHONPATH.
   temp_site_packages = lib/which_python/'site-packages'
   mkdir_p temp_site_packages
   ENV['PYTHONPATH'] = temp_site_packages

   args = [
     "--no-user-cfg",
     "--verbose",
     "install",
     "--force",
     "--install-scripts=#{bin}",
     "--install-lib=#{temp_site_packages}",
     "--install-data=#{share}",
     "--install-headers=#{include}",
   ]

   system "python", "-s", "setup.py", *args
 end

 def which_python
   # Update this once we have something like [this](https://github.com/mxcl/homebrew/issues/11204)
   "python" + `python -c 'import sys;print(sys.version[:3])'`.strip
 end
end
