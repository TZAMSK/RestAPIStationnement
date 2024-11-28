USE stationnementsdb;

INSERT INTO stationnements (
    id,
    numero_municipal,
    rue,
    code_postal,
    longitude,
    latitude,
    panneau,
    heures_debut,
    heures_fin,
    date_dispo
)
VALUES
    (uuid(), '1001', 'ajhawd aeas', 'H4N 0G5', -73.92123, 45.2345, 'IMAGE1', '08:00:00', '09:00:00', 'Dec'),
    (uuid(), '1002', 'ajhawd aeas', 'H4N 0G5', -73.92123, 45.2345, 'IMAGE2', '09:00:00', '10:00:00', 'Dec'),
    (uuid(), '1003', 'rue 1', 'H4N 0G6', -73.92130, 45.2346, 'IMAGE3', '10:00:00', '12:00:00', 'Jan'),
    (uuid(), '1004', 'rue 2', 'H4N 0G7', -73.92140, 45.2347, 'IMAGE4', '11:00:00', '13:00:00', 'Feb'),
    (uuid(), '1005', 'rue 3', 'H4N 0G8', -73.92150, 45.2348, 'IMAGE5', '12:00:00', '14:00:00', 'Mar'),
    (uuid(), '1006', 'rue 4', 'H4N 0G9', -73.92160, 45.2349, 'IMAGE6', '13:00:00', '15:00:00', 'Apr'),
    (uuid(), '1007', 'rue 5', 'H4N 1G1', -73.92170, 45.2350, 'IMAGE7', '14:00:00', '16:00:00', 'May'),
    (uuid(), '1008', 'rue 6', 'H4N 1G2', -73.92180, 45.2351, 'IMAGE8', '15:00:00', '17:00:00', 'Jun'),
    (uuid(), '1009', 'rue 7', 'H4N 1G3', -73.92190, 45.2352, 'IMAGE9', '16:00:00', '18:00:00', 'Jul'),
    (uuid(), '1010', 'rue 8', 'H4N 1G4', -73.92200, 45.2353, 'IMAGE10', '17:00:00', '19:00:00', 'Aug'),
    (uuid(), '1011', 'rue 9', 'H4N 1G5', -73.92210, 45.2354, 'IMAGE11', '18:00:00', '20:00:00', 'Sep'),
    (uuid(), '1012', 'rue 10', 'H4N 1G6', -73.92220, 45.2355, 'IMAGE12', '19:00:00', '21:00:00', 'Oct'),
    (uuid(), '1013', 'rue 11', 'H4N 1G7', -73.92230, 45.2356, 'IMAGE13', '20:00:00', '22:00:00', 'Nov'),
    (uuid(), '1014', 'rue 12', 'H4N 1G8', -73.92240, 45.2357, 'IMAGE14', '21:00:00', '23:00:00', 'Dec'),
    (uuid(), '1015', 'rue 13', 'H4N 1G9', -73.92250, 45.2358, 'IMAGE15', '22:00:00', '00:00:00', 'Jan'),
    (uuid(), '1016', 'rue 14', 'H4N 2G1', -73.92260, 45.2359, 'IMAGE16', '23:00:00', '01:00:00', 'Feb'),
    (uuid(), '1017', 'rue 15', 'H4N 2G2', -73.92270, 45.2360, 'IMAGE17', '00:00:00', '02:00:00', 'Mar'),
    (uuid(), '1018', 'rue 16', 'H4N 2G3', -73.92280, 45.2361, 'IMAGE18', '01:00:00', '03:00:00', 'Apr'),
    (uuid(), '1019', 'rue 17', 'H4N 2G4', -73.92290, 45.2362, 'IMAGE19', '02:00:00', '04:00:00', 'May'),
    (uuid(), '1020', 'rue 18', 'H4N 2G5', -73.92300, 45.2363, 'IMAGE20', '03:00:00', '05:00:00', 'Jun'),
    (uuid(), '1021', 'rue 19', 'H4N 2G6', -73.92310, 45.2364, 'IMAGE21', '04:00:00', '06:00:00', 'Jul'),
    (uuid(), '1022', 'rue 20', 'H4N 2G7', -73.92320, 45.2365, 'IMAGE22', '05:00:00', '07:00:00', 'Aug');