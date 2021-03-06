##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "StorageTek-NAS" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-06-04
version "0.1"
description "StorageTek Network Attached Storage (NAS) - StorageTek was founded in 1969 by four former IBM engineers: Jesse Awieda, Juan Rodriguez, Thomas S. Kavanagh, Zoltan Herger. StorageTek was puchased in 2005 by Sun Microsystems, Inc which was later purchased by Oracle Corporation in 2010."
website "http://www.oracle.com/technetwork/documentation/oracle-unified-ss-193371.html"

# More Info #
# http://en.wikipedia.org/wiki/Storage_Technology_Corporation

# ShodanHQ results as at 2011-06-04 #
# 12 for StorageTek-HTTPD
#  5 for StorageTek-HTTPD 5320 -5320C NAS
#  4 for StorageTek-HTTPD 5320C NAS
#  1 for StorageTek-HTTPD 5310 NAS



# Matches #
matches [

# Aggressive # /sedona.jnlp # Title
{ :url=>"/sedona.jnlp", :text=>'<title>Sun StorageTek NAS OS Web Admin</title>' },

]

# Passive #
def passive
	m=[]

	# HTTP Server Header
	if @headers["server"] =~ /^StorageTek-HTTPD\/[^\s]+ \([^\s]+ NAS\)$/

		# Version Detection
		m << { :version=>@headers["server"].scan(/^StorageTek-HTTPD\/([^\s]+) \([^\s]+ NAS\)$/) }

		# Model Detection
		m << { :model=>@headers["server"].scan(/^StorageTek-HTTPD\/[^\s]+ \(([^\s]+) NAS\)$/) }

	end

	# Return passive matches
	m
end

end

