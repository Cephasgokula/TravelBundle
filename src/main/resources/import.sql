-- Clear existing data
TRUNCATE destination, flight, hotel, users RESTART IDENTITY CASCADE;

-- =============================================
-- 1. INSERT 20 DESTINATIONS
-- =============================================
INSERT INTO destination (name, country) VALUES
('Bali', 'Indonesia'),           -- 1
('Paris', 'France'),             -- 2
('Tokyo', 'Japan'),              -- 3
('New York', 'USA'),             -- 4
('London', 'UK'),                -- 5
('Rome', 'Italy'),               -- 6
('Dubai', 'UAE'),                -- 7
('Sydney', 'Australia'),         -- 8
('Bangkok', 'Thailand'),         -- 9
('Barcelona', 'Spain'),          -- 10
('Mykonos', 'Greece'),           -- 11
('Kyoto', 'Japan'),              -- 12
('Swiss Alps', 'Switzerland'),   -- 13
('Cape Town', 'South Africa'),   -- 14
('Rio de Janeiro', 'Brazil'),    -- 15
('Reykjavik', 'Iceland'),        -- 16
('Maldives', 'Maldives'),        -- 17
('Phuket', 'Thailand'),          -- 18
('Venice', 'Italy'),             -- 19
('Marrakech', 'Morocco');        -- 20

-- =============================================
-- 2. INSERT FLIGHTS (5+ per destination - varied dates, classes, prices)
-- =============================================
INSERT INTO flight (airline, departure_date, travel_class, price, available_seats, destination_id) VALUES

-- Bali (ID 1)
('AirAsia',           '2026-06-01 10:00:00', 'ECONOMY',  320.00, 50, 1),
('Singapore Airlines','2026-06-01 14:00:00', 'ECONOMY',  450.00, 20, 1),
('Garuda Indonesia',  '2026-06-02 08:30:00', 'BUSINESS', 800.00, 10, 1),
('Cathay Pacific',    '2026-06-15 11:00:00', 'ECONOMY',  380.00, 35, 1),
('Emirates',          '2026-06-15 22:00:00', 'BUSINESS', 950.00,  8, 1),
('Scoot',             '2026-07-01 06:00:00', 'ECONOMY',  290.00, 60, 1),

-- Paris (ID 2)
('Air France',        '2026-07-10 22:00:00', 'ECONOMY',  700.00, 30, 2),
('Lufthansa',         '2026-07-11 09:15:00', 'BUSINESS',1200.00, 15, 2),
('British Airways',   '2026-07-15 14:00:00', 'ECONOMY',  650.00, 40, 2),
('KLM',               '2026-07-20 08:00:00', 'ECONOMY',  580.00, 45, 2),
('Swiss International','2026-08-01 10:30:00','ECONOMY',  720.00, 25, 2),
('Air France',        '2026-08-10 18:00:00', 'BUSINESS',1350.00, 12, 2),

-- Tokyo (ID 3)
('Japan Airlines',    '2026-08-05 11:00:00', 'ECONOMY',  900.00, 45, 3),
('ANA',               '2026-08-05 16:30:00', 'ECONOMY',  850.00, 40, 3),
('Korean Air',        '2026-08-10 09:00:00', 'ECONOMY',  780.00, 50, 3),
('Singapore Airlines','2026-08-20 14:00:00', 'BUSINESS',1600.00, 10, 3),
('Cathay Pacific',    '2026-09-01 08:30:00', 'ECONOMY',  820.00, 35, 3),

-- New York (ID 4)
('Delta Airlines',    '2026-09-15 08:00:00', 'ECONOMY',  550.00, 60, 4),
('United Airlines',   '2026-09-15 14:00:00', 'BUSINESS',1500.00, 12, 4),
('American Airlines', '2026-09-20 10:00:00', 'ECONOMY',  490.00, 55, 4),
('Virgin Atlantic',   '2026-10-01 18:30:00', 'ECONOMY',  520.00, 40, 4),
('JetBlue',           '2026-10-10 07:00:00', 'ECONOMY',  460.00, 65, 4),

