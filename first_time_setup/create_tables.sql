CREATE TABLE membertypes (
	member_type_id int PRIMARY KEY,
	member_type varchar(10)
);

CREATE TABLE memberstatustypes (
	member_status_type_id int PRIMARY KEY,
	member_status_type varchar(10)
);

CREATE TABLE IF NOT EXISTS public.members
(
    member_id integer NOT NULL,
    member_first_name character varying(255),
    member_last_name character varying(255),
    member_gender character varying(255),
    member_age integer,
    member_email character varying(255),
    member_phone character varying(255),
    member_joined_datetime timestamp without time zone,
    member_type integer REFERENCES membertypes (member_type_id),
    member_status integer REFERENCES memberstatustypes (member_status_type_id),
    CONSTRAINT members_pkey PRIMARY KEY (member_id)
);

CREATE TABLE addressstati (
	address_status_id int PRIMARY KEY,
	address_status varchar(10)
);

CREATE TABLE memberaddresses (
	member_id int REFERENCES members (member_id),
	address varchar(255),
	state varchar(2),
	postal_code int,
	city varchar(30),
	country varchar(30),
	address_status int REFERENCES addressstati (address_status_id),
    PRIMARY KEY (member_id, address)
);


CREATE TABLE climbingsessions (
	climbing_session_id int PRIMARY KEY,
	member_id int REFERENCES members (member_id),
	scan_in_datetime timestamp,
	scan_out_datetime timestamp
);
CREATE TABLE routecolors (
	route_color_id int PRIMARY KEY,
	route_color varchar(10)
);

CREATE TABLE climbinggrades (
	climbing_grade_id int PRIMARY KEY, 
	climbing_grade varchar(10)
);

CREATE TABLE routes (
	route_id int PRIMARY KEY,
	gym_quadrant int,
	route_color int REFERENCES routecolors (route_color_id),
	route_grade_id int REFERENCES climbinggrades (climbing_grade_id)
);

CREATE TABLE routeclimbs (
	route_climb_id int PRIMARY KEY,
	route_id int REFERENCES routes (route_id),
	member_id int REFERENCES members (member_id),
	route_climb_start_datetime timestamp,
	route_climb_end_datetime timestamp,
	route_climb_rating int
)