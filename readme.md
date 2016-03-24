My app BestBet is intended to help the user view archival NFL betting data to better inform their decisions when placing a bet on the big game. I would, however, like to place a disclaimer that the data generated from this app will have low correlation with individual games, but rather larger patterns witnessed in the NFL. For instance, this app has shown that teams are more likely to win at home vs away ('surprise surprise'), but more teams are likely to cover the betting line if they are on the road. These, of course are large generalizations from a significantly large data set and may not apply to real life. That is all for my disclaimer as an academic paper can be written about how to interpret these stats and why these stats are probably not that significant to begin with.

What this app does accomplish is revealing some information I, and hopefully some others, have long wondered about the fate of betting stats and how closely they resemble reality.

This app was created using Ruby on Rails. Content was loaded onto the pages using embedded ruby and regular HTML. All stylizing is a result of bootstrap. NFL archival regular season data was downloaded from repole.com(http://www.repole.com/sun4cast/data.html) and was used to seed the database. The app is deployed through Heroku.

The beta app (maybe even gamma) that is currently running, was only intended to prove that the data could be effectively analyzed and sorted using a web application. Future versions of this app will include improved data analysis and modeling, as well as the addition of more filters to sort the data. It will also need to be stylized for user experience.

To install, download this repo from github. Run bundle install and then rake db:create db:migrate and db:seed in the terminal. Otherwise it can be viewed on Heroku at https://craig-eisen-bestbet-rails.herokuapp.com/.

There are still a few unsolved problems, like how to filter the teams for more than one criteria. Also, what is an effective way to establish a dialogue between users using the information provided in the app.
