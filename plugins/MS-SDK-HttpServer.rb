##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "MS-SDK-HttpServer" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-15
version "0.1"
description "The Microsoft .NET Micro Framework Platform SDK is a powerful and flexible platform for rapidly creating embedded device firmware with Microsoft Visual Studio. This plugin identifies servers based on the HttpServer sample provided with the SDK."
website "http://msdn.microsoft.com/en-us/library/ee434092.aspx"
# More Info: http://msdn.microsoft.com/en-us/library/ee436350.aspx

# ShodanHQ results as at 2011-05-15 #
# 39,532 for MS-SDK-HttpServer



# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	m << { :version=>@headers["server"].scan(/^MS-SDK-HttpServer\/([\d\.]+)$/) } if @headers["server"] =~ /^MS-SDK-HttpServer\/([\d\.]+)$/

	# Return passive matches
	m
end

end

