name "rtmpdump"
default_version "2.3"


source :url => "http://rtmpdump.mplayerhq.hu/download/rtmpdump-#{version}.tgz",
       :md5 => "eb961f31cd55f0acf5aad1a7b900ef59"

relative_path "rtmpdump-#{version}"


env = {
  "LDFLAGS" => "-L#{install_dir}/embedded/lib -I#{install_dir}/embedded/include",
  "CFLAGS" => "-L#{install_dir}/embedded/lib -I#{install_dir}/embedded/include",
  "LD_RUN_PATH" => "#{install_dir}/embedded/lib"
}

build do
  command "make SYS=posix"

end
