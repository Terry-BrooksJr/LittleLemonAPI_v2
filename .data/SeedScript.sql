-- Active: 1690320994353@@127.0.0.1@3306
insert into menu_items (title, featured, category_id, price)
values ('Consomme printaniere royal', false, 5, 3.99);
insert into menu_items (title, featured, category_id, price)
values ('Chicken gumbo', false, 2, 13.07);
insert into menu_items (title, featured, category_id, price)
values ('Tomato aux croutons', false, 2, 19.83);
insert into menu_items (title, featured, category_id, price)
values ('Onion au gratin', false, 5, 3.99);
insert into menu_items (title, featured, category_id, price)
values ('St. Emilion', true, 5, 3.99);
insert into menu_items (title, featured, category_id, price)
values ('Radishes', true, 2, 14.50);
insert into menu_items (title, featured, category_id, price)
values ('Chicken soup with rice', true, 4, 3.99);
insert into menu_items (title, featured, category_id, price)
values ('Clam broth (cup)', false, 1, 2.70);
insert into menu_items (title, featured, category_id, price)
values (
        'Cream of new asparagus, croutons',
        false,
        4,
        3.99
    );
insert into menu_items (title, featured, category_id, price)
values ('Clear green turtle', true, 3, 27.36);
insert into menu_items (title, featured, category_id, price)
values ('Striped bass saute, meuniere', true, 2, 10.52);
insert into menu_items (title, featured, category_id, price)
values ('Anchovies', false, 5, 3.99);
insert into menu_items (title, featured, category_id, price)
values ('Fresh lobsters in every style', false, 5, 3.99);
insert into menu_items (title, featured, category_id, price)
values ('Celery', false, 4, 3.99);
insert into menu_items (title, featured, category_id, price)
values ('Pim-olas', true, 5, 3.99);
insert into menu_items (title, featured, category_id, price)
values ('Caviar', false, 5, 3.99);
insert into menu_items (title, featured, category_id, price)
values ('Sardines', false, 4, 3.99);
insert into menu_items (title, featured, category_id, price)
values ('India chutney', true, 2, 8.70);
insert into menu_items (title, featured, category_id, price)
values ('Pickles', false, 5, 3.99);
insert into menu_items (title, featured, category_id, price)
values ('English walnuts', true, 5, 3.99);
insert into menu_items (title, featured, category_id, price)
values ('Pate de foies-gras', true, 5, 3.99);
insert into menu_items (title, featured, category_id, price)
values ('Pomard', true, 2, 17.27);
insert into menu_items (title, featured, category_id, price)
values ('Brook trout, mountain style', true, 4, 3.99);
insert into menu_items (title, featured, category_id, price)
values ('Whitebait, sauce tartare', false, 1, 5.47);
insert into menu_items (title, featured, category_id, price)
values ('Clams', false, 2, 14.64);
insert into menu_items (title, featured, category_id, price)
values ('Oysters', false, 4, 3.99);
insert into menu_items (title, featured, category_id, price)
values ('Claremont planked shad', false, 4, 3.99);
insert into menu_items (title, featured, category_id, price)
values ('G. H. Mumm & Co''s Extra Dry', true, 2, 16.85);
insert into menu_items (title, featured, category_id, price)
values ('Cerealine with Milk', false, 1, 4.39);
insert into menu_items (title, featured, category_id, price)
values ('Sliced Bananas', true, 3, 25.63);
insert into menu_items (title, featured, category_id, price)
values ('Wheat Vitos', false, 1, 1.56);
insert into menu_items (title, featured, category_id, price)
values ('Sliced Tomatoes', true, 3, 29.77);
insert into menu_items (title, featured, category_id, price)
values ('Russian Caviare on Toast', true, 3, 24.15);
insert into menu_items (title, featured, category_id, price)
values ('Smoked beef in cream', false, 1, 2.80);
insert into menu_items (title, featured, category_id, price)
values ('Apple Sauce', true, 3, 23.13);
insert into menu_items (title, featured, category_id, price)
values ('Potage a la Victoria', true, 5, 3.99);
insert into menu_items (title, featured, category_id, price)
values ('Breakfast', false, 5, 3.99);
insert into menu_items (title, featured, category_id, price)
values ('Strawberries', false, 2, 16.37);
insert into menu_items (title, featured, category_id, price)
values ('Preserved figs', false, 4, 3.99);
insert into menu_items (title, featured, category_id, price)
values ('BLUE POINTS', true, 4, 3.99);

-- Start of STAFF USER Seed Data (10)

insert into auth_user (
        password,
        is_superuser,
        username,
        first_name,
        last_name,
        email,
        is_active,
        is_staff,
        date_joined
    )
values (
        'OYIc8UGq8',
        'false',
        'jkondrachenko0',
        'Jakie',
        'Kondrachenko',
        'jkondrachenko0@myspace.com',
        'true',
        'true',
        '2022-03-09 02:44:15'
    );
insert into auth_user (
        password,
        is_superuser,
        username,
        first_name,
        last_name,
        email,
        is_active,
        is_staff,
        date_joined
    )
values (
        'Um32SW7rHKvZ',
        'false',
        'mschnieder1',
        'Michele',
        'Schnieder',
        'mschnieder1@shareasale.com',
        'true',
        'true',
        '2021-12-31 09:21:33'
    );
insert into auth_user (
        password,
        is_superuser,
        username,
        first_name,
        last_name,
        email,
        is_active,
        is_staff,
        date_joined
    )
values (
        'g05ISwNSJSzL',
        'false',
        'emyles2',
        'Eugen',
        'Myles',
        'emyles2@shutterfly.com',
        'true',
        'true',
        '2022-04-16 22:28:34'
    );
insert into auth_user (
        password,
        is_superuser,
        username,
        first_name,
        last_name,
        email,
        is_active,
        is_staff,
        date_joined
    )
values (
        'go9SNLKb2Ukn',
        'false',
        'tenston3',
        'Thor',
        'Enston',
        'tenston3@prlog.org',
        'true',
        'true',
        '2022-04-11 17:49:19'
    );
insert into auth_user (
        password,
        is_superuser,
        username,
        first_name,
        last_name,
        email,
        is_active,
        is_staff,
        date_joined
    )
values (
        'G5l4jZj',
        'false',
        'cwymer4',
        'Calypso',
        'Wymer',
        'cwymer4@mail.ru',
        'true',
        'true',
        '2022-02-18 20:36:12'
    );
insert into auth_user (
        password,
        is_superuser,
        username,
        first_name,
        last_name,
        email,
        is_active,
        is_staff,
        date_joined
    )
values (
        '9F92ozrw',
        'false',
        'aandrichak5',
        'Ana',
        'Andrichak',
        'aandrichak5@barnesandnoble.com',
        'true',
        'true',
        '2022-04-30 09:00:20'
    );
insert into auth_user (
        password,
        is_superuser,
        username,
        first_name,
        last_name,
        email,
        is_active,
        is_staff,
        date_joined
    )
values (
        'e3HDLR',
        'false',
        'alehrahan6',
        'Abdel',
        'Lehrahan',
        'alehrahan6@google.co.jp',
        'true',
        'true',
        '2022-02-10 12:52:34'
    );
insert into auth_user (
        password,
        is_superuser,
        username,
        first_name,
        last_name,
        email,
        is_active,
        is_staff,
        date_joined
    )
values (
        '4ytXIYlix',
        'false',
        'ttamblingson7',
        'Tymothy',
        'Tamblingson',
        'ttamblingson7@is.gd',
        'true',
        'true',
        '2022-02-26 22:58:50'
    );
insert into auth_user (
        password,
        is_superuser,
        username,
        first_name,
        last_name,
        email,
        is_active,
        is_staff,
        date_joined
    )
values (
        'Ncl4iA',
        'false',
        'vmcgunley8',
        'Virgilio',
        'McGunley',
        'vmcgunley8@trellian.com',
        'true',
        'true',
        '2022-01-04 18:52:22'
    );
