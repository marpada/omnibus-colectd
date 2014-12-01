name "glibc"
default_version "2.20"

source :url =>"http://mirror.lagoon.nc/pub/gnu/libc/glibc-#{version}.tar.gz",
       :md5 => "aabb1776353e6bc60ecc707af78a3813" #---> 2.1.20

relative_path "glibc-#{version}"

env = {
  "LDFLAGS" => "-L#{install_dir}/embedded/lib -I#{install_dir}/embedded/include",
  "CFLAGS" => "-L#{install_dir}/embedded/lib -I#{install_dir}/embedded/include",
  "LD_RUN_PATH" => "#{install_dir}/embedded/lib"
}

build do
  command ["./configure",
           "--prefix=#{install_dir}/embedded"],
        :env => env
  command "make"
  command "make install"

end
