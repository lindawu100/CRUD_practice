namespace :db do
    desc 'Reset counter cache!'
    task :reset_counter => :environment do
        Candidate.all.each do |candidate|
            Candidate.reset_counters(candidate.id, :votelogs)
        end
    end
end