insert into auth_user (
        password,
        is_superuser,
        username,
        first_name,
        last_name,
        email,
        is_active,
        is_staff,
        date_joined
    )
values (
        '2mpnAkgg8Yl',
        'false',
        'epentony9',
        'Estrellita',
        'Pentony',
        'epentony9@bandcamp.com',
        'true',
        'true',
        '2022-04-07 14:31:59'
    );
-- Start of order seed DATABASE
insert into orders (user_id, delivery_crew_id, status, total, date)
values (92393, 108, false, 265.37, '1/12/2010');
insert into orders (user_id, delivery_crew_id, status, total, date)
values (6, 110, true, 31.98, '12/6/2022');
insert into orders (user_id, delivery_crew_id, status, total, date)
values (100, 108, false, 217.67, '5/19/2022');
insert into orders (user_id, delivery_crew_id, status, total, date)
values (20, 114, false, 469.22, '9/14/2015');
insert into orders (user_id, delivery_crew_id, status, total, date)
values (86, 109, true, 166.41, '8/8/2010');
insert into orders (user_id, delivery_crew_id, status, total, date)
values (94, 108, true, 303.82, '8/18/2019');
insert into orders (user_id, delivery_crew_id, status, total, date)
values (64, 106, false, 434.71, '1/3/2015');
insert into orders (user_id, delivery_crew_id, status, total, date)
values (96, 2, false, 420.7, '8/27/2013');
insert into orders (user_id, delivery_crew_id, status, total, date)
values (43, 112, true, 244.91, '5/28/2011');
insert into orders (user_id, delivery_crew_id, status, total, date)
values (83, 106, false, 479.59, '4/8/2015');
insert into orders (user_id, delivery_crew_id, status, total, date)
values (103, 113, true, 445.4, '6/16/2016');
insert into orders (user_id, delivery_crew_id, status, total, date)
values (74, 106, true, 401.45, '7/23/2019');
insert into orders (user_id, delivery_crew_id, status, total, date)
values (18, 110, true, 462.65, '6/9/2015');
insert into orders (user_id, delivery_crew_id, status, total, date)
values (65, 2, true, 25.1, '10/3/2010');
insert into orders (user_id, delivery_crew_id, status, total, date)
values (43, 105, true, 253.83, '9/16/2010');
insert into orders (user_id, delivery_crew_id, status, total, date)
values (81, 109, true, 176.3, '11/9/2011');
insert into orders (user_id, delivery_crew_id, status, total, date)
values (55, 110, true, 382.09, '2/2/2022');
insert into orders (user_id, delivery_crew_id, status, total, date)
values (54, 111, false, 264.14, '7/11/2018');
insert into orders (user_id, delivery_crew_id, status, total, date)
values (31, 111, true, 341.19, '1/14/2010');
insert into orders (user_id, delivery_crew_id, status, total, date)
values (37, 2, true, 161.49, '2/1/2011');
insert into orders (user_id, delivery_crew_id, status, total, date)
values (14, 108, false, 183.61, '1/17/2019');
insert into orders (user_id, delivery_crew_id, status, total, date)
values (87, 112, true, 53.9, '5/23/2013');
insert into orders (user_id, delivery_crew_id, status, total, date)
values (100, 112, true, 304.59, '8/18/2019');
insert into orders (user_id, delivery_crew_id, status, total, date)
values (53, 110, false, 47.95, '5/4/2020');
insert into orders (user_id, delivery_crew_id, status, total, date)
values (23, 112, true, 199.18, '5/26/2021');
insert into orders (user_id, delivery_crew_id, status, total, date)
values (38, 105, true, 204.45, '10/23/2016');
insert into orders (user_id, delivery_crew_id, status, total, date)
values (93, 108, false, 124.73, '8/14/2015');
insert into orders (user_id, delivery_crew_id, status, total, date)
values (93, 111, false, 299.79, '1/31/2011');
insert into orders (user_id, delivery_crew_id, status, total, date)
values (31, 109, true, 61.3, '1/27/2012');
insert into orders (user_id, delivery_crew_id, status, total, date)
values (52, 112, false, 452.63, '5/2/2018');
insert into orders (user_id, delivery_crew_id, status, total, date)
values (13, 110, false, 72.91, '1/1/2017');
insert into orders (user_id, delivery_crew_id, status, total, date)
values (21, 114, true, 61.02, '4/9/2010');
insert into orders (user_id, delivery_crew_id, status, total, date)
values (67, 114, true, 288.53, '11/9/2022');
insert into orders (user_id, delivery_crew_id, status, total, date)
values (70, 106, false, 114.82, '6/29/2019');
insert into orders (user_id, delivery_crew_id, status, total, date)
values (24, 105, true, 461.68, '8/1/2020');
insert into orders (user_id, delivery_crew_id, status, total, date)
values (6, 109, false, 200.25, '8/8/2018');
insert into orders (user_id, delivery_crew_id, status, total, date)
values (45, 106, true, 260.16, '4/9/2020');
insert into orders (user_id, delivery_crew_id, status, total, date)
values (75, 113, true, 137.45, '5/13/2023');
insert into orders (user_id, delivery_crew_id, status, total, date)
values (89, 113, false, 387.32, '12/30/2017');
insert into orders (user_id, delivery_crew_id, status, total, date)
values (51, 108, false, 478.46, '9/11/2018');
insert into orders (user_id, delivery_crew_id, status, total, date)
values (101, 108, false, 373.34, '5/26/2010');
insert into orders (user_id, delivery_crew_id, status, total, date)
values (54, 2, true, 114.46, '7/23/2021');
insert into orders (user_id, delivery_crew_id, status, total, date)
values (102, 107, false, 145.98, '12/22/2016');
insert into orders (user_id, delivery_crew_id, status, total, date)
values (42, 110, true, 214.13, '7/1/2020');
insert into orders (user_id, delivery_crew_id, status, total, date)
values (56, 107, true, 395.58, '6/5/2014');
insert into orders (user_id, delivery_crew_id, status, total, date)
values (93, 111, false, 448.41, '1/11/2020');
insert into orders (user_id, delivery_crew_id, status, total, date)
values (64, 106, true, 459.88, '8/11/2012');
insert into orders (user_id, delivery_crew_id, status, total, date)
values (17, 114, true, 499.51, '6/9/2010');
insert into orders (user_id, delivery_crew_id, status, total, date)
values (59, 114, true, 202.74, '4/23/2010');
insert into orders (user_id, delivery_crew_id, status, total, date)
values (65, 107, true, 59.76, '10/7/2014');
insert into orders (user_id, delivery_crew_id, status, total, date)
values (92, 105, true, 461.52, '6/19/2022');
insert into orders (user_id, delivery_crew_id, status, total, date)
values (58, 109, true, 158.17, '6/7/2018');
insert into orders (user_id, delivery_crew_id, status, total, date)
values (97, 112, false, 305.64, '10/24/2014');
insert into orders (user_id, delivery_crew_id, status, total, date)
values (34, 108, true, 435.11, '8/4/2017');
insert into orders (user_id, delivery_crew_id, status, total, date)
values (87, 108, true, 119.15, '4/27/2021');
insert into orders (user_id, delivery_crew_id, status, total, date)
values (85, 2, true, 424.11, '10/10/2017');
insert into orders (user_id, delivery_crew_id, status, total, date)
values (43, 107, false, 170.7, '11/27/2017');
insert into orders (user_id, delivery_crew_id, status, total, date)
values (81, 110, true, 169.35, '10/10/2018');
insert into orders (user_id, delivery_crew_id, status, total, date)
values (82, 109, true, 155.2, '4/30/2020');
insert into orders (user_id, delivery_crew_id, status, total, date)
values (85, 109, true, 425.8, '5/26/2019');
insert into orders (user_id, delivery_crew_id, status, total, date)
values (90, 108, false, 273.74, '8/30/2013');
insert into orders (user_id, delivery_crew_id, status, total, date)
values (25, 110, false, 46.54, '10/9/2017');
insert into orders (user_id, delivery_crew_id, status, total, date)
values (2, 111, true, 406.45, '5/11/2017');
insert into orders (user_id, delivery_crew_id, status, total, date)
values (25, 113, true, 476.12, '11/9/2014');
insert into orders (user_id, delivery_crew_id, status, total, date)
values (47, 111, false, 476.98, '6/26/2015');
insert into orders (user_id, delivery_crew_id, status, total, date)
values (67, 108, false, 69.97, '7/20/2012');
insert into orders (user_id, delivery_crew_id, status, total, date)
values (84, 2, true, 100.72, '10/9/2020');
insert into orders (user_id, delivery_crew_id, status, total, date)
values (44, 105, true, 180.95, '1/10/2020');
insert into orders (user_id, delivery_crew_id, status, total, date)
values (47, 2, true, 389.75, '2/13/2019');
insert into orders (user_id, delivery_crew_id, status, total, date)
values (86, 107, false, 255.1, '12/24/2020');
insert into orders (user_id, delivery_crew_id, status, total, date)
values (68, 114, true, 22.55, '10/23/2018');
insert into orders (user_id, delivery_crew_id, status, total, date)
values (72, 111, true, 157.96, '6/25/2016');
insert into orders (user_id, delivery_crew_id, status, total, date)
values (87, 105, false, 287.56, '2/10/2015');
insert into orders (user_id, delivery_crew_id, status, total, date)
values (60, 110, true, 201.2, '1/24/2023');
insert into orders (user_id, delivery_crew_id, status, total, date)
values (57, 114, false, 257.38, '1/19/2017');
insert into orders (user_id, delivery_crew_id, status, total, date)
values (30, 2, false, 101.85, '7/13/2021');
insert into orders (user_id, delivery_crew_id, status, total, date)
values (41, 105, false, 371.61, '6/16/2022');
insert into orders (user_id, delivery_crew_id, status, total, date)
values (9, 108, false, 96.51, '7/31/2011');
insert into orders (user_id, delivery_crew_id, status, total, date)
values (2, 112, true, 101.53, '11/7/2012');
insert into orders (user_id, delivery_crew_id, status, total, date)
values (50, 2, true, 121.4, '8/19/2012');
insert into orders (user_id, delivery_crew_id, status, total, date)
values (73, 106, false, 409.25, '11/16/2017');
insert into orders (user_id, delivery_crew_id, status, total, date)
values (88, 107, false, 273.35, '12/31/2018');
insert into orders (user_id, delivery_crew_id, status, total, date)
values (24, 107, false, 338.48, '1/27/2013');
insert into orders (user_id, delivery_crew_id, status, total, date)
values (8, 112, true, 141.29, '1/17/2011');
-- Start of USER SEED DATA
insert into auth_user (
        password,
        is_superuser,
        username,
        first_name,
        last_name,
        email,
        is_active,
        is_staff,
        date_joined
    )
