name "libgcrypt"
#default_version "1.6.2"  ----> See https://github.com/collectd/collectd/issues/632
default_version "1.5.3"


source :url => "ftp://ftp.gnupg.org/gcrypt/libgcrypt/libgcrypt-#{version}.tar.bz2",
#       :md5 => "b54395a93cb1e57619943c082da09d5f"   ---> 1.6.2
       :md5 => "993159b2924ae7b0e4eaff0743c2db35"

relative_path "libgcrypt-#{version}"

dependency "libgpg-error"

env = {
  "LDFLAGS" => "-L#{install_dir}/embedded/lib -I#{install_dir}/embedded/include",
  "CFLAGS" => "-L#{install_dir}/embedded/lib -I#{install_dir}/embedded/include",
  "LD_RUN_PATH" => "#{install_dir}/embedded/lib"
}

build do
  command ["./configure",
           "--prefix=#{install_dir}/embedded",
          "--with-gpg-error-prefix=#{install_dir}/embedded",
  ]
  command "make"
  command "make install"

end
