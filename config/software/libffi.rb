name "libffi"
default_version "3.2.1"


source :url => "ftp://sourceware.org/pub/libffi/libffi-#{version}.tar.gz",
        :md5 => "83b89587607e3eb65c70d361f13bab43" # 3.2.1

relative_path "libffi-#{version}"

env = {
  "LDFLAGS" => "-L#{install_dir}/embedded/lib -I#{install_dir}/embedded/include",
  "CFLAGS" => "-L#{install_dir}/embedded/lib -I#{install_dir}/embedded/include",
  "LD_RUN_PATH" => "#{install_dir}/embedded/lib"
}

build do
  command ["./configure",
           "--prefix=#{install_dir}/embedded",
  ], :env => env
  command "make"
  command "make install"

end
