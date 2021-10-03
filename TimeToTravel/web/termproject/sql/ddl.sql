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
        view_count int
);

create table travel_root(
        post_id char(36),
        author_id char(36),
        title char(64),
        description mediumtext,
        created_at datetime,
        view_count int
);

create table user(
        user_id char(36),
        name char(36),
        email char(36),
        nickname tinytext,
        password char(36),
        phone_number char(13)
);