require 'formula'

class Euca2ools < Formula
 depends_on 'python'
 # for M2Crypto, we are't using this because swig attempts to install after the pip dependency output
 # so naturally the pip install commands fail (as swig is not installed yet)
 #depends_on 'swig'
 #depends_on 'M2Crypto' => :python
 depends_on 'boto' => :python

 url 'https://github.com/eucalyptus/euca2ools/archive/2.1.3.tar.gz'
 homepage 'http://www.eucalyptus.com/download/euca2ools'
 md5 'a76c752e6e7a7eeab978ba69f14788b4'

 def install
   # unfortunately, the pip version depends on swig which doesn't run before the python dependency runs
   # for some reason easy_install is able to find a binary for osx instead; which makes this much easier
   system 'easy_install m2crypto'
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
