-- CAMPGROUND TABLE
-----------------------------------------------

-- select name and daily fee of all campgrounds
Select name, daily_fee
	From campground

-- select name and daily fee of all campgrounds ordered by campground name
Select name, daily_fee
	From campground
	Order By name

-- select name, open from month, open to month, and daily fee of the campgrounds where daily fee is less than $100
Select name, open_from_mm, open_to_mm, daily_fee
	From campground
	Where daily_fee < 100.00

-- select name and daily fee of the campgrounds where the campground is open all year long
Select name, daily_fee
	From campground
	Where open_from_mm = 1 AND open_to_mm = 12


-- PARK TABLE
-----------------------------------------------

-- select name and description of all parks order by established date in descending order
Select name, description, establish_date
	From park
	Order By establish_date desc

-- select name and description of all parks in Ohio
Select name, description
	From park
	Where location = 'Ohio'


-- select name and description of all parks NOT in Ohio
Select name, description
	From park
	Where location != 'Ohio'

-- select the total number of visitors for all parks
Select SUM(visitors)
	From park

-- select the average number of visitors for all parks
Select AVG(visitors)
	From park


-- SITE TABLE
-----------------------------------------------

-- select all columns from site that have utilities hook up and order by max RV length with the largest coming first
Select *
	From site
	Where utilities = 1
	Order By max_rv_length desc

-- select total number of sites that have utilities hook up
Select COUNT(*)
	From site
	Where utilities = 1


-- RESERVATION TABLE
-----------------------------------------------

-- select reservation id, site id, name, from date, to date of the reservations where the checkin date is between the first and last day of the current month (hard coded month is ok)
Select reservation_id, site_id, name, from_date, to_date
	From reservation
	Where from_date BETWEEN '2020-10-01' AND '2020-10-31'

select * from reservation
-- select all columns from reservation where name includes 'Reservation'
Select *
	From reservation
	Where name LIKE '%Reservation%'

	select * from reservation

-- select the total number of reservations in the reservation table
Select COUNT(reservation_id)
	From reservation

-- select reservation id, site id, name of the reservations where site id is in the list 9, 20, 24, 45, 46
Select reservation_id, site_id, name
	From reservation
	Where site_id IN (9, 20, 24, 45, 46)

-- select the date and number of reservations for each date orderd by from_date in ascending order
Select from_date, COUNT(reservation_id) AS NumberOfReservations
	From reservation
	Group By from_date
	Order By from_date