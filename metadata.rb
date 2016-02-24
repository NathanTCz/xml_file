name 'xml_file'
version '0.1'
maintainer 'Ranjib Dey'
maintainer_email 'ranjib@linux.com'
license 'Apache 2.0'
description 'Provides xml_file resource-provider'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))

%w(ubuntu debian redhat centos fedora oracle suse freebsd openbsd mac_os_x mac_os_x_server windows aix).each do |os|
  supports os
end
