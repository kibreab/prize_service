	class PrizeService::Eligibility
		def self.eligibility(channels)
			#The channel packages are SPORTS, MOVIES, GOSSIP and KIDS

			only_kids_channel = (channels.count == 1 and channels.first.eql?('KIDS')) 
			return "Customer is not eligible for any prize" if only_kids_channel #A customer eligible for a prize with only the kids package doesn't get to choose anything. 

		 	if channels.include?("SPORTS") 
				if channels.include?('MOVIES')
					return ["FREE SPORTING EVENT TICKETS", "FREE MOVIE TICKETS"] #A customer eligible for a prize with the sports and movies package gets to choose between a sporting event ticket and a movie ticket.
				else
					return ["FREE SPORTING EVENT TICKETS"] #here's an issue.. the customer could have 'GOSSIP' channel as well at this pt with 'SPORTS', but the spec didn't mention any specific return so this could do 
				end
			end

			return ["FREE MOVIE TICKETS"] if channels.include?('MOVIES') || channels.include?('GOSSIP') #If we arrive here, probably channels doesn't include 'SPORTS', so it's fine
			return []
		end
	end