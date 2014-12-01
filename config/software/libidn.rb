name "libidn"
default_version "1.29"


source :url => "http://ftp.gnu.org/gnu/libidn/libidn-1.29.tar.gz",
       :md5 => "2b67bb507207af379f9461e1307dc84b"

relative_path "libidn-#{version}"


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
