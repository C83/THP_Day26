class Event < ApplicationRecord
	validates :description, presence: true
	validates :date, presence: true
  	validates :place, presence: true

	# creator sera le nom de la variable d'un event, en référence à user
	# classe name permet d'indiquer que user est la classe, non pas creator
	# foreign_key: 'creator_id' Il n'est pas nécessaire d'indiquer le nom de la clé étrangère, 
	# il la construit tout seul à partir du nom de la variable. 
	# Cependant, il faut créer la colonne en question dans la DB
	belongs_to :creator, class_name:'User'
	
	# Idem que pour User, voir User
	has_and_belongs_to_many :attendees, 
		class_name: 'User', 
		join_table: 'attendees_attended_events',
		foreign_key: "attended_event_id",
		association_foreign_key: "attendee_id"
end
