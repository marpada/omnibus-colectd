name "gnutls"
#default_version "3.3.0"
default_version "3.2.20"

source :url =>"ftp://ftp.gnutls.org/gcrypt/gnutls/v#{version.gsub(/\.\d+$/,'')}/gnutls-#{version}.tar.xz ",
       #:md5 => "4aeb8014feb4016c73a60f4e1ac73c9f" ---> 3.3.0
       :md5 => "637ef52191bf87a597240a49cc533972" #---> 3.2.20

relative_path "gnutls-#{version}"

dependency "nettle"

env = {
  "LDFLAGS" => "-L#{install_dir}/embedded/lib -I#{install_dir}/embedded/include",
  "CFLAGS" => "-L#{install_dir}/embedded/lib -I#{install_dir}/embedded/include",
  "NETTLE_CFLAGS" => "-L#{install_dir}/embedded/lib -I#{install_dir}/embedded/include",
  "LD_RUN_PATH" => "#{install_dir}/embedded/lib",
  "PKG_CONFIG_PATH" => "#{install_dir}/embedded/lib/pkgconfig:/usr/local/lib/x86_64-linux-gnu/pkgconfig:/usr/local/lib/pkgconfig:/usr/local/share/pkgconfig:/usr/lib/x86_64-linux-gnu/pkgconfig:/usr/lib/pkgconfig:/usr/share/pkgconfig",
}

build do
  command ["./configure",
           "--prefix=#{install_dir}/embedded",
           "--enable-shared",
  ],
        :env => env
  command "make"
  command "make install"

end
