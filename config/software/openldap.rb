name "openldap"
default_version "2.4.40"
#default_version "2.4.34"


source :url => "ftp://ftp.openldap.org/pub/OpenLDAP/openldap-release/openldap-#{version}.tgz",
        :md5 => "423c1f23d2a0cb96b3e9baf7e9d7dda7" # 2.4.40
       # :md5 => "df93a62e396ac312333cdeab0c5b48b6" # 2.4.34

relative_path "openldap-#{version}"

dependency "openssl"
dependency "gnutls"
dependency "zlib"
dependency "p11-kit"
dependency "libtasn1"
dependency "nettle"
dependency "gmp"
dependency "libffi"

env = {
  "LDFLAGS" => "-L#{install_dir}/embedded/lib -I#{install_dir}/embedded/include",
  "CFLAGS" => "-L#{install_dir}/embedded/lib -I#{install_dir}/embedded/include",
  "LD_RUN_PATH" => "#{install_dir}/embedded/lib"
}

build do
  command ["./configure",
           "--prefix=#{install_dir}/embedded",
           "--disable-hdb","--disable-bdb",
             "--disable-slapd",
             "--disable-backends",
  ], :env => env
  command "make", :env => env
  command "make install"

end
