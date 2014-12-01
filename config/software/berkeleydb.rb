name "berkeleydb"
#default_version "5.3.28"  # Version 6.X doesn't work with OpenLDAP
#default_version "4.8.30"  # Version 6.X doesn't work with OpenLDAP
#default_version "5.0.32"  # Version 6.X doesn't work with OpenLDAP
default_version "5.1.25"  # Version 6.X doesn't work with OpenLDAP


source :url => "http://download.oracle.com/berkeley-db/db-#{version}.tar.gz",
       #:md5 => "bfea581b42dc0fc247041e7d48cfd7fb" ---> 6.1.19
       # :md5 => "b99454564d5b4479750567031d66fe24" ---> 5.3.28
       #:md5 => "f80022099c5742cd179343556179aa8c" ---> 4.8.30
       #:md5 => "b63afbd6ab191d0f19e00927f25d66fe"    ---> 5.0.32
       :md5 => "06656429bfc1abb6c0498eaeff70cd04"  # ---> 5.1.25

relative_path "db-#{version}/build_unix"

env = {
  "LDFLAGS" => "-L#{install_dir}/embedded/lib -I#{install_dir}/embedded/include",
  "CFLAGS" => "-L#{install_dir}/embedded/lib -I#{install_dir}/embedded/include",
  "LD_RUN_PATH" => "#{install_dir}/embedded/lib"
}

build do
  command ["../dist/configure",
           "--prefix=#{install_dir}/embedded"]
  command "make"
  command "make install"

end
