name "p11-kit"
default_version "0.22.1"


source :url => "http://p11-glue.freedesktop.org/releases/p11-kit-#{version}.tar.gz",
        :md5 => "4e9bea1106628ffb820bdad24a819fac" # 0.22.1

relative_path "p11-kit-#{version}"


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
