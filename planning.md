### Planning

It would be impractical to try to wrap a complex distributed system like this into a single system model
for this project, so my plan is to break this architecture into core components, define specifications for
said components, and model them using the tools mentioned above. For example, the distinct roles
could potentially be modeled separately. An agent needs to constantly listen for requests from the
satellite and be able to access and send requested information back to that satellite about a host. A
satellite needs to listen for check commands from the master to execute checks, execute those checks,
and send the check results back up the chain. The master, of course, is quite a complex system in and of itself since it
handles all logical decision making that drives the action of the rest of the system. The master may be
the most interesting and vital component to formally model and verify, if components were to be
prioritized.
