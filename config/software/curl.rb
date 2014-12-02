name "curl"
default_version "7.39.0"


source :url => "http://curl.haxx.se/download/curl-#{version}.tar.gz",
       :md5 => "88c5650122873712296d4b1db3f12e6c"

relative_path "curl-#{version}"

dependency "libgpg-error"
dependency "libidn"
dependency "rtmpdump"
dependency "openssl"
dependency "zlib"
dependency "openldap"
dependency "gnutls"
dependency "libtasn1"
dependency "libffi"

env = {
  "LDFLAGS" => "-L#{install_dir}/embedded/lib -I#{install_dir}/embedded/include",
  "CFLAGS" => "-L#{install_dir}/embedded/lib -I#{install_dir}/embedded/include",
  "LD_RUN_PATH" => "#{install_dir}/embedded/lib"
}

build do
  command ["./configure",
           "--prefix=#{install_dir}/embedded"], :env => env
  command "make"
  command "make install"

end
