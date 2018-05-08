class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # created event sera le nom de la variable d'un user, en référence à l'event
  # class_name : il ne faut pas aller voir la classe created event mais la classe Event
  # dependant : lorsque un  user sera détruit, les événements qui lui sont rattachés seront aussi détruits
  # foreignkey : on indique le nom de la clé étrangère dans la classe Event.
  has_many :created_events, class_name: 'Event', dependent: :destroy , foreign_key: 'creator_id'

  has_and_belongs_to_many :attended_events, 
  	# Ca désigne le model event, attented event est que le nom de l'attribut
  	class_name: 'Event', 
  	# De base, la table de jointure est construite à partir des noms des models
	# Pour spécifier une autre table, c'est la commande suivante :
	join_table: 'attendees_attended_events',
	# On indique que dans la table de jointure, user est désigné par attendee_id
	foreign_key: "attendee_id",
	# On indique que dans la table de jointure,  l'autre extrémité de l'association 
	# est désigné par attented_event_id 
	association_foreign_key: "attended_event_id"
end