values (
        'HcLUso',
        'false',
        'fmichin0',
        'Fidelity',
        'Michin',
        'fmichin0@gravatar.com',
        'true',
        'false',
        '2021-11-30 02:32:21'
    );
insert into auth_user (
        password,
        is_superuser,
        username,
        first_name,
        last_name,
        email,
        is_active,
        is_staff,
        date_joined
    )
values (
        'Dewdl2SIIRQZ',
        'false',
        'vheadford1',
        'Victor',
        'Headford',
        'vheadford1@msn.com',
        'true',
        'false',
        '2022-05-11 22:32:25'
    );
insert into auth_user (
        password,
        is_superuser,
        username,
        first_name,
        last_name,
        email,
        is_active,
        is_staff,
        date_joined
    )
values (
        'uAvGcFGVdVnk',
        'false',
        'ccavan2',
        'Chaim',
        'Cavan',
        'ccavan2@pagesperso-orange.fr',
        'true',
        'false',
        '2022-06-25 03:07:42'
    );
insert into auth_user (
        password,
        is_superuser,
        username,
        first_name,
        last_name,
        email,
        is_active,
        is_staff,
        date_joined
    )
values (
        'KQ3LcgvL',
        'false',
        'bmccaskill3',
        'Bobbie',
        'McCaskill',
        'bmccaskill3@oaic.gov.au',
        'true',
        'false',
        '2022-01-28 20:10:48'
    );
insert into auth_user (
        password,
        is_superuser,
        username,
        first_name,
        last_name,
        email,
        is_active,
        is_staff,
        date_joined
    )
values (
        'dtmCjy',
        'false',
        'ihazell4',
        'Ingeberg',
        'Hazell',
        'ihazell4@privacy.gov.au',
        'true',
        'false',
        '2022-11-28 02:22:29'
    );
insert into auth_user (
        password,
        is_superuser,
        username,
        first_name,
        last_name,
        email,
        is_active,
        is_staff,
        date_joined
    )
values (
        'A7woS1qjycWI',
        'false',
        'dtottman5',
        'Deanna',
        'Tottman',
        'dtottman5@cornell.edu',
        'true',
        'false',
        '2023-01-29 13:15:11'
    );
insert into auth_user (
        password,
        is_superuser,
        username,
        first_name,
        last_name,
        email,
        is_active,
        is_staff,
        date_joined
    )
values (
        'GQOgTK',
        'false',
        'dinglesfield6',
        'Dela',
        'Inglesfield',
        'dinglesfield6@marriott.com',
        'true',
        'false',
        '2022-06-01 00:52:28'
    );
insert into auth_user (
        password,
        is_superuser,
        username,
        first_name,
        last_name,
        email,
        is_active,
        is_staff,
        date_joined
    )
values (
        'sSeNeZliFV',
        'false',
        'rcorradino7',
        'Rhetta',
        'Corradino',
        'rcorradino7@blogspot.com',
        'true',
        'false',
        '2023-01-16 03:36:56'
    );
insert into auth_user (
        password,
        is_superuser,
        username,
        first_name,
        last_name,
        email,
        is_active,
        is_staff,
        date_joined
    )
values (
        'p7WoClrTaX',
        'false',
        'bbatman8',
        'Bendicty',
        'Batman',
        'bbatman8@yolasite.com',
        'true',
        'false',
        '2023-01-29 20:27:09'
    );
insert into auth_user (
        password,
        is_superuser,
        username,
        first_name,
        last_name,
        email,
        is_active,
        is_staff,
        date_joined
    )
values (
        'wn2EkKBZkGH',
        'false',
        'keyckel9',
        'Katey',
        'Eyckel',
        'keyckel9@shareasale.com',
        'true',
        'false',
        '2022-04-22 01:41:45'
    );
insert into auth_user (
        password,
        is_superuser,
        username,
        first_name,
        last_name,
        email,
        is_active,
        is_staff,
        date_joined
    )
values (
        'dZHoBT9',
        'false',
        'veardleya',
        'Victor',
        'Eardley',
        'veardleya@indiatimes.com',
        'true',
        'false',
        '2022-01-28 03:57:24'
    );
insert into auth_user (
        password,
        is_superuser,
        username,
        first_name,
        last_name,
        email,
        is_active,
        is_staff,
        date_joined
    )
values (
        'RQg27JCEn',
        'false',
        'mcolbridgeb',
        'Marcelle',
        'Colbridge',
        'mcolbridgeb@4shared.com',
        'true',
        'false',
        '2021-12-25 12:53:44'
    );
insert into auth_user (
        password,
        is_superuser,
        username,
        first_name,
        last_name,
        email,
        is_active,
        is_staff,
        date_joined
    )
values (
        'MG0LgZUO',
        'false',
        'nwestallc',
        'Nance',
        'Westall',
        'nwestallc@about.me',
        'true',
        'false',
        '2022-03-04 02:51:02'
    );
insert into auth_user (
        password,
        is_superuser,
        username,
        first_name,
        last_name,
        email,
        is_active,
        is_staff,
        date_joined
    )
