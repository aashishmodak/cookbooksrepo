name 'LAMPStack_Install'
maintainer 'Rajeshwari Makond'
maintainer_email 'rajeshwari.makond@reancloud.com'
license 'All Rights Reserved'
description 'Installs/Configures LAMStack_Install'
long_description 'Installs/Configures LAMStack_Install'
version '1.1.1'
chef_version '>= 12.1' if respond_to?(:chef_version)

# The `issues_url` points to the location where issues for this cookbook are
# tracked.  A `View Issues` link will be displayed on this cookbook's page when
# uploaded to a Supermarket.
#
issues_url 'https://github.com/aashishmodak/cookbooksrepo/LAMPStack_Install/issues'

# The `source_url` points to the development repository for this cookbook.  A
# `View Source` link will be displayed on this cookbook's page when uploaded to
# a Supermarket.
#
source_url 'https://github.com/aashishmodak/cookbooksrepo/LAMPStack_Install'

depends 'mysql', '~> 8.0'
