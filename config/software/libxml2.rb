name "libxml2"
default_version "2.9.2"


source :url => "ftp://xmlsoft.org/libxml2/libxml2-#{version}.tar.gz",
        :md5 => "9e6a9aca9d155737868b3dc5fd82f788" # 2.9.2

relative_path "libxml2-#{version}"


env = {
  "LDFLAGS" => "-L#{install_dir}/embedded/lib -I#{install_dir}/embedded/include",
  "CFLAGS" => "-L#{install_dir}/embedded/lib -I#{install_dir}/embedded/include",
  "LD_RUN_PATH" => "#{install_dir}/embedded/lib"
}

dependency "zlib"

build do
  command ["./configure",
           "--prefix=#{install_dir}/embedded",
          "--without-python",
          "--with-zlib=#{install_dir}/embedded",
  ], :env => env
  command "make", :env => env
  command "make install"

end
