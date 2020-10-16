/*
 STEP ONE: Add a new park with the following data:
  ------------------------------
  name: Ohiopyle State Park
  location: Pennsylvania
  establish date: 1965-01-01
  area: 19052
  visitors: 1000000
  description: Ohiopyle State Park is a Pennsylvania state park on 19,052 acres in Dunbar, Henry Clay and Stewart Townships, Fayette County, Pennsylvania in the United States. The focal point of the park is the more than 14 miles of the Youghiogheny River Gorge that passes through the park.
  ------------------------------
*/
Insert Into park (name, location, establish_date, area, visitors, description)
	Values('Ohiopyle State Park', 'Pennsylvania', '1965-01-01', 19052, 1000000, 'Ohiopyle State Park is a Pennsylvania state park on 19,052 acres in Dunbar, Henry Clay and Stewart Townships, Fayette County, Pennsylvania in the United States. The focal point of the park is the more than 14 miles of the Youghiogheny River Gorge that passes through the park.')

Select * from park 

/*
  STEP TWO: You just found out that there was an error with the park data. Please update the park visitors to 1.5 million anually.
*/

Update park 
	Set visitors = 1500000
	Where park.name = 'Ohiopyle State Park'

/*
 STEP THREE: Insert new campground with the following data:
  ------------------------------------------------------------
  park_id: 4 (this should be the id of the new park you just added)
  name: Youghiogheny
  open_from_mm: 01
  open_to_mm: 12
  daily_fee: 95.00
  ------------------------------------------------------------
*/
Insert Into campground (park_id, name, open_from_mm, open_to_mm, daily_fee)
	Values (4, 'Youghiogheny', 01, 12, 95.00)

Select * from campground
/*
 STEP FOUR: Insert 3 new sites with the following data:
 ------------------------------------------------------------
  site_number: 623, campground_id: 8
  site_number: 624, campground_id: 8
  site_number: 625, campground_id: 8
 ------------------------------------------------------------

 > campground_id 8 should be the id of the campground you just added 'Youghiogheny'

*/
Insert Into site (campground_id, site_number)
	Values (8, 623),
		   (8, 624),
		   (8, 625)

Select * from site 
/*
 STEP FIVE: Insert 3 reservations, 1 for each site with the following data:
------------------------------------------------------------------------------------
  site_id: 52, name: Wayne Family, from_date: today + 10 days, to_date: today + 20 days
  site_id: 53, name: Parker Family, from_date: today + 11 days, to_date: today + 20 days
  site_id: 54, name: Kent Family, from_date: today + 12 days, to_date: today + 20 days
------------------------------------------------------------------------------------

*/
select * from reservation where name = 'wayne family'

Insert into reservation (site_id, name, from_date, to_date)
	Values (52, 'Wayne Family', DATEADD(DAY, 10, '10/16/2020'), DATEADD(DAY, 20, '10/16/2020')),
		   (53, 'Parker Family', DATEADD(DAY, 11, '10/16/2020'), DATEADD(DAY, 20, '10/16/2020')),
		   (54, 'Kent Family', DATEADD(DAY, 12, '10/16/2020'), DATEADD(DAY, 20, '10/16/2020'))


/*
 STEP SIX: The Wayne Family called and asked if they could change their reservation to today. Update the from_date to today and the to_date to a week from today.

 */
 Update reservation 
	Set from_date = '10/16/2020', to_date = DATEADD(DAY, 7, '10/16/2020')
	Where site_id = 52



/*
 STEP SEVEN: The Kent family called and they would like to cancel their reservation. Delete the reservation for Kent Family.

*/

Delete from reservation where
	site_id = 54 and name = 'Kent Family'

	select * from reservation 