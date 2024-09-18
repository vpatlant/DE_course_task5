#!/bin/bash
awk '{
	{
	 strings++ 
	 ip[$1]++
	 typs[substr($6,2)]++
	 urls[$7]++
	}	 
}
END{
	print "Отчет о логе веб-сервера"
	print "========================"
	print "Общее количество запросов:", strings
	print "Количество уникальных IP-адресов:" length(ip)
	print "Количество запросов по методам:"
	{
		for (typ in typs) print "\t" typs[typ], typ
	}
	{
		max=0
		top_url=""
		for (url in urls)
		{
			if (urls[url] > max)
			{
				max=urls[url]
				top_url=url
			}
		}		
		print "Самый популярный URL:", max, top_url
	}
}
' access.log > report.txt 

echo "Отчет сохранен в файл report.txt"


