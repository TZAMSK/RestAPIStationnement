use stationnementsdb;

INSERT INTO stationnements (
    id,
    numero_municipal,
    rue, code_postal,
    longitude,
    latitude,
    panneau,
    heures_dispo,
    date_dispo
)
VALUES
    (uuid(), '1001', 'ajhawd aeas', 'H4N 0G5', -73.92123, 45.2345, 'IMAGE1', '1h', 'Dec'),
    (uuid(), '1002', 'ajhawd aeas', 'H4N 0G5', -73.92123, 45.2345, 'IMAGE2', '1h', 'Dec'),
    (uuid(), '1003', 'rue 1', 'H4N 0G6', -73.92130, 45.2346, 'IMAGE3', '2h', 'Jan'),
    (uuid(), '1004', 'rue 2', 'H4N 0G7', -73.92140, 45.2347, 'IMAGE4', '3h', 'Feb'),
    (uuid(), '1005', 'rue 3', 'H4N 0G8', -73.92150, 45.2348, 'IMAGE5', '4h', 'Mar'),
    (uuid(), '1006', 'rue 4', 'H4N 0G9', -73.92160, 45.2349, 'IMAGE6', '5h', 'Apr'),
    (uuid(), '1007', 'rue 5', 'H4N 1G1', -73.92170, 45.2350, 'IMAGE7', '6h', 'May'),
    (uuid(), '1008', 'rue 6', 'H4N 1G2', -73.92180, 45.2351, 'IMAGE8', '7h', 'Jun'),
    (uuid(), '1009', 'rue 7', 'H4N 1G3', -73.92190, 45.2352, 'IMAGE9', '8h', 'Jul'),
    (uuid(), '1010', 'rue 8', 'H4N 1G4', -73.92200, 45.2353, 'IMAGE10', '9h', 'Aug'),
    (uuid(), '1011', 'rue 9', 'H4N 1G5', -73.92210, 45.2354, 'IMAGE11', '10h', 'Sep'),
    (uuid(), '1012', 'rue 10', 'H4N 1G6', -73.92220, 45.2355, 'IMAGE12', '11h', 'Oct'),
    (uuid(), '1013', 'rue 11', 'H4N 1G7', -73.92230, 45.2356, 'IMAGE13', '12h', 'Nov'),
    (uuid(), '1014', 'rue 12', 'H4N 1G8', -73.92240, 45.2357, 'IMAGE14', '13h', 'Dec'),
    (uuid(), '1015', 'rue 13', 'H4N 1G9', -73.92250, 45.2358, 'IMAGE15', '14h', 'Jan'),
    (uuid(), '1016', 'rue 14', 'H4N 2G1', -73.92260, 45.2359, 'IMAGE16', '15h', 'Feb'),
    (uuid(), '1017', 'rue 15', 'H4N 2G2', -73.92270, 45.2360, 'IMAGE17', '16h', 'Mar'),
    (uuid(), '1018', 'rue 16', 'H4N 2G3', -73.92280, 45.2361, 'IMAGE18', '17h', 'Apr'),
    (uuid(), '1019', 'rue 17', 'H4N 2G4', -73.92290, 45.2362, 'IMAGE19', '18h', 'May'),
    (uuid(), '1020', 'rue 18', 'H4N 2G5', -73.92300, 45.2363, 'IMAGE20', '19h', 'Jun'),
    (uuid(), '1021', 'rue 19', 'H4N 2G6', -73.92310, 45.2364, 'IMAGE21', '20h', 'Jul'),
    (uuid(), '1022', 'rue 20', 'H4N 2G7', -73.92320, 45.2365, 'IMAGE22', '21h', 'Aug');
