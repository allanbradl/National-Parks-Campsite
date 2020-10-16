-- select the park name, campground name, open_from_mm, open_to_mm & daily_fee ordered by park name and then campground name
SELECT park.name AS park_name, campground.name AS campground_name, campground.open_from_mm AS opening_month, campground.open_to_mm AS closing_month, campground.daily_fee
FROM park
JOIN campground ON park.park_id = campground.park_id
ORDER BY park.name, campground.name


-- select the park name and the total number of campgrounds for each park ordered by park name
SELECT park.name, count(campground.campground_id) AS total_campgrounds
FROM park
JOIN campground ON park.park_id = campground.park_id
GROUP BY park.name
ORDER BY park.name



-- select the park name, campground name, site number, max occupancy, accessible, max rv length, utilities where the campground name is 'Blackwoods'
SELECT park.name, campground.name, site.site_number, site.max_occupancy, site.accessible, site.max_rv_length, site.utilities  
FROM park
JOIN campground ON park.park_id = campground.park_id
JOIN site ON campground.campground_id = site.campground_id
WHERE campground.name = 'Blackwoods'


/*
  select park name, campground, total number of sites (column alias 'number_of_sites') ordered by park
  data should look like below:
  -------------------------------------------------
    park				campground							number_of_sites
	Acadia				Blackwoods							12
    Acadia				Seawall								12
    Acadia				Schoodic Woods						12
    Arches				"Devil's Garden"					8
    Arches				Canyon Wren Group Site				1
    Arches				Juniper Group Site					1
    Cuyahoga Valley		The Unnamed Primitive Campsites		5
  -------------------------------------------------
*/
SELECT park.name AS park_name, campground.name AS campground_name, count(site.site_id) AS number_of_sites
FROM park
JOIN campground ON park.park_id = campground.park_id
JOIN site ON campground.campground_id = site.campground_id
GROUP BY park.name, campground.name
ORDER BY park.name


-- select site number, reservation name, reservation from and to date ordered by reservation from date
SELECT site.site_number, reservation.name, reservation.from_date, reservation.to_date
FROM site
JOIN reservation ON site.site_id = reservation.site_id
ORDER BY reservation.from_date



/*
  select campground name, total number of reservations for each campground ordered by total reservations desc
  data should look like below:
  -------------------------------------------------
    name								total_reservations
	Seawall								13
    Blackwoods							9
    "Devil's Garden"					7
    Schoodic Woods						7
    Canyon Wren Group Site				4
    Juniper Group Site					4
  -------------------------------------------------
*/

SELECT campground.name, count(reservation.reservation_id)
FROM campground
JOIN site ON campground.campground_id = site.campground_id
JOIN reservation ON site.site_id = reservation.site_id
GROUP BY campground.name
ORDER BY count(reservation.reservation_id) DESC