values (
        'OY6UDcJ',
        'false',
        'mambroisind',
        'Marv',
        'Ambroisin',
        'mambroisind@noaa.gov',
        'true',
        'false',
        '2022-03-01 14:29:45'
    );
insert into auth_user (
        password,
        is_superuser,
        username,
        first_name,
        last_name,
        email,
        is_active,
        is_staff,
        date_joined
    )
values (
        'N0180q',
        'false',
        'ajancare',
        'Aurthur',
        'Jancar',
        'ajancare@behance.net',
        'true',
        'false',
        '2022-07-01 08:55:25'
    );
insert into auth_user (
        password,
        is_superuser,
        username,
        first_name,
        last_name,
        email,
        is_active,
        is_staff,
        date_joined
    )
values (
        'jRzN21StQ7Z2',
        'false',
        'mgeeref',
        'Mireille',
        'Geere',
        'mgeeref@yandex.ru',
        'true',
        'false',
        '2022-12-15 07:25:14'
    );
insert into auth_user (
        password,
        is_superuser,
        username,
        first_name,
        last_name,
        email,
        is_active,
        is_staff,
        date_joined
    )
values (
        'QqXhE3g',
        'false',
        'aperschkeg',
        'Aube',
        'Perschke',
        'aperschkeg@linkedin.com',
        'true',
        'false',
        '2022-09-11 20:49:02'
    );
insert into auth_user (
        password,
        is_superuser,
        username,
        first_name,
        last_name,
        email,
        is_active,
        is_staff,
        date_joined
    )
values (
        'T56uuOu6pgKZ',
        'false',
        'cthickh',
        'Creight',
        'Thick',
        'cthickh@sciencedirect.com',
        'true',
        'false',
        '2022-11-21 00:58:31'
    );
insert into auth_user (
        password,
        is_superuser,
        username,
        first_name,
        last_name,
        email,
        is_active,
        is_staff,
        date_joined
    )
values (
        'IGysR9jpKwI',
        'false',
        'ilodevicki',
        'Isabella',
        'Lodevick',
        'ilodevicki@wufoo.com',
        'true',
        'false',
        '2021-10-26 15:27:31'
    );
insert into auth_user (
        password,
        is_superuser,
        username,
        first_name,
        last_name,
        email,
        is_active,
        is_staff,
        date_joined
    )
values (
        '1lc3dkgiVbzz',
        'false',
        'onajafianj',
        'Ole',
        'Najafian',
        'onajafianj@free.fr',
        'true',
        'false',
        '2022-06-11 22:22:26'
    );
insert into auth_user (
        password,
        is_superuser,
        username,
        first_name,
        last_name,
        email,
        is_active,
        is_staff,
        date_joined
    )
values (
        'URUsu0',
        'false',
        'tpittk',
        'Terry',
        'Pitt',
        'tpittk@163.com',
        'true',
        'false',
        '2021-12-24 22:12:17'
    );
insert into auth_user (
        password,
        is_superuser,
        username,
        first_name,
        last_name,
        email,
        is_active,
        is_staff,
        date_joined
    )
values (
        'zHPo6mg',
        'false',
        'rhalpinel',
        'Rachele',
        'Halpine',
        'rhalpinel@mlb.com',
        'true',
        'false',
        '2022-04-13 03:29:22'
    );
insert into auth_user (
        password,
        is_superuser,
        username,
        first_name,
        last_name,
        email,
        is_active,
        is_staff,
        date_joined
    )
values (
        'N8OZnG9',
        'false',
        'ctunnickm',
        'Chickie',
        'Tunnick',
        'ctunnickm@apache.org',
        'true',
        'false',
        '2022-10-26 23:30:35'
    );
insert into auth_user (
        password,
        is_superuser,
        username,
        first_name,
        last_name,
        email,
        is_active,
        is_staff,
        date_joined
    )
values (
        'DoKAjVBPbyyN',
        'false',
        'nrosebyn',
        'Nessa',
        'Roseby',
        'nrosebyn@usatoday.com',
        'true',
        'false',
        '2023-01-18 00:28:16'
    );
insert into auth_user (
        password,
        is_superuser,
        username,
        first_name,
        last_name,
        email,
        is_active,
        is_staff,
        date_joined
    )
values (
        'sRJSBidTG',
        'false',
        'ngallieo',
        'Nicolle',
        'Gallie',
        'ngallieo@360.cn',
        'true',
        'false',
        '2022-05-14 01:53:29'
    );
insert into auth_user (
        password,
        is_superuser,
        username,
        first_name,
        last_name,
        email,
        is_active,
        is_staff,
        date_joined
    )
values (
        'Lo1E6P',
        'false',
        'hmcruviep',
        'Hebert',
        'McRuvie',
        'hmcruviep@admin.ch',
        'true',
        'false',
        '2021-10-11 05:37:50'
    );
insert into auth_user (
        password,
        is_superuser,
        username,
        first_name,
        last_name,
        email,
        is_active,
        is_staff,
        date_joined
    )
values (
        'pN3zHo',
        'false',
        'dsuggeq',
        'Danyelle',
        'Sugge',
        'dsuggeq@boston.com',
        'true',
        'false',
        '2022-10-14 04:43:39'
    );
insert into auth_user (
        password,
        is_superuser,
        username,
        first_name,
        last_name,
        email,
        is_active,
        is_staff,
        date_joined
    )
values (
        'PQ09TWt',
        'false',
        'dgiacoppor',
        'Danyette',
        'Giacoppo',
        'dgiacoppor@princeton.edu',
        'true',
        'false',
        '2022-01-25 09:39:26'
    );
insert into auth_user (
        password,
        is_superuser,
        username,
        first_name,
        last_name,
        email,
        is_active,
        is_staff,
        date_joined
    )
values (
        'g1z9w8MatGN',
        'false',
        'lcudbirds',
        'Letty',
        'Cudbird',
        'lcudbirds@wordpress.org',
        'true',
        'false',
        '2023-01-08 22:52:28'
    );
insert into auth_user (
        password,
        is_superuser,
        username,
        first_name,
        last_name,
        email,
        is_active,
        is_staff,
        date_joined
    )
values (
        'EQ8dNq',
        'false',
        'jdelahuntyt',
        'Jenifer',
        'Delahunty',
        'jdelahuntyt@ifeng.com',
        'true',
        'false',
        '2022-03-17 09:13:59'
    );
insert into auth_user (
        password,
        is_superuser,
        username,
        first_name,
        last_name,
        email,
        is_active,
        is_staff,
        date_joined
    )
values (
        'dyDE1kalVa4g',
        'false',
        'etiftu',
        'Ernie',
        'Tift',
        'etiftu@ycombinator.com',
        'true',
        'false',
        '2022-05-01 15:36:50'
    );
insert into auth_user (
        password,
        is_superuser,
        username,
        first_name,
        last_name,
        email,
        is_active,
        is_staff,
        date_joined
    )
values (
        'EUYHmpGVAru',
        'false',
        'cleschellev',
        'Casar',
        'Leschelle',
        'cleschellev@opensource.org',
        'true',
        'false',
        '2022-01-31 09:15:53'
    );
insert into auth_user (
        password,
        is_superuser,
        username,
        first_name,
        last_name,
        email,
        is_active,
        is_staff,
        date_joined
    )
values (
        'vKZftQh5',
        'false',
        'syanyshevw',
        'Sonya',
        'Yanyshev',
        'syanyshevw@livejournal.com',
        'true',
        'false',
        '2022-11-04 07:08:16'
    );
insert into auth_user (
        password,
        is_superuser,
        username,
        first_name,
        last_name,
        email,
        is_active,
        is_staff,
        date_joined
    )
values (
        'w7eOzUZFAPih',
        'false',
        'dheinonenx',
        'Dorena',
        'Heinonen',
        'dheinonenx@whitehouse.gov',
        'true',
        'false',
        '2022-08-30 12:49:48'
    );
insert into auth_user (
        password,
        is_superuser,
        username,
        first_name,
        last_name,
        email,
        is_active,
        is_staff,
        date_joined
    )
