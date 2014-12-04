name "collectd"
default_version "5.4.1"


source :url => "https://collectd.org/files/collectd-#{version}.tar.gz",
       :md5 => "6514ab3f7fd2135d2713f1ab25068841"

relative_path "collectd-#{version}"

dependency "libgcrypt"
dependency "libgpg-error"
dependency "gnutls"
dependency "curl"
dependency "libidn"
dependency "rtmpdump"
dependency "openssl"
dependency "zlib"
dependency "libxml2"

env = {
  "LDFLAGS" => "-L#{install_dir}/embedded/lib -I#{install_dir}/embedded/include",
  "CFLAGS" => "-L#{install_dir}/embedded/lib -I#{install_dir}/embedded/include",
  "LD_RUN_PATH" => "#{install_dir}/embedded/lib"
}

build do
  command ["./configure",
           "--prefix=#{install_dir}/embedded",
          "--disable-python",
  ] , :env => env 
  command "make"
  command "make install"
  command "test -d #{install_dir}/sbin || mkdir -p #{install_dir}/sbin"
  mkdir "#{install_dir}/embedded/etc/init.d/"

  mkdir "#{install_dir}/embedded/var/lib/"
  erb :source => "init/#{Ohai['platform_family']}/collectd.erb",
      :dest => "#{install_dir}/embedded/etc/init.d/collectd",
      :vars => { :install_dir =>  install_dir},
      :mode => 0755
  Dir.glob("#{install_dir}/embedded/sbin/collectd*").each do |binary|
    command "ln -s #{binary} #{install_dir}/sbin/"
  end

end
