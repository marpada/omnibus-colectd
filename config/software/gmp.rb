name "gmp"
#default_version "6.0.0a"
default_version "5.1.3"

source :url =>"https://ftp.gnu.org/gnu/gmp/gmp-#{version}.tar.xz",
       #:md5 => "1e6da4e434553d2811437aa42c7f7c76" #---> 6.0.0a"
       :md5 => "e5fe367801ff067b923d1e6a126448aa" #---> 5.1.3"

relative_path "gmp-#{version.gsub(/[a-z]+$/,'')}"

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