-- London (ID 5)
('British Airways',   '2026-10-01 10:30:00', 'ECONOMY',  600.00, 55, 5),
('Virgin Atlantic',   '2026-10-01 18:45:00', 'ECONOMY',  580.00, 50, 5),
('Ryanair',           '2026-10-15 06:00:00', 'ECONOMY',  180.00, 80, 5),
('EasyJet',           '2026-10-20 09:30:00', 'ECONOMY',  200.00, 70, 5),
('Lufthansa',         '2026-11-01 14:00:00', 'BUSINESS',1100.00, 18, 5),

-- Rome (ID 6)
('Alitalia',          '2026-06-15 12:00:00', 'ECONOMY',  400.00, 40, 6),
('Ryanair',           '2026-06-16 06:15:00', 'ECONOMY',   80.00, 30, 6),
('Vueling',           '2026-06-25 09:00:00', 'ECONOMY',  150.00, 50, 6),
('Iberia',            '2026-07-05 14:30:00', 'ECONOMY',  300.00, 35, 6),
('Lufthansa',         '2026-07-10 11:00:00', 'BUSINESS',  850.00, 12, 6),

-- Dubai (ID 7)
('Emirates',          '2026-11-20 23:30:00', 'FIRST',   5000.00,  5, 7),
('Etihad Airways',    '2026-11-21 02:00:00', 'BUSINESS',2500.00, 10, 7),
('flydubai',          '2026-11-25 10:00:00', 'ECONOMY',  450.00, 60, 7),
('Air Arabia',        '2026-12-01 08:00:00', 'ECONOMY',  380.00, 55, 7),
('Qatar Airways',     '2026-12-10 22:00:00', 'BUSINESS',2200.00, 15, 7),

-- Sydney (ID 8)
('Qantas',            '2026-12-05 21:00:00', 'ECONOMY', 1100.00, 35, 8),
('Jetstar',           '2026-12-06 07:00:00', 'ECONOMY',  750.00, 45, 8),
('Singapore Airlines','2026-12-15 14:00:00', 'BUSINESS',2100.00, 12, 8),
('Virgin Australia',  '2026-12-20 09:30:00', 'ECONOMY',  900.00, 40, 8),

-- Bangkok (ID 9)
('Thai Airways',      '2026-05-10 13:45:00', 'ECONOMY',  350.00, 50, 9),
('Cathay Pacific',    '2026-05-11 11:20:00', 'ECONOMY',  420.00, 30, 9),
('AirAsia',           '2026-05-20 06:00:00', 'ECONOMY',  150.00, 70, 9),
('Singapore Airlines','2026-06-01 10:00:00', 'BUSINESS',  900.00, 15, 9),
('Bangkok Airways',   '2026-06-10 14:00:00', 'ECONOMY',  280.00, 40, 9),

-- Barcelona (ID 10)
('Iberia',            '2026-06-20 09:00:00', 'ECONOMY',  450.00, 40, 10),
('Vueling',           '2026-06-21 15:30:00', 'ECONOMY',  120.00, 35, 10),
('Ryanair',           '2026-07-01 07:00:00', 'ECONOMY',   90.00, 80, 10),
('British Airways',   '2026-07-05 11:30:00', 'ECONOMY',  500.00, 30, 10),
('Air France',        '2026-07-15 14:00:00', 'BUSINESS',  950.00, 12, 10),

-- Mykonos (ID 11)
('Aegean Airlines',   '2026-07-05 10:00:00', 'ECONOMY',  300.00, 25, 11),
('Olympic Air',       '2026-07-06 14:15:00', 'ECONOMY',  280.00, 20, 11),
('Ryanair',           '2026-07-15 08:00:00', 'ECONOMY',  200.00, 40, 11),
('Lufthansa',         '2026-08-01 10:30:00', 'ECONOMY',  380.00, 30, 11),