values (
        'xwb06n99',
        'false',
        'klunbechy',
        'Kirsten',
        'Lunbech',
        'klunbechy@feedburner.com',
        'true',
        'false',
        '2022-10-13 02:55:53'
    );
insert into auth_user (
        password,
        is_superuser,
        username,
        first_name,
        last_name,
        email,
        is_active,
        is_staff,
        date_joined
    )
values (
        'kjAeelmB',
        'false',
        'edammarellz',
        'Elia',
        'Dammarell',
        'edammarellz@intel.com',
        'true',
        'false',
        '2022-01-03 18:17:32'
    );
insert into auth_user (
        password,
        is_superuser,
        username,
        first_name,
        last_name,
        email,
        is_active,
        is_staff,
        date_joined
    )
values (
        'oIF8GjhjzXml',
        'false',
        'prucklidge10',
        'Patsy',
        'Rucklidge',
        'prucklidge10@ebay.com',
        'true',
        'false',
        '2023-01-25 13:04:59'
    );
insert into auth_user (
        password,
        is_superuser,
        username,
        first_name,
        last_name,
        email,
        is_active,
        is_staff,
        date_joined
    )
values (
        'uNtamuYp',
        'false',
        'ewilmot11',
        'Ethelred',
        'Wilmot',
        'ewilmot11@nytimes.com',
        'true',
        'false',
        '2022-09-20 00:19:31'
    );
insert into auth_user (
        password,
        is_superuser,
        username,
        first_name,
        last_name,
        email,
        is_active,
        is_staff,
        date_joined
    )
values (
        'XkzUsBdLE9OO',
        'false',
        'hdonnelly12',
        'Hazel',
        'Donnelly',
        'hdonnelly12@vinaora.com',
        'true',
        'false',
        '2022-05-04 12:11:15'
    );
insert into auth_user (
        password,
        is_superuser,
        username,
        first_name,
        last_name,
        email,
        is_active,
        is_staff,
        date_joined
    )
values (
        'prqyvUJ',
        'false',
        'cricardot13',
        'Claresta',
        'Ricardot',
        'cricardot13@msu.edu',
        'true',
        'false',
        '2022-01-01 12:26:40'
    );
insert into auth_user (
        password,
        is_superuser,
        username,
        first_name,
        last_name,
        email,
        is_active,
        is_staff,
        date_joined
    )
values (
        'rQJB9a',
        'false',
        'cgabel14',
        'Cheslie',
        'Gabel',
        'cgabel14@trellian.com',
        'true',
        'false',
        '2021-10-15 08:03:15'
    );
insert into auth_user (
        password,
        is_superuser,
        username,
        first_name,
        last_name,
        email,
        is_active,
        is_staff,
        date_joined
    )
values (
        'NRpUzL',
        'false',
        'ccorzon15',
        'Chevy',
        'Corzon',
        'ccorzon15@phpbb.com',
        'true',
        'false',
        '2022-01-27 02:35:45'
    );
insert into auth_user (
        password,
        is_superuser,
        username,
        first_name,
        last_name,
        email,
        is_active,
        is_staff,
        date_joined
    )
values (
        'o4DeGj5SLNNX',
        'false',
        'cbrekonridge16',
        'Culley',
        'Brekonridge',
        'cbrekonridge16@princeton.edu',
        'true',
        'false',
        '2022-03-19 06:47:37'
    );
insert into auth_user (
        password,
        is_superuser,
        username,
        first_name,
        last_name,
        email,
        is_active,
        is_staff,
        date_joined
    )
values (
        'Gwf03Hch0',
        'false',
        'anunson17',
        'Aarika',
        'Nunson',
        'anunson17@phoca.cz',
        'true',
        'false',
        '2023-01-24 05:24:39'
    );
insert into auth_user (
        password,
        is_superuser,
        username,
        first_name,
        last_name,
        email,
        is_active,
        is_staff,
        date_joined
    )
values (
        'CmIaqOsx48wb',
        'false',
        'adanilchev18',
        'Allayne',
        'Danilchev',
        'adanilchev18@apache.org',
        'true',
        'false',
        '2022-04-07 11:28:08'
    );
insert into auth_user (
        password,
        is_superuser,
        username,
        first_name,
        last_name,
        email,
        is_active,
        is_staff,
        date_joined
    )
values (
        'JgAnvBX',
        'false',
        'flimming19',
        'Felisha',
        'Limming',
        'flimming19@biblegateway.com',
        'true',
        'false',
        '2022-07-16 22:40:07'
    );
insert into auth_user (
        password,
        is_superuser,
        username,
        first_name,
        last_name,
        email,
        is_active,
        is_staff,
        date_joined
    )
values (
        'HsUv58pX',
        'false',
        'cperrottet1a',
        'Corilla',
        'Perrottet',
        'cperrottet1a@disqus.com',
        'true',
        'false',
        '2022-04-15 23:15:04'
    );
insert into auth_user (
        password,
        is_superuser,
        username,
        first_name,
        last_name,
        email,
        is_active,
        is_staff,
        date_joined
    )
values (
        'wBT8AeQB',
        'false',
        'klusgdin1b',
        'Kristo',
        'Lusgdin',
        'klusgdin1b@scientificamerican.com',
        'true',
        'false',
        '2022-01-09 05:46:08'
    );
insert into auth_user (
        password,
        is_superuser,
        username,
        first_name,
        last_name,
        email,
        is_active,
        is_staff,
        date_joined
    )
values (
        'JwQpKi',
        'false',
        'fgodar1c',
        'Frederic',
        'Godar',
        'fgodar1c@techcrunch.com',
        'true',
        'false',
        '2022-11-05 12:49:27'
    );
insert into auth_user (
        password,
        is_superuser,
        username,
        first_name,
        last_name,
        email,
        is_active,
        is_staff,
        date_joined
    )
values (
        'z2I5lqZrpEK',
        'false',
        'mbestman1d',
        'Morena',
        'Bestman',
        'mbestman1d@comcast.net',
        'true',
        'false',
        '2021-10-27 17:44:03'
    );
insert into auth_user (
        password,
        is_superuser,
        username,
        first_name,
        last_name,
        email,
        is_active,
        is_staff,
        date_joined
    )
values (
        '3tZX8vvbkXyR',
        'false',
        'hlanda1e',
        'Hubie',
        'Landa',
        'hlanda1e@tripadvisor.com',
        'true',
        'false',
        '2022-04-12 07:02:26'
    );
insert into auth_user (
        password,
        is_superuser,
        username,
        first_name,
        last_name,
        email,
        is_active,
        is_staff,
        date_joined
    )
values (
        '6lVnT1LAOZE',
        'false',
        'rdoodney1f',
        'Randi',
        'Doodney',
        'rdoodney1f@meetup.com',
        'true',
        'false',
        '2022-09-27 10:17:18'
    );
insert into auth_user (
        password,
        is_superuser,
        username,
        first_name,
        last_name,
        email,
        is_active,
        is_staff,
        date_joined
    )
values (
        'qpfgqI3',
        'false',
        'epetre1g',
        'Elsie',
        'Petre',
        'epetre1g@sohu.com',
        'true',
        'false',
        '2022-11-07 16:36:12'
    );
insert into auth_user (
        password,
        is_superuser,
        username,
        first_name,
        last_name,
        email,
        is_active,
        is_staff,
        date_joined
    )
values (
        'hvHxUJzf1XG',
        'false',
        'palderwick1h',
        'Pattin',
        'Alderwick',
        'palderwick1h@barnesandnoble.com',
        'true',
        'false',
        '2021-10-05 00:22:26'
    );
insert into auth_user (
        password,
        is_superuser,
        username,
        first_name,
        last_name,
        email,
        is_active,
        is_staff,
        date_joined
    )
values (
        '7XyEjIQ8',
        'false',
        'bgorsse1i',
        'Bernadene',
        'Gorsse',
        'bgorsse1i@cocolog-nifty.com',
        'true',
        'false',
        '2022-08-06 06:16:19'
    );
