name "zlib"
default_version "1.2.8"

source :url => "http://zlib.net/zlib-#{version}.tar.xz",
       :md5 => "28f1205d8dd2001f26fec1e8c2cebe37"

relative_path "zlib-#{version}"


env = {
  "LDFLAGS" => "-L#{install_dir}/embedded/lib -I#{install_dir}/embedded/include",
  "CFLAGS" => "-L#{install_dir}/embedded/lib -I#{install_dir}/embedded/include",
  "LD_RUN_PATH" => "#{install_dir}/embedded/lib"
}

build do
  command ["./configure",
           "--prefix=#{install_dir}/embedded"]
  command "make"
  command "make install"

end
