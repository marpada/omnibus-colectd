name "openssl"
default_version "1.0.1j"

source :url => "https://www.openssl.org/source/openssl-#{version}.tar.gz",
       :md5 => "f7175c9cd3c39bb1907ac8bba9df8ed3"

relative_path "openssl-#{version}"

env = {
  "LDFLAGS" => "-L#{install_dir}/embedded/lib -I#{install_dir}/embedded/include",
  "CFLAGS" => "-L#{install_dir}/embedded/lib -I#{install_dir}/embedded/include -fPIC",
  "LD_RUN_PATH" => "#{install_dir}/embedded/lib"
}

build do
  command ["./config",
           "--prefix=#{install_dir}/embedded" ,
           "shared",
           "zlib",
           "no-rc5",
           "--with-zlib-lib=#{install_dir}/embedded/lib",
           "--with-zlib-include=#{install_dir}/embedded/include",
           "disable-gost",
           "-L#{install_dir}/embedded/lib",
           "-I#{install_dir}/embedded/include",
           "-Wl,-rpath,#{install_dir}/embedded/lib",

  ], :env => env
  command "make"
  command "make install"

end
