namespace :lms do

  task install: :environment do
    Rake::Task['db:migrate'].invoke
    Rake::Task['db:seed'].invoke
    puts 'System Installed'
  end

end