-- Kyoto (ID 12)
('Peach Aviation',    '2026-08-15 08:30:00', 'ECONOMY',  150.00, 40, 12),
('Jetstar Japan',     '2026-08-16 11:00:00', 'ECONOMY',  140.00, 35, 12),
('ANA',               '2026-08-20 09:00:00', 'ECONOMY',  200.00, 30, 12),
('Japan Airlines',    '2026-09-01 13:00:00', 'BUSINESS',  550.00, 15, 12),

-- Swiss Alps (ID 13)
('Swiss International','2026-12-20 10:00:00','ECONOMY',  500.00, 30, 13),
('EasyJet',           '2026-12-21 07:45:00', 'ECONOMY',  150.00, 40, 13),
('Lufthansa',         '2026-12-25 09:00:00', 'BUSINESS', 1100.00, 10, 13),
('Air France',        '2027-01-05 14:00:00', 'ECONOMY',  480.00, 35, 13),

-- Cape Town (ID 14)
('South African Airways','2026-11-05 20:00:00','ECONOMY', 850.00, 30, 14),
('Kenya Airways',     '2026-11-06 12:30:00', 'ECONOMY',  700.00, 25, 14),
('Emirates',          '2026-11-15 22:00:00', 'BUSINESS',1800.00, 10, 14),
('Qatar Airways',     '2026-12-01 02:00:00', 'ECONOMY',  780.00, 35, 14),

-- Rio de Janeiro (ID 15)
('LATAM Airlines',    '2026-02-10 22:00:00', 'ECONOMY',  950.00, 40, 15),
('Gol Transportes',   '2026-02-11 09:15:00', 'ECONOMY',  800.00, 45, 15),
('American Airlines', '2026-03-01 14:00:00', 'ECONOMY',  880.00, 35, 15),
('TAP Air Portugal',  '2026-03-15 10:00:00', 'BUSINESS',1600.00, 12, 15),

-- Reykjavik (ID 16)
('Icelandair',        '2026-01-15 16:00:00', 'ECONOMY',  400.00, 30, 16),
('Play Air',          '2026-01-16 10:30:00', 'ECONOMY',  250.00, 35, 16),
('Icelandair',        '2026-06-01 14:00:00', 'ECONOMY',  380.00, 40, 16),
('Transavia',         '2026-06-15 09:00:00', 'ECONOMY',  290.00, 50, 16),

-- Maldives (ID 17)
('Maldivian',         '2026-03-05 14:00:00', 'ECONOMY',  500.00, 20, 17),
('Qatar Airways',     '2026-03-06 01:30:00', 'BUSINESS',2200.00, 10, 17),
('Emirates',          '2026-04-01 22:30:00', 'ECONOMY',  600.00, 25, 17),
('Singapore Airlines','2026-04-15 08:00:00', 'BUSINESS',2500.00,  8, 17),

-- Phuket (ID 18)
('Bangkok Airways',   '2026-04-12 11:00:00', 'ECONOMY',  120.00, 40, 18),
('AirAsia',           '2026-04-13 09:45:00', 'ECONOMY',   80.00, 50, 18),
('Thai Airways',      '2026-05-01 14:00:00', 'ECONOMY',  220.00, 35, 18),
('Singapore Airlines','2026-05-15 10:00:00', 'BUSINESS',  750.00, 12, 18),

-- Venice (ID 19)
('Lufthansa',         '2026-05-20 08:00:00', 'ECONOMY',  350.00, 30, 19),
('Alitalia',          '2026-05-21 13:20:00', 'ECONOMY',  300.00, 25, 19),
('Ryanair',           '2026-06-01 07:00:00', 'ECONOMY',  120.00, 55, 19),
('EasyJet',           '2026-06-10 09:30:00', 'ECONOMY',  160.00, 45, 19),

