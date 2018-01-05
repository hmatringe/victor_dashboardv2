require 'faker'

User.where(admin: false).destroy_all
klasses = [ Update, Project, Step, Stream ]
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



p "creating projects"
p1 = Project.create name: "SH2030"
p2 = Project.create name: "SAP"
p3 = Project.create name: "INFRA"

p "creating steps"
s1 = Step.create name: "SH2030 A", project: p1#, start_date: Date.parse("2017-01-30"), end_date: Date.parse("2017-03-04")
s2 = Step.create name: "SH2030 B", project: p1#, start_date: Date.parse("2017-03-05"), end_date: Date.parse("2017-04-05")
s3 = Step.create name: "SH2030 C", project: p1#, start_date: Date.parse("2017-04-01"), end_date: Date.parse("2017-07-15")
s4 = Step.create name: "SAP A", project: p2#, start_date: Date.parse("2017-04-01"), end_date: Date.parse("2017-06-15")
s5 = Step.create name: "SAP B", project: p2#, start_date: Date.parse("2017-06-01"), end_date: Date.parse("2017-08-15")
s6 = Step.create name: "INFRA A", project: p3#, start_date: Date.parse("2017-12-01"), end_date: Date.parse("2018-01-15")
# old
# step1 = Step.create name: "PJ2050 Phase B", sort_weight: 1, start_date: "2017-12-04", end_date: "2018-06-30", status: "status1"
# step2 = Step.create name: "SAP Cadrage", sort_weight: 1, start_date: "2017-11-01", end_date: "2018-01-31", status: "status2"



p "creating streams"
a = Stream.create title: "Chantier A", description: "Loremp ipsum - description manquante", start_date: Date.parse("2017-12-04"), end_date_forecast: Date.parse("2018-06-03"), owner: frederic, step: s1
b = Stream.create title: "Chantier B", description: "Loremp ipsum - description manquante", start_date: Date.parse("2017-12-04"), end_date_forecast: Date.parse("2018-06-03"), owner: frederic, step: s1
c = Stream.create title: "Chantier C", description: "Loremp ipsum - description manquante", start_date: Date.parse("2017-12-04"), end_date_forecast: Date.parse("2018-06-03"), owner: frederic, step: s1
d = Stream.create title: "Chantier D", description: "Loremp ipsum - description manquante", start_date: Date.parse("2017-12-04"), end_date_forecast: Date.parse("2018-06-03"), owner: frederic, step: s2
e = Stream.create title: "Chantier E", description: "Loremp ipsum - description manquante", start_date: Date.parse("2017-12-04"), end_date_forecast: Date.parse("2018-06-03"), owner: frederic, step: s2
f = Stream.create title: "Chantier F", description: "Loremp ipsum - description manquante", start_date: Date.parse("2017-12-04"), end_date_forecast: Date.parse("2018-06-03"), owner: frederic, step: s3
g = Stream.create title: "Chantier G", description: "Loremp ipsum - description manquante", start_date: Date.parse("2017-12-04"), end_date_forecast: Date.parse("2018-06-03"), owner: frederic, step: s4
h = Stream.create title: "Chantier H", description: "Loremp ipsum - description manquante", start_date: Date.parse("2017-12-04"), end_date_forecast: Date.parse("2018-06-03"), owner: frederic, step: s4
i = Stream.create title: "Chantier I", description: "Loremp ipsum - description manquante", start_date: Date.parse("2017-12-04"), end_date_forecast: Date.parse("2018-06-03"), owner: frederic, step: s5
j = Stream.create title: "Chantier J", description: "Loremp ipsum - description manquante", start_date: Date.parse("2017-12-04"), end_date_forecast: Date.parse("2018-06-03"), owner: frederic, step: s6
#  old
# stream1 = Stream.create title: "Opérations", description: "Loremp ipsum - description manquante", start_date: Date.parse("2017-12-04"), end_date_forecast: Date.parse("2018-06-03"), owner: frederic, scope: step1
# stream2 = Stream.create title: "Ressources Humaines", description: "Loremp ipsum - description manquante", start_date: Date.parse("2017-12-04"), end_date_forecast: Date.parse("2018-06-03"), owner: frederic, scope: step1
# stream3 = Stream.create title: "Commercialisation", description: "Loremp ipsum - description manquante", start_date: Date.parse("2017-12-04"), end_date_forecast: Date.parse("2018-02-04"), owner: frederic, scope: step1
# stream4 = Stream.create title: "Portefeuille international", description: "Loremp ipsum - description manquante", start_date: Date.parse("2017-12-04"), end_date_forecast: Date.parse("2018-06-03"), owner: frederic, scope: step1
# stream5 = Stream.create title: "Module Finance", description: "Loremp ipsum - description manquante", start_date: Date.parse("2017-11-01"), end_date_forecast: Date.parse("2018-01-31"), owner: frederic, scope: step2
# stream6 = Stream.create title: "Développement", description: "Loremp ipsum - description manquante", start_date: Date.parse("2017-11-01"), end_date_forecast: Date.parse("2018-01-31"), owner: frederic, scope: step2

p "creating updates"
# ze_date = Date.parse("2017-12-31")
ze_date = Date.today
date_format = '%d-%m-%Y'
ze_week = "Semaine " + ze_date.strftime('%W') + " du " + ze_date.beginning_of_week.strftime(date_format) + " au " + ze_date.end_of_week.strftime(date_format)

update1 = Update.create stream: a,
												update_week: ze_week,
												progress_status: "as_planned",
												main_progress: "nouveau dcommentaire",
												risks: "Désaccord sur les recommandations",
												next_steps: "Nomination équipe projet (en attente) Workshop avec l'équipe"

update2 = Update.create stream: b,
												update_week: ze_week,
												progress_status: "slight_delays",
												main_progress: "Réduction du scope en Etape A aux opportunités les plus réalistes / pertinentes",
												risks: "Délais d'organisation des workshops",
												next_steps: "Nomination équipe projet (en attente) Workshop"

update3 = Update.create stream: d,
												update_week: ze_week,
												progress_status: "delayed",
												main_progress: "Contributeurs à la définition du portefeuille cible identifiés",
												risks: "Aspects trading manquants – influence sur le portefeuille cible",
												next_steps: "Séances de travail en interne à planifier Lancer les invitations pour les workshops (en accord avec équipe projet)"

update6 = Update.create stream: f,
												update_week: ze_week,
												progress_status: "slight_delays",
												main_progress: "Choix du matériel",
												risks: "offres retardés des intégrateurs",
												next_steps: "Lancement RFP"
p "done"



# p "linking users to scopes => participants "

# Participant.create scope: scope1, user: hadrien
# Participant.create scope: scope1, user: frederic

# Participant.create scope: scope2, user: hadrien
# Participant.create scope: scope2, user: frederic
