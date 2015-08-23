# Q5pricetool
Application for Data Products class project - Additional documentation

**For the Q5tool Pitch Presentation**

The title slide is the first couple lines in Git Hub, it did not count against the 5 slides requested.

The plots render nicely in GitHub, but larger than they would appear on a normal page-fitted slide. I don't consider this a bad thing, other than I offered code in the markdown to show the plots as side-by-side, and this appears lost on GitHub. I will work on an RPubs version, but somehow in all this the account got corrupted. Fortunately, that was not required in the grading rubric.

**For the Q5tool App**

**Instructions:** The app is easy and is hosted on the shinyApps server, so clicking on the link should bring it up for everyone. The images and data are with the bundle on shinyApps as well as on the GitHub repo.

To use the app, notice the upper left hand corner sports a histogram that shows the overall distribution of prices in the listings dataset. This can also be considered a random sampling of all listings avaialable, and its shape and range may be reprentative to some degree of the population.  The asymmetric nature is due to a lower bound of 2010 vehicles and younger, and the fact that different modes to different trims and engines.

Look at the sidebar for steps 1, 2, and 3, and enough helpful text (hopefully) to make it self-explanatory. If you have a type of vehicle in mind, enter it and predict a price. The prediction is considered a good list price (with error of actual listings above and below).

*Step 1 notes:*

--The best price is a 12% discount, estimated by a lower bound prediction interval (although this will be directly linked to a predicted interval calculation in a later version).

--Arrows should step the Miles up and down 5000 miles, although any value can be entered. The year steps up and down one year, although you can enter with one decimal point, as this may affect the age and price.

*Step 2 notes:*

-Includes exploratory graphs of all kinds. It does require hitting the submit button to make the plot after making  changes.

--"Color" refers to plotting data points of any variable in color by its levels, not color of the vehicle.

*Step 3 notes.*

--To fit a line, you must first hit the calculate line button, then the plot button in 2 steps

--When you hit any of the submit-type buttons, the whole app is refreshed

--To avoid a fitted line on all plots, I calculate it separately and put it at the end.

--The fitted line can't be removed once applied. Shouldn't bother most users.


Sources: The picture I took myself, and data was collected myself, using various sources on the internet, dealer listings, etc. At this point, it is just data for a prototype.






