require "awesome_print"
Inputpath = ARGV[0]

Tabs= File.open(Inputpath, "r").readlines

Outputpath="./out/"+File.basename(Inputpath)
ReverseTabs = File.open(Outputpath, "w")
Tabs.map { |e| e.strip  }
arr=[]
Tabs.each do |line|
	if(line.strip=="")
		arr.reverse.each do |l|
			ReverseTabs.write(l)
		end
		ReverseTabs.write(line)
		arr=[]

	else
		arr<<line
	end
end

unless arr.empty?
	arr.reverse.each do |l|
		unless l.end_with? "\n"
			l<<"\n"
		end
		ReverseTabs.write(l)
	end	
end

puts "done"
ReverseTabs.close