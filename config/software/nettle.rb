name "nettle"
default_version "2.7.1"


source :url => "https://ftp.gnu.org/gnu/nettle/nettle-#{version}.tar.gz",
        #:md5 => "f64b1bf1e774b7ae6e507318e340250e" # 3.0
        #:md5 => "2caa1bd667c35db71becb93c5d89737f" # 2.7
        :md5 => "003d5147911317931dd453520eb234a5" # 2.7.1

relative_path "nettle-#{version}"

dependency "gmp"

env = {
  "LDFLAGS" => "-L#{install_dir}/embedded/lib -I#{install_dir}/embedded/include ",
  "CFLAGS" => "-L#{install_dir}/embedded/lib -I#{install_dir}/embedded/include",
  "CPPFLAGS" => "-L#{install_dir}/embedded/lib -I#{install_dir}/embedded/include",
  "LD_RUN_PATH" => "#{install_dir}/embedded/lib",
  "LIBS" => "-lcrypto -lpthread -ldl"
}

build do
  command ["./configure",
           "--enable-shared", 
           "--disable-assembler",
           "--prefix=#{install_dir}/embedded",
  ], :env => env
  command "make", :env => env
  command "make install"

end
