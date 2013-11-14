class PrizeService
	require 'net/http'
	require 'prize_service/eligibility.rb'
	
	#PrizeService.getPrizesForCustomer(customerAccountNumber, customersChannelPackages)  #This is how it will be called, so implementing below as such..
	def self.getPrizesForCustomer(customerAccountNumber, customersChannelPackages)
		#  If the given account number is invalid your service should raise an invalid account number error.
		invalid_account_number = "Invalid Account Number ! !"
		raise invalid_account_number if !customerAccountNumber.is_a? Integer

		url = URI.parse('http://teamxhost/eligibility') #Defining the API url here

		param = {
  	 		'customer_id' => customerAccountNumber #customer ID will be sent to the url to request the validity
		}

		begin
   			response = Net::HTTP.post_form(url, param) #Requesting the API :expecting a successful response in a format ..eg { result: { eligibility: true } } 
   				if response[:result][:eligibility] == true
   					return Eligibility.eligibility(customersChannelPackages) # A place to calculate the eligibility given the channel info, since true is responded
   				else
   					return "Customer is not eligible for any prize" #because our request was responded false at this pt for eligibility
   				end
   			elsif response[:error]
   				return response[:error][:message] #One of the two messages expected here according to the spec
   			end
		rescue
   			return [] #  If the eligibility service fails for some other reason you should return an empty array.
		end
	end
end