insert into auth_user (
        password,
        is_superuser,
        username,
        first_name,
        last_name,
        email,
        is_active,
        is_staff,
        date_joined
    )
values (
        'Jqvm63C',
        'false',
        'jschottli1j',
        'Jessie',
        'Schottli',
        'jschottli1j@dyndns.org',
        'true',
        'false',
        '2022-01-05 09:35:23'
    );
insert into auth_user (
        password,
        is_superuser,
        username,
        first_name,
        last_name,
        email,
        is_active,
        is_staff,
        date_joined
    )
values (
        'mYSAM9',
        'false',
        'odavio1k',
        'Ofilia',
        'Davio',
        'odavio1k@senate.gov',
        'true',
        'false',
        '2022-07-09 09:48:37'
    );
insert into auth_user (
        password,
        is_superuser,
        username,
        first_name,
        last_name,
        email,
        is_active,
        is_staff,
        date_joined
    )
values (
        'bnRtNZA',
        'false',
        'chathaway1l',
        'Chrissy',
        'Hathaway',
        'chathaway1l@weather.com',
        'true',
        'false',
        '2022-05-23 00:08:28'
    );
insert into auth_user (
        password,
        is_superuser,
        username,
        first_name,
        last_name,
        email,
        is_active,
        is_staff,
        date_joined
    )
values (
        'kZPemVCNXyJ',
        'false',
        'vmeekins1m',
        'Vivyan',
        'Meekins',
        'vmeekins1m@reddit.com',
        'true',
        'false',
        '2022-11-08 15:02:37'
    );
insert into auth_user (
        password,
        is_superuser,
        username,
        first_name,
        last_name,
        email,
        is_active,
        is_staff,
        date_joined
    )
values (
        '8VPAj7syNHM',
        'false',
        'bellesworthe1n',
        'Blondy',
        'Ellesworthe',
        'bellesworthe1n@dropbox.com',
        'true',
        'false',
        '2021-12-06 08:54:26'
    );
insert into auth_user (
        password,
        is_superuser,
        username,
        first_name,
        last_name,
        email,
        is_active,
        is_staff,
        date_joined
    )
values (
        'Gff5or',
        'false',
        'lbigley1o',
        'Liane',
        'Bigley',
        'lbigley1o@auda.org.au',
        'true',
        'false',
        '2023-01-01 23:22:54'
    );
insert into auth_user (
        password,
        is_superuser,
        username,
        first_name,
        last_name,
        email,
        is_active,
        is_staff,
        date_joined
    )
values (
        'wVL1w04xK',
        'false',
        'sbillitteri1p',
        'Sallee',
        'Billitteri',
        'sbillitteri1p@columbia.edu',
        'true',
        'false',
        '2021-12-13 20:10:15'
    );
insert into auth_user (
        password,
        is_superuser,
        username,
        first_name,
        last_name,
        email,
        is_active,
        is_staff,
        date_joined
    )
values (
        'bXLYN1KA5rgm',
        'false',
        'bburdge1q',
        'Braden',
        'Burdge',
        'bburdge1q@quantcast.com',
        'true',
        'false',
        '2022-12-22 20:42:32'
    );
insert into auth_user (
        password,
        is_superuser,
        username,
        first_name,
        last_name,
        email,
        is_active,
        is_staff,
        date_joined
    )
values (
        'huie3O',
        'false',
        'bwelland1r',
        'Bogey',
        'Welland',
        'bwelland1r@hugedomains.com',
        'true',
        'false',
        '2022-08-26 01:29:32'
    );
insert into auth_user (
        password,
        is_superuser,
        username,
        first_name,
        last_name,
        email,
        is_active,
        is_staff,
        date_joined
    )
values (
        'BbG9z3z',
        'false',
        'civison1s',
        'Cathy',
        'Ivison',
        'civison1s@comsenz.com',
        'true',
        'false',
        '2022-06-28 18:57:18'
    );
insert into auth_user (
        password,
        is_superuser,
        username,
        first_name,
        last_name,
        email,
        is_active,
        is_staff,
        date_joined
    )
values (
        '3dGF7VR2Q',
        'false',
        'nfiddyment1t',
        'Nara',
        'Fiddyment',
        'nfiddyment1t@archive.org',
        'true',
        'false',
        '2022-01-23 05:46:49'
    );
insert into auth_user (
        password,
        is_superuser,
        username,
        first_name,
        last_name,
        email,
        is_active,
        is_staff,
        date_joined
    )
values (
        'KCd0iZt1Hy',
        'false',
        'rmacdonald1u',
        'Rosmunda',
        'MacDonald',
        'rmacdonald1u@hugedomains.com',
        'true',
        'false',
        '2022-03-20 22:52:32'
    );
insert into auth_user (
        password,
        is_superuser,
        username,
        first_name,
        last_name,
        email,
        is_active,
        is_staff,
        date_joined
    )
values (
        'H3CHSv2w',
        'false',
        'bstienton1v',
        'Bayard',
        'Stienton',
        'bstienton1v@ebay.co.uk',
        'true',
        'false',
        '2022-05-14 13:58:30'
    );
insert into auth_user (
        password,
        is_superuser,
        username,
        first_name,
        last_name,
        email,
        is_active,
        is_staff,
        date_joined
    )
values (
        'H9py8gsMs6',
        'false',
        'eblatcher1w',
        'Emalee',
        'Blatcher',
        'eblatcher1w@paypal.com',
        'true',
        'false',
        '2021-10-30 15:01:43'
    );
insert into auth_user (
        password,
        is_superuser,
        username,
        first_name,
        last_name,
        email,
        is_active,
        is_staff,
        date_joined
    )
values (
        'w0bvzy6WvqyB',
        'false',
        'psharrier1x',
        'Phillie',
        'Sharrier',
        'psharrier1x@nbcnews.com',
        'true',
        'false',
        '2022-11-12 08:03:55'
    );
insert into auth_user (
        password,
        is_superuser,
        username,
        first_name,
        last_name,
        email,
        is_active,
        is_staff,
        date_joined
    )
values (
        'OYMOpdp',
        'false',
        'dixor1y',
        'Darci',
        'Ixor',
        'dixor1y@printfriendly.com',
        'true',
        'false',
        '2022-05-14 22:52:09'
    );
insert into auth_user (
        password,
        is_superuser,
        username,
        first_name,
        last_name,
        email,
        is_active,
        is_staff,
        date_joined
    )
values (
        'G8xjvQ',
        'false',
        'vsmorthwaite1z',
        'Vivianna',
        'Smorthwaite',
        'vsmorthwaite1z@pbs.org',
        'true',
        'false',
        '2022-12-24 09:37:12'
    );
insert into auth_user (
        password,
        is_superuser,
        username,
        first_name,
        last_name,
        email,
        is_active,
        is_staff,
        date_joined
    )
values (
        'dGcz245',
        'false',
        'kcuffley20',
        'Kimberli',
        'Cuffley',
        'kcuffley20@issuu.com',
        'true',
        'false',
        '2022-01-22 05:07:12'
    );
insert into auth_user (
        password,
        is_superuser,
        username,
        first_name,
        last_name,
        email,
        is_active,
        is_staff,
        date_joined
    )
values (
        '25Xa600Qr4',
        'false',
        'awestbury21',
        'Annecorinne',
        'Westbury',
        'awestbury21@chronoengine.com',
        'true',
        'false',
        '2022-09-30 05:16:04'
    );
insert into auth_user (
        password,
        is_superuser,
        username,
        first_name,
        last_name,
        email,
        is_active,
        is_staff,
        date_joined
    )
values (
        'L4ZkBH4V',
        'false',
        'gcribbin22',
        'Gail',
        'Cribbin',
        'gcribbin22@abc.net.au',
        'true',
        'false',
        '2022-02-02 05:44:33'
    );
insert into auth_user (
        password,
        is_superuser,
        username,
        first_name,
        last_name,
        email,
        is_active,
        is_staff,
        date_joined
    )
