name 'collectd'
maintainer 'David Pando'
homepage 'http://www.foundryhq.com/'

install_dir     "./local/opt/collectd"
build_version   Omnibus::BuildVersion.semver
build_iteration 1

# collectd dependencies/components
# dependency 'somedep'

# version manifest file
#dependency 'version-manifest'
dependency 'collectd'

exclude '\.git*'
exclude 'bundler\/git'
