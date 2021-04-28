Action()
{

	web_set_sockets_option("SSL_VERSION", "TLS1.1");

	web_url("fwlink", 
		"URL=https://go.microsoft.com/fwlink/?LinkId=251136", 
		"Resource=0", 
		"RecContentType=text/xml", 
		"Referer=", 
		"Snapshot=t1.inf", 
		"Mode=HTML", 
		LAST);

	web_url("79755143", 
		"URL=https://blog.csdn.net/qq_37674858/article/details/79755143", 
		"Resource=0", 
		"RecContentType=text/html", 
		"Referer=", 
		"Snapshot=t2.inf", 
		"Mode=HTML", 
		LAST);

	return 0;
}