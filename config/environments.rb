configure :production do
	if(ENV['DATABASE_URL'])
		db = URI.parse(ENV['DATABASE_URL'])
	else
		db = URI.parse('postgres://localhost/mydb')
	end

	ActiveRecord::Base.establish_connection(
			:adapter  => 'postgresql',
			:host     => db.host,
			:username => db.user,
			:password => db.password,
			:database => db.path[1..-1],
			:encoding => 'utf8'
	)
end
configure :test do
	ActiveRecord::Base.establish_connection(
			:adapter  => 'postgresql',
			:host     => 'localhost',
			:username => 'postgres',
			:database => 'travis_ci_test',
			:encoding => 'utf8'
	)
end