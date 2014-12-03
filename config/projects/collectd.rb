name 'collectd'
maintainer 'david.pando@foundryhq.com'
homepage 'https://collectd.org/'

install_dir     "/opt/collectd"
build_version   "5.4.1"
build_iteration 1

# collectd dependencies/components
# dependency 'somedep'

# version manifest file
#dependency 'version-manifest'
dependency 'collectd'

exclude '\.git*'
exclude 'bundler\/git'
