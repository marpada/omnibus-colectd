name "openssl"
default_version "1.0.1j"

source :url => "https://www.openssl.org/source/openssl-#{version}.tar.gz",
       :md5 => "f7175c9cd3c39bb1907ac8bba9df8ed3"

relative_path "openssl-#{version}"


env = {
  "LDFLAGS" => "-L#{install_dir}/embedded/lib -I#{install_dir}/embedded/include",
  "CFLAGS" => "-L#{install_dir}/embedded/lib -I#{install_dir}/embedded/include",
  "LD_RUN_PATH" => "#{install_dir}/embedded/lib"
}

build do
  command ["./config",
           "--prefix=#{install_dir}/embedded"]
  command "make"
  command "make install"

end
