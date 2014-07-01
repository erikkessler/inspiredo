namespace :advance do
  desc "Decrease days left"
  task :contracts => :environment do
    cons = Contract.where("state != ?", 1)
    cons.each do |con|
      if con.days_left == 0
        con.state = 1
        con.activities.each do |act|
          act.state = 1
          act.save
        end
	FeedItem.create(content: "#{con.name} expired!", user_id: con.user_id)
        
      else
        con.days_left -= 1
      end

      con.save!
    end
    Rails.logger.debug "#{DateTime.current} - advanced contracts"
  end

  desc "Increase days active"
  task :activities => :environment do
    acts = Activity.where("state != ?", 1)
    acts.each do |act|
      act.days_active += 1
      act.complete_today = false
      act.save
    end
  end
end
