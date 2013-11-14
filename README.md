# PrizeService

This is a rubygem developed by Kibreab Tekle Awono. The gem is a task that delivers eligibility and prize information requesting a certain API and provide to a team who needs it. 

## Installation

Add this line to your application's Gemfile:

    gem 'prize_service'

And then execute:

    $ bundle

Or you can install it yourself as:

    $ gem install prize_service

## Usage

 I have printed here the console output from local machine that I could print while testing the app. I hope this helps.
 *** This is as per the requirement, for example the first line is supposed to raise an invalid account number exception while passing a string instead of int.

 1.9.3-p448 :030 > reload!
Reloading...
 => true 
1.9.3-p448 :031 > PrizeService.getPrizesForCustomer('11',["SPORTS", "MOVIES"])
RuntimeError: Invalid Account Number ! !
	from /Users/kibreab/rails/banner_control/app/models/prize_service.rb:10:in `getPrizesForCustomer'
	from (irb):31
	from /Users/kibreab/.rvm/gems/ruby-1.9.3-p448/gems/railties-4.0.0.beta1/lib/rails/commands/console.rb:88:in `start'
	from /Users/kibreab/.rvm/gems/ruby-1.9.3-p448/gems/railties-4.0.0.beta1/lib/rails/commands/console.rb:9:in `start'
	from /Users/kibreab/.rvm/gems/ruby-1.9.3-p448/gems/railties-4.0.0.beta1/lib/rails/commands.rb:64:in `<top (required)>'
	from bin/rails:4:in `require'
	from bin/rails:4:in `<main>'
1.9.3-p448 :032 > PrizeService.getPrizesForCustomer(11,["SPORTS", "MOVIES"])
 => ["FREE SPORTING EVENT TICKETS", "FREE MOVIE TICKETS"] 
1.9.3-p448 :033 > PrizeService.getPrizesForCustomer(11,["SPORTS"])
 => ["FREE SPORTING EVENT TICKETS"] 
1.9.3-p448 :034 > PrizeService.getPrizesForCustomer(11,["KIDS"])
 => "Customer is not eligible for any prize" 
1.9.3-p448 :035 > PrizeService.getPrizesForCustomer(11,["MOVIES"])
 => ["FREE MOVIE TICKETS"] 
1.9.3-p448 :036 > PrizeService.getPrizesForCustomer(11,["GOSSIP"])
 => ["FREE MOVIE TICKETS"] 
1.9.3-p448 :037 > PrizeService.getPrizesForCustomer(11,["GOSSIP", "KIDS"])
 => ["FREE MOVIE TICKETS"] 
1.9.3-p448 :038 > PrizeService.getPrizesForCustomer(11,["GOSSIP", "MOVIES"])
 => ["FREE MOVIE TICKETS"] 
1.9.3-p448 :039 > PrizeService.getPrizesForCustomer(11,["GOSSIP", "SPORTS"])
 => ["FREE SPORTING EVENT TICKETS"] 

 my app returns the following, response being { error: { code: 'technical_failure', message: 'Shit went down' } }
1.9.3-p448 :042 > PrizeService.getPrizesForCustomer(11,["GOSSIP", "SPORTS"])
 => "Shit went down" 

	my app returns the following, response being { error: { code: 'invalid_account_number', message: 'The given customer account number wasnt valid' } }
 1.9.3-p448 :044 > PrizeService.getPrizesForCustomer(11,["GOSSIP", "SPORTS"])
 => "The given customer account number wasnt valid" 


