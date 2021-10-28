create table comment(
                        post_id char(36),
                        comment_id char(36),
                        author_id char(36),
                        description mediumtext,
                        created_at datetime
);

create table review(
                       post_id char(36),
                       author_id char(36),
                       title char(64),
                       description mediumtext,
                       created_at datetime,
                       view_count int,
                       post_num int,
                       file_name char(64)
);

create table travel_route(
                            post_id char(36),
                            author_id char(36),
                            title char(64),
                            description mediumtext,
                            created_at datetime,
                            view_count int,
                            post_num int,
                            file_name char(64),
                            destination char(64),
                            day int,
                            departure_date date,
                            arrival_date date,
                            expense int,
                            person int,
                            type char(64)
);

create table user(
                     user_id char(36),
                     name char(36),
                     email char(36),
                     nickname tinytext,
                     password char(36),
                     phone_number char(13),
                     pref_type tinytext,
                     pref_preference tinytext,
                     pref_flight tinytext,
                     pref_room tinytext,
                     pref_plan tinytext,
                     pref_transport tinytext,
                     pref_meal tinytext,
                     pref_tendency tinytext
);