-- Marrakech (ID 20)
('Royal Air Maroc',   '2026-10-10 15:00:00', 'ECONOMY',  450.00, 30, 20),
('Ryanair',           '2026-10-11 08:30:00', 'ECONOMY',  100.00, 40, 20),
('Air Arabia',        '2026-10-20 10:00:00', 'ECONOMY',  180.00, 50, 20),
('Transavia',         '2026-11-01 14:00:00', 'ECONOMY',  220.00, 35, 20);

-- =============================================
-- 3. INSERT HOTELS (4+ per destination - varied star levels & prices)
-- =============================================
INSERT INTO hotel (name, price_per_night, available_rooms, rating, destination_id) VALUES

-- Bali (ID 1)
('Sunset Resort',            65.00,  10, 4.5, 1),
('Ocean Breeze Inn',         90.00,   5, 4.2, 1),
('Ubud Hanging Gardens',    250.00,   2, 4.9, 1),
('Bali Backpackers Hostel',  20.00,  30, 3.6, 1),
('The Mulia Resort',        400.00,   4, 4.8, 1),

-- Paris (ID 2)
('Hotel de Paris',          300.00,   5, 4.7, 2),
('ibis Paris Centre',       120.00,  15, 3.9, 2),
('Generator Paris Hostel',   35.00,  25, 3.7, 2),
('Le Marais Boutique',      180.00,  10, 4.4, 2),
('Ritz Paris',              900.00,   3, 5.0, 2),

-- Tokyo (ID 3)
('Park Hyatt Tokyo',        550.00,   3, 4.9, 3),
('Shinjuku Prince Hotel',   180.00,  20, 4.1, 3),
('Tokyo Backpackers',        30.00,  40, 3.8, 3),
('Andaz Tokyo',             400.00,   8, 4.7, 3),
('Richmond Hotel',          110.00,  25, 4.2, 3),

-- New York (ID 4)
('The Plaza',               700.00,   5, 4.8, 4),
('Holiday Inn Manhattan',   200.00,  25, 3.7, 4),
('HI NYC Hostel',            50.00,  60, 3.5, 4),
('Marriott Times Square',   350.00,  20, 4.3, 4),
('Pod 51',                  120.00,  30, 4.0, 4),

-- London (ID 5)
('The Savoy',               600.00,   4, 4.8, 5),
('Premier Inn London',      110.00,  30, 4.0, 5),
('Generator London',         35.00,  50, 3.8, 5),
('CitizenM London',         160.00,  25, 4.4, 5),
('St Ermin''s Hotel',       280.00,  15, 4.6, 5),

-- Rome (ID 6)
('Hotel Quirinale',         220.00,  12, 4.3, 6),
('Roma Termini Hostel',      45.00,  20, 3.5, 6),
('Fendi Private Suites',    600.00,   3, 4.9, 6),
('Borghese Palace Art Hotel',190.00,  10, 4.5, 6),
('The Yellow Hostel',        30.00,  35, 4.0, 6),

-- Dubai (ID 7)
('Burj Al Arab',           1500.00,   2, 5.0, 7),
('Atlantis The Palm',       450.00,  50, 4.7, 7),
('JW Marriott Marquis',     350.00,  30, 4.6, 7),
('Rove Downtown',           120.00,  40, 4.2, 7),
('XVA Art Hotel',            90.00,  15, 4.3, 7),

-- Sydney (ID 8)
('Park Hyatt Sydney',       600.00,   5, 4.9, 8),
('Sydney Harbour Marriott', 280.00,  15, 4.4, 8),
('Wake Up! Sydney',          40.00,  60, 4.0, 8),
('QT Sydney',               350.00,  18, 4.5, 8),

-- Bangkok (ID 9)
('Mandarin Oriental',       350.00,   8, 4.9, 9),
('Khao San Road Hostel',     15.00,  50, 3.2, 9),
('Novotel Bangkok',         130.00,  35, 4.2, 9),
('Capella Bangkok',         700.00,   5, 4.9, 9),
('Lub D Hostel',             25.00,  45, 4.1, 9),