values (
        'it4GeeaCx62F',
        'false',
        'nfeatherbie23',
        'Noell',
        'Featherbie',
        'nfeatherbie23@i2i.jp',
        'true',
        'false',
        '2021-10-29 13:48:45'
    );
insert into auth_user (
        password,
        is_superuser,
        username,
        first_name,
        last_name,
        email,
        is_active,
        is_staff,
        date_joined
    )
values (
        'uU2f2z',
        'false',
        'kpereira24',
        'Kaylil',
        'Pereira',
        'kpereira24@spiegel.de',
        'true',
        'false',
        '2023-02-13 18:01:18'
    );
insert into auth_user (
        password,
        is_superuser,
        username,
        first_name,
        last_name,
        email,
        is_active,
        is_staff,
        date_joined
    )
values (
        '20WrbSS',
        'false',
        'wenga25',
        'Welbie',
        'Enga',
        'wenga25@desdev.cn',
        'true',
        'false',
        '2022-06-20 08:52:17'
    );
insert into auth_user (
        password,
        is_superuser,
        username,
        first_name,
        last_name,
        email,
        is_active,
        is_staff,
        date_joined
    )
values (
        'krjmSxb0L',
        'false',
        'lsegar26',
        'Lucian',
        'Segar',
        'lsegar26@moonfruit.com',
        'true',
        'false',
        '2022-02-22 18:18:27'
    );
insert into auth_user (
        password,
        is_superuser,
        username,
        first_name,
        last_name,
        email,
        is_active,
        is_staff,
        date_joined
    )
values (
        '0ZDoGjqXka',
        'false',
        'kladbury27',
        'Kimbra',
        'Ladbury',
        'kladbury27@paypal.com',
        'true',
        'false',
        '2022-06-18 23:27:16'
    );
insert into auth_user (
        password,
        is_superuser,
        username,
        first_name,
        last_name,
        email,
        is_active,
        is_staff,
        date_joined
    )
values (
        'iIik1vzuB',
        'false',
        'fbasham28',
        'Fred',
        'Basham',
        'fbasham28@bizjournals.com',
        'true',
        'false',
        '2022-10-03 10:23:30'
    );
insert into auth_user (
        password,
        is_superuser,
        username,
        first_name,
        last_name,
        email,
        is_active,
        is_staff,
        date_joined
    )
values (
        'i9sMcIqd0Oq',
        'false',
        'rnichols29',
        'Reider',
        'Nichols',
        'rnichols29@wikia.com',
        'true',
        'false',
        '2022-06-11 10:18:52'
    );
insert into auth_user (
        password,
        is_superuser,
        username,
        first_name,
        last_name,
        email,
        is_active,
        is_staff,
        date_joined
    )
values (
        '51JOCrE',
        'false',
        'drogerson2a',
        'Dorey',
        'Rogerson',
        'drogerson2a@wikimedia.org',
        'true',
        'false',
        '2021-11-18 00:52:18'
    );
insert into auth_user (
        password,
        is_superuser,
        username,
        first_name,
        last_name,
        email,
        is_active,
        is_staff,
        date_joined
    )
values (
        'kUglUiR',
        'false',
        'hcathel2b',
        'Hoyt',
        'Cathel',
        'hcathel2b@a8.net',
        'true',
        'false',
        '2022-04-22 12:37:33'
    );
insert into auth_user (
        password,
        is_superuser,
        username,
        first_name,
        last_name,
        email,
        is_active,
        is_staff,
        date_joined
    )
values (
        '3L7U6siZ',
        'false',
        'rtreby2c',
        'Rowe',
        'Treby',
        'rtreby2c@sogou.com',
        'true',
        'false',
        '2022-05-23 08:27:56'
    );
insert into auth_user (
        password,
        is_superuser,
        username,
        first_name,
        last_name,
        email,
        is_active,
        is_staff,
        date_joined
    )
values (
        'tImseK4',
        'false',
        'sredler2d',
        'Stormie',
        'Redler',
        'sredler2d@cpanel.net',
        'true',
        'false',
        '2022-06-28 21:54:25'
    );
insert into auth_user (
        password,
        is_superuser,
        username,
        first_name,
        last_name,
        email,
        is_active,
        is_staff,
        date_joined
    )
values (
        'iSnguCs',
        'false',
        'bmelton2e',
        'Blinny',
        'Melton',
        'bmelton2e@bbc.co.uk',
        'true',
        'false',
        '2023-01-08 23:33:56'
    );
insert into auth_user (
        password,
        is_superuser,
        username,
        first_name,
        last_name,
        email,
        is_active,
        is_staff,
        date_joined
    )
values (
        'lrM8qPrQ8kfy',
        'false',
        'sjarrett2f',
        'Salomone',
        'Jarrett',
        'sjarrett2f@un.org',
        'true',
        'false',
        '2021-10-14 16:38:38'
    );
insert into auth_user (
        password,
        is_superuser,
        username,
        first_name,
        last_name,
        email,
        is_active,
        is_staff,
        date_joined
    )
values (
        'UkHeCwEEy',
        'false',
        'rziemke2g',
        'Rheta',
        'Ziemke',
        'rziemke2g@webnode.com',
        'true',
        'false',
        '2022-01-14 07:50:32'
    );
insert into auth_user (
        password,
        is_superuser,
        username,
        first_name,
        last_name,
        email,
        is_active,
        is_staff,
        date_joined
    )
values (
        'dQhaTHmCUe',
        'false',
        'cvanthoog2h',
        'Carlina',
        'Van T''Hoog',
        'cvanthoog2h@yellowpages.com',
        'true',
        'false',
        '2022-10-22 10:30:06'
    );
insert into auth_user (
        password,
        is_superuser,
        username,
        first_name,
        last_name,
        email,
        is_active,
        is_staff,
        date_joined
    )
values (
        'vIfaPCLE2',
        'false',
        'vgiottini2i',
        'Vanessa',
        'Giottini',
        'vgiottini2i@hexun.com',
        'true',
        'false',
        '2022-05-19 15:30:50'
    );
insert into auth_user (
        password,
        is_superuser,
        username,
        first_name,
        last_name,
        email,
        is_active,
        is_staff,
        date_joined
    )
values (
        '4TBQab',
        'false',
        'qgatherell2j',
        'Quincey',
        'Gatherell',
        'qgatherell2j@friendfeed.com',
        'true',
        'false',
        '2022-06-22 00:52:31'
    );
insert into auth_user (
        password,
        is_superuser,
        username,
        first_name,
        last_name,
        email,
        is_active,
        is_staff,
        date_joined
    )
values (
        'lmVy9KIbZkP',
        'false',
        'ebruckent2k',
        'Erma',
        'Bruckent',
        'ebruckent2k@blogspot.com',
        'true',
        'false',
        '2023-01-26 15:08:58'
    );
insert into auth_user (
        password,
        is_superuser,
        username,
        first_name,
        last_name,
        email,
        is_active,
        is_staff,
        date_joined
    )
values (
        '6V5ZNIb',
        'false',
        'aproudley2l',
        'Alford',
        'Proudley',
        'aproudley2l@deliciousdays.com',
        'true',
        'false',
        '2021-12-06 12:52:27'
    );
insert into auth_user (
        password,
        is_superuser,
        username,
        first_name,
        last_name,
        email,
        is_active,
        is_staff,
        date_joined
    )
values (
        'irOFMXrsr5z8',
        'false',
        'bballard2m',
        'Bren',
        'Ballard',
        'bballard2m@google.pl',
        'true',
        'false',
        '2022-10-24 10:06:16'
    );
insert into auth_user (
        password,
        is_superuser,
        username,
        first_name,
        last_name,
        email,
        is_active,
        is_staff,
        date_joined
    )
values (
        'cilZXhNLj',
        'false',
        'weiler2n',
        'Wit',
        'Eiler',
        'weiler2n@oaic.gov.au',
        'true',
        'false',
        '2022-11-24 12:05:29'
    );
insert into auth_user (
        password,
        is_superuser,
        username,
        first_name,
        last_name,
        email,
        is_active,
        is_staff,
        date_joined
    )
values (
        'jfECtuyTNX0',
        'false',
        'ekantor2o',
        'Eveleen',
        'Kantor',
        'ekantor2o@google.com',
        'true',
        'false',
        '2022-02-11 01:28:46'
    );
insert into auth_user (
        password,
        is_superuser,
        username,
        first_name,
        last_name,
        email,
        is_active,
        is_staff,
        date_joined
    )
values (
        'dGKxTY7',
        'false',
        'gstickler2p',
        'Grata',
        'Stickler',
        'gstickler2p@hubpages.com',
        'true',
        'false',
        '2022-06-26 17:43:36'
    );
insert into auth_user (
        password,
        is_superuser,
        username,
        first_name,
        last_name,
        email,
        is_active,
        is_staff,
        date_joined
    )
values (
        'teJWYv',
        'false',
        'ddomnick2q',
        'Doris',
        'Domnick',
        'ddomnick2q@topsy.com',
        'true',
        'false',
        '2022-05-03 07:02:30'
    );
insert into auth_user (
        password,
        is_superuser,
        username,
        first_name,
        last_name,
        email,
        is_active,
        is_staff,
        date_joined
    )
values (
        'IQNEeS0JMXfV',
        'false',
        'pbrushfield2r',
        'Peta',
        'Brushfield',
        'pbrushfield2r@scribd.com',
        'true',
        'false',
        '2022-05-27 04:47:22'
    );
    --  Start of CART Seed DATABASE
    insert into API_cart (
        user_id,
        menuitems_id,
        quantity,
        unit_price,
        price
    )
values ('62', 213, 8, 3.99, 31.92);
insert into API_cart (
        user_id,
        menuitems_id,
        quantity,
        unit_price,
        price
    )
values ('46', 219, 7, 3.99, 27.93);
insert into API_cart (
        user_id,
        menuitems_id,
        quantity,
        unit_price,
        price
    )
values ('82', 231, 13, 1.56, 20.28);
insert into API_cart (
        user_id,
        menuitems_id,
        quantity,
        unit_price,
        price
    )
values ('24', 215, 4, 3.99, 15.96);
insert into API_cart (
        user_id,
        menuitems_id,
        quantity,
        unit_price,
        price
    )
values ('28', 237, 19, 3.99, 75.81);
insert into API_cart (
        user_id,
        menuitems_id,
        quantity,
        unit_price,
        price
    )
values ('22', 206, 9, 14.5, 130.5);
insert into API_cart (
        user_id,
        menuitems_id,
        quantity,
        unit_price,
        price
    )
values ('23', 202, 3, 13.07, 39.21);
insert into API_cart (
        user_id,
        menuitems_id,
        quantity,
        unit_price,
        price
    )
values ('8', 214, 5, 3.99, 19.95);
insert into API_cart (
        user_id,
        menuitems_id,
        quantity,
        unit_price,
        price
    )
values ('14', 217, 10, 3.99, 39.9);
insert into API_cart (
        user_id,
        menuitems_id,
        quantity,
        unit_price,
        price
    )
values ('61', 234, 6, 2.8, 16.8);
insert into API_cart (
        user_id,
        menuitems_id,
        quantity,
        unit_price,
        price
    )
values ('72', 209, 17, 3.99, 67.83);
insert into API_cart (
        user_id,
        menuitems_id,
        quantity,
        unit_price,
        price
    )
values ('50', 203, 20, 19.83, 396.6);
insert into API_cart (
        user_id,
        menuitems_id,
        quantity,
        unit_price,
        price
    )
values ('21', 209, 15, 3.99, 59.85);
insert into API_cart (
        user_id,
        menuitems_id,
        quantity,
        unit_price,
        price
    )
values ('23', 238, 6, 16.37, 98.22);
insert into API_cart (
        user_id,
        menuitems_id,
        quantity,
        unit_price,
        price
    )
values ('69', 230, 7, 25.63, 179.41);
insert into API_cart (
        user_id,
        menuitems_id,
        quantity,
        unit_price,
        price
    )
values ('90', 225, 7, 14.64, 102.48);
insert into API_cart (
        user_id,
        menuitems_id,
        quantity,
        unit_price,
        price
    )
values ('2', 225, 20, 14.64, 292.8);
insert into API_cart (
        user_id,
        menuitems_id,
        quantity,
        unit_price,
        price
    )
values ('5', 234, 11, 2.8, 30.8);
insert into API_cart (
        user_id,
        menuitems_id,
        quantity,
        unit_price,
        price
    )
values ('23', 226, 9, 3.99, 35.91);
insert into API_cart (
        user_id,
        menuitems_id,
        quantity,
        unit_price,
        price
    )
values ('43', 224, 16, 5.47, 87.52);
insert into API_cart (
        user_id,
        menuitems_id,
        quantity,
        unit_price,
        price
    )
values ('46', 206, 16, 14.5, 232);
insert into API_cart (
        user_id,
        menuitems_id,
        quantity,
        unit_price,
        price
    )
values ('91', 234, 13, 2.8, 36.4);
insert into API_cart (
        user_id,
        menuitems_id,
        quantity,
        unit_price,
        price
    )
values ('57', 225, 11, 14.64, 161.04);
insert into API_cart (
        user_id,
        menuitems_id,
        quantity,
        unit_price,
        price
    )
values ('95', 238, 16, 16.37, 261.92);
insert into API_cart (
        user_id,
        menuitems_id,
        quantity,
        unit_price,
        price
    )
values ('63', 231, 11, 1.56, 17.16);
insert into API_cart (
        user_id,
        menuitems_id,
        quantity,
        unit_price,
        price
    )
values ('104', 216, 18, 3.99, 71.82);
insert into API_cart (
        user_id,
        menuitems_id,
        quantity,
        unit_price,
        price
    )
values ('30', 206, 5, 14.5, 72.5);
insert into API_cart (
        user_id,
        menuitems_id,
        quantity,
        unit_price,
        price
    )
values ('45', 215, 14, 3.99, 55.86);
insert into API_cart (
        user_id,
        menuitems_id,
        quantity,
        unit_price,
        price
    )
values ('31', 215, 15, 3.99, 59.85);
insert into API_cart (
        user_id,
        menuitems_id,
        quantity,
        unit_price,
        price
    )
values ('27', 217, 17, 3.99, 67.83);
insert into API_cart (
        user_id,
        menuitems_id,
        quantity,
        unit_price,
        price
    )
values ('77', 217, 20, 3.99, 79.8);
insert into API_cart (
        user_id,
        menuitems_id,
        quantity,
        unit_price,
        price
    )
values ('50', 228, 9, 16.85, 151.65);
insert into API_cart (
        user_id,
        menuitems_id,
        quantity,
        unit_price,
        price
    )
values ('66', 212, 14, 3.99, 55.86);
insert into API_cart (
        user_id,
        menuitems_id,
        quantity,
        unit_price,
        price
    )
values ('37', 201, 9, 3.99, 35.91);
insert into API_cart (
        user_id,
        menuitems_id,
        quantity,
        unit_price,
        price
    )
values ('47', 222, 13, 17.27, 224.51);
insert into API_cart (
        user_id,
        menuitems_id,
        quantity,
        unit_price,
        price
    )
values ('9', 220, 3, 3.99, 11.97);
insert into API_cart (
        user_id,
        menuitems_id,
        quantity,
        unit_price,
        price
    )
values ('50', 210, 13, 27.36, 355.68);
insert into API_cart (
        user_id,
        menuitems_id,
        quantity,
        unit_price,
        price
    )
values ('8', 213, 14, 3.99, 55.86);
insert into API_cart (
        user_id,
        menuitems_id,
        quantity,
        unit_price,
        price
    )
values ('39', 218, 20, 8.7, 174);
insert into API_cart (
        user_id,
        menuitems_id,
        quantity,
        unit_price,
        price
    )
values ('31', 228, 9, 16.85, 151.65);