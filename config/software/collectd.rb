name "collectd"
default_version "5.4.1"


source :url => "https://collectd.org/files/collectd-#{version}.tar.gz",
       :md5 => "6514ab3f7fd2135d2713f1ab25068841"

relative_path "collectd-#{version}"

dependency "libgcrypt"
dependency "libgpg-error"
dependency "gnutls"
dependency "curl"
dependency "libidn"
dependency "rtmpdump"
dependency "openssl"
dependency "zlib"
dependency "libxml2"

env = {
  "LDFLAGS" => "-L#{install_dir}/embedded/lib -I#{install_dir}/embedded/include",
  "CFLAGS" => "-L#{install_dir}/embedded/lib -I#{install_dir}/embedded/include",
  "LD_RUN_PATH" => "#{install_dir}/embedded/lib"
}

build do
  command ["./configure",
           "--prefix=#{install_dir}/embedded"] , :env => env 
  command "make"
  command "make install"

end