-- Barcelona (ID 10)
('W Barcelona',             400.00,  10, 4.6, 10),
('Hotel Sagrada Familia',   140.00,  18, 4.2, 10),
('Generator Barcelona',      35.00,  50, 3.9, 10),
('Almanac Barcelona',       380.00,  12, 4.7, 10),
('Hostel One Paralelo',       22.00, 40, 4.3, 10),

-- Mykonos (ID 11)
('Cavo Tagoo',              800.00,   3, 4.9, 11),
('Mykonos View Hotel',      250.00,  10, 4.5, 11),
('Carbonaki Hotel',          90.00,  15, 4.1, 11),
('Semeli Hotel',            350.00,   8, 4.7, 11),

-- Kyoto (ID 12)
('The Ritz-Carlton Kyoto',  650.00,   5, 4.9, 12),
('Kyoto Guesthouse',         40.00,  15, 4.3, 12),
('Hyatt Regency Kyoto',     280.00,  18, 4.6, 12),
('Piece Hostel Kyoto',       28.00,  30, 4.4, 12),

-- Swiss Alps (ID 13)
('The Chedi Andermatt',     900.00,   4, 4.9, 13),
('Zermatt Ski Lodge',       300.00,   8, 4.6, 13),
('Hotel Bellerive',         140.00,  15, 4.2, 13),
('Youth Hostel Zermatt',     55.00,  20, 4.0, 13),

-- Cape Town (ID 14)
('The Silo Hotel',         1100.00,   2, 5.0, 14),
('V&A Waterfront Hotel',    350.00,  12, 4.5, 14),
('Ashanti Lodge',            45.00,  30, 4.2, 14),
('The Taj Cape Town',       400.00,  10, 4.7, 14),

-- Rio de Janeiro (ID 15)
('Copacabana Palace',       500.00,   5, 4.8, 15),
('Selina Lapa Rio',          60.00,  25, 4.2, 15),
('Mango Tree Hostel',        20.00,  40, 4.0, 15),
('Windsor Atlantica',       250.00,  15, 4.4, 15),

-- Reykjavik (ID 16)
('Blue Lagoon Silica Hotel',600.00,   3, 4.8, 16),
('Reykjavik City Hostel',    50.00,  20, 4.0, 16),
('Centerhotel Midgardur',   180.00,  15, 4.4, 16),
('Kex Hostel',               55.00,  25, 4.5, 16),

-- Maldives (ID 17)
('Soneva Jani',            2500.00,   1, 5.0, 17),
('Kurumba Maldives',        400.00,  20, 4.6, 17),
('Hard Rock Hotel Maldives',600.00,  10, 4.5, 17),
('Cinnamon Hakuraa Huraa',  250.00,  15, 4.3, 17),

-- Phuket (ID 18)
('Amanpuri',               1200.00,   2, 4.9, 18),
('Patong Beach Hotel',       80.00,  30, 3.8, 18),
('The Nai Harn',            300.00,  12, 4.8, 18),
('Lub D Phuket',             22.00,  40, 4.3, 18),

-- Venice (ID 19)
('Hotel Danieli',           700.00,   4, 4.7, 19),
('Generator Venice',         50.00,  40, 4.1, 19),
('Ca'' Sagredo Hotel',      450.00,   8, 4.8, 19),
('Hotel Ai Reali',          220.00,  12, 4.5, 19),

-- Marrakech (ID 20)
('La Mamounia',             800.00,   5, 4.9, 20),
('Riad Al Rimal',           120.00,   8, 4.5, 20),
('Equity Point Hostel',      18.00,  40, 4.0, 20),
('Mandarin Oriental Marrakech',550.00, 6, 4.8, 20);

-- =============================================
-- 4. INSERT TEST USERS
-- =============================================
INSERT INTO users (name, email, password) VALUES
('Test User',  'test@example.com',  'password123'),
('Alice Smith','alice@example.com', 'alice123'),
('Bob Traveler','bob@example.com',  'bob123');
