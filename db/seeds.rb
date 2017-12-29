require 'faker'

User.where(admin: false).destroy_all
klasses = [ Update, Project, Participant, Scope ]
klasses.each do |k|
	k.destroy_all
end

p "destroyed classes"

p "creating users"

hadrien = User.create email:"hadrien@email.com", password: "123456", first_name: "Hadrien", last_name: "Matringe"
frederic = User.create email: "geurts.frederic@bcg.com", password: "123456", first_name: "Frederic", last_name: "Geurts"
# participant2 = User.create email: Faker::Internet.email, password: "123456", first_name: Faker::Name.first_name, last_name: Faker::Name.last_name
# participant3 = User.create email: Faker::Internet.email, password: "123456", first_name: Faker::Name.first_name, last_name: Faker::Name.last_name
# participant4 = User.create email: Faker::Internet.email, password: "123456", first_name: Faker::Name.first_name, last_name: Faker::Name.last_name
# participant5 = User.create email: Faker::Internet.email, password: "123456", first_name: Faker::Name.first_name, last_name: Faker::Name.last_name

p "creating scopes"
scope1 = Scope.create name: "PJ2050 Phase B", sort_weight: 1, start_date: "2017-12-04", end_date: "2018-06-30", status: "status1"
scope2 = Scope.create name: "SAP Cadrage", sort_weight: 1, start_date: "2017-11-01", end_date: "2018-01-31", status: "status2"
# scope1 = Scope.create name: "Scope A", ranking: "ranking A", start_date: Date.today, end_date: Date.today.at_beginning_of_month.next_month.next_month, status: "status1"
# scope2 = Scope.create name: "Scope B", ranking: "ranking B", start_date: Date.yesterday, end_date: Date.today.at_beginning_of_month.next_month.next_month, status: "status2"

p "linking users to scopes => participants "

Participant.create scope: scope1, user: hadrien
Participant.create scope: scope1, user: frederic
# Participant.create scope: scope1, user: participant2
# Participant.create scope: scope1, user: participant3
# Participant.create scope: scope1, user: participant4
# Participant.create scope: scope1, user: participant5

Participant.create scope: scope2, user: hadrien
Participant.create scope: scope2, user: frederic
# Participant.create scope: scope2, user: participant3
# Participant.create scope: scope2, user: participant5

p "creating projects"

# project1 = Project.create title: "project1", description: "Tant, à nous voir marcher avec un tel visage, Les plus épouvantés reprenaient de courage.", start_date: (Date.today - 5), end_date_forecast: Date.today.at_beginning_of_month.next_month, end_date_actual: Date.today.at_beginning_of_month.next_month, owner: participant1, scope: scope1
# project2 = Project.create title: "project2", description: "Pavta rei nipsonano mematamem onanopsin.", start_date: (Date.today - 3), end_date_forecast: Date.yesterday.at_beginning_of_month.next_month, end_date_actual: Date.today.at_beginning_of_month.next_month, owner: participant2, scope: scope2
# project3 = Project.create title: "project3", description: "Ainsi font font font les petites marionnettes.", start_date: Date.today, end_date_forecast: Date.today.at_beginning_of_month.next_month, end_date_actual: Date.today.at_beginning_of_month.next_month, owner: participant2, scope: scope1
# project4 = Project.create title: "project4", description: "Nulla dies sine linea.", start_date: (Date.today - 16), end_date_forecast: Date.yesterday.at_beginning_of_month.next_month, end_date_actual: Date.today.at_beginning_of_month.next_month.next_month, owner: participant4, scope: scope2
# project5 = Project.create title: "project5", description: "Nous partîmes cinq cents ; mais par un prompt (1) renfort, Nous nous vîmes trois mille en arrivant au port", start_date: (Date.today - 67), end_date_forecast: Date.today.at_beginning_of_month.next_month.next_month, end_date_actual: Date.today.at_beginning_of_month.next_month, owner: participant4, scope: scope1
project1 = Project.create title: "Opérations", description: "Loremp ipsum - description manquante", start_date: Date.parse("2017-12-04"), end_date_forecast: Date.parse("2018-06-03"), owner: frederic, scope: scope1
project2 = Project.create title: "Ressources Humaines", description: "Loremp ipsum - description manquante", start_date: Date.parse("2017-12-04"), end_date_forecast: Date.parse("2018-06-03"), owner: frederic, scope: scope1
project3 = Project.create title: "Commercialisation", description: "Loremp ipsum - description manquante", start_date: Date.parse("2017-12-04"), end_date_forecast: Date.parse("2018-02-04"), owner: frederic, scope: scope1
project4 = Project.create title: "Portefeuille international", description: "Loremp ipsum - description manquante", start_date: Date.parse("2017-12-04"), end_date_forecast: Date.parse("2018-06-03"), owner: frederic, scope: scope1
project5 = Project.create title: "Module Finance", description: "Loremp ipsum - description manquante", start_date: Date.parse("2017-11-01"), end_date_forecast: Date.parse("2018-01-31"), owner: frederic, scope: scope2
project6 = Project.create title: "Développement", description: "Loremp ipsum - description manquante", start_date: Date.parse("2017-11-01"), end_date_forecast: Date.parse("2018-01-31"), owner: frederic, scope: scope2

p "creating updates"
ze_date = Date.parse("2017-12-11")
date_format = '%d-%m-%Y'
ze_week = "Semaine " + ze_date.strftime('%W') + " du " + ze_date.beginning_of_week.strftime(date_format) + " au " + ze_date.end_of_week.strftime(date_format)

update1 = Update.create project: project1,
												update_week: ze_week,
												progress_status: "as planned",
												main_progress: "nouveau dcommentaire",
												risks: "Désaccord sur les recommandations",
												next_steps: "Nomination équipe projet (en attente)
Workshop avec l'équipe"

update2 = Update.create project: project2,
												update_week: ze_week,
												progress_status: "slight delays",
												main_progress: "Réduction du scope en Etape A aux opportunités les plus réalistes / pertinentes",
												risks: "Délais d'organisation des workshops",
												next_steps: "Nomination équipe projet (en attente)
Workshop"

update3 = Update.create project: project3,
												update_week: ze_week,
												progress_status: "delayed",
												main_progress: "Contributeurs à la définition du portefeuille cible identifiés",
												risks: "Aspects trading manquants – influence sur le portefeuille cible",
												next_steps: "Séances de travail en interne à planifier 
Lancer les invitations pour les workshops (en accord avec équipe projet)"

# update4 = Update.create project: project4, update_week: ze_week

# update5 = Update.create project: project5, update_week: ze_week

update6 = Update.create project: project6,
												update_week: ze_week,
												progress_status: "slight delays",
												main_progress: "Choix du matériel",
												risks: "offres retardés des intégrateurs",
												next_steps: "Lancement RFP"
p "done"