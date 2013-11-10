Day 33: Lab - RSVP app
Crank this one out and try to finish before lunch! Like Sahil said, ship small code. Don't worry about things like user logins.
 
You should have (but are not limited to) the following pages:
 
A user should be able to create an event. - /events/new
They should be able to invite new users to that event - /events/1/invites/new
A user should be able to rsvp to the event - /invites/1/edit 

[I changed requirements and put RSVP page here, to edit all invites for 1 event: /events/1. 
Did NOT use invites#edit at all!]
 
          Prefix Verb   URI Pattern                             Controller#Action
            root GET    /                                       events#index
new_event_invite GET    /events/:event_id/invites/new(.:format) invites#new
          events GET    /events(.:format)                       events#index
                 POST   /events(.:format)                       events#create
       new_event GET    /events/new(.:format)                   events#new
      edit_event GET    /events/:id/edit(.:format)              events#edit
           event GET    /events/:id(.:format)                   events#show
                 PATCH  /events/:id(.:format)                   events#update
                 PUT    /events/:id(.:format)                   events#update
                 DELETE /events/:id(.:format)                   events#destroy
         invites POST   /invites(.:format)                      invites#create
     edit_invite GET    /invites/:id/edit(.:format)             invites#edit
          invite GET    /invites/:id(.:format)                  invites#show
                 PATCH  /invites/:id(.:format)                  invites#update
                 PUT    /invites/:id(.:format)                  invites#update