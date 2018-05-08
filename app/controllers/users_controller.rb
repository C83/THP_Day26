class UsersController < ApplicationController
  def show
  	# On utilise find by avec la valeur de la clé id du paramètre
  	@this_user = User.find_by(params.permit(:id))
    @list_past_events_created = Array.new
    @list_future_events_created = Array.new
    @this_user.created_events.each do |event|
      if (event.date - Time.now > 0)
        # la date de l'évènement est future
        @list_future_events_created.push(event)
      else
        @list_past_events_created.push(event)
      end
    end

    @list_past_attended_events = Array.new
    @list_future_attended_events = Array.new
    @this_user.attended_events.each do |event|
      if (event.date - Time.now > 0)
        # la date de l'évènement est future
        @list_future_attended_events.push(event)
      else
        @list_past_attended_events.push(event)
      end
    end

  end
end
