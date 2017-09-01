module OxyLogger
	module SaveToFile
		
		def self.save_to_file text
			File.open("text.txt" , "a") do  |f|
			    f.print("#{text}\n")
		    end
			puts "все ок, твоё дерьмо в файле "

		end
		
		
	end
end