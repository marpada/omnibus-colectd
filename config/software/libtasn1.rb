name "libtasn1"
default_version "4.2"


source :url => "http://ftp.gnu.org/gnu/libtasn1/libtasn1-#{version}.tar.gz",
        :md5 => "414df906df421dee0a5cf7548788d153" # 4.2

relative_path "libtasn1-#{version}"


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
