require 'faker'

User.where(admin: false).destroy_all
klasses = [ Update, Project, Participant, Scope ]
klasses.each do |k|
	k.destroy_all
end

p "destroyed classes"

p "creating users"

hadrien = User.create email:"hadrien@email.com", password: "123456", first_name: "Hadrien", last_name: "Matringe"
participant1 = User.create email: Faker::Internet.email, password: "123456", first_name: Faker::Name.first_name, last_name: Faker::Name.last_name
participant2 = User.create email: Faker::Internet.email, password: "123456", first_name: Faker::Name.first_name, last_name: Faker::Name.last_name
participant3 = User.create email: Faker::Internet.email, password: "123456", first_name: Faker::Name.first_name, last_name: Faker::Name.last_name
participant4 = User.create email: Faker::Internet.email, password: "123456", first_name: Faker::Name.first_name, last_name: Faker::Name.last_name
participant5 = User.create email: Faker::Internet.email, password: "123456", first_name: Faker::Name.first_name, last_name: Faker::Name.last_name

p "creating scopes"
scope1 = Scope.create name: "Scope A", ranking: "ranking A", start_date: Date.today, end_date: Date.today.at_beginning_of_month.next_month.next_month, status: "status1"
scope2 = Scope.create name: "Scope B", ranking: "ranking B", start_date: Date.yesterday, end_date: Date.today.at_beginning_of_month.next_month.next_month, status: "status2"

p "linking users to projects => participants "

Participant.create scope: scope1, user: hadrien
Participant.create scope: scope1, user: participant1
Participant.create scope: scope1, user: participant2
Participant.create scope: scope1, user: participant3
Participant.create scope: scope1, user: participant4
Participant.create scope: scope1, user: participant5

Participant.create scope: scope2, user: hadrien
Participant.create scope: scope2, user: participant1
Participant.create scope: scope2, user: participant3
Participant.create scope: scope2, user: participant5

p "creating projects"

project1 = Project.create title: "project1", description: "Tant, à nous voir marcher avec un tel visage, Les plus épouvantés reprenaient de courage.", start_date: (Date.today - 5), end_date_forecast: Date.today.at_beginning_of_month.next_month, end_date_actual: Date.today.at_beginning_of_month.next_month, owner: participant1, scope: scope1
project2 = Project.create title: "project2", description: "Pavta rei nipsonano mematamem onanopsin.", start_date: (Date.today - 3), end_date_forecast: Date.yesterday.at_beginning_of_month.next_month, end_date_actual: Date.today.at_beginning_of_month.next_month, owner: participant2, scope: scope2
project3 = Project.create title: "project3", description: "Ainsi font font font les petites marionnettes.", start_date: Date.today, end_date_forecast: Date.today.at_beginning_of_month.next_month, end_date_actual: Date.today.at_beginning_of_month.next_month, owner: participant2, scope: scope1
project4 = Project.create title: "project4", description: "Nulla dies sine linea.", start_date: (Date.today - 16), end_date_forecast: Date.yesterday.at_beginning_of_month.next_month, end_date_actual: Date.today.at_beginning_of_month.next_month.next_month, owner: participant4, scope: scope2
project5 = Project.create title: "project5", description: "Nous partîmes cinq cents ; mais par un prompt (1) renfort, Nous nous vîmes trois mille en arrivant au port", start_date: (Date.today - 67), end_date_forecast: Date.today.at_beginning_of_month.next_month.next_month, end_date_actual: Date.today.at_beginning_of_month.next_month, owner: participant4, scope: scope1

p "creating updates"
p "voila"