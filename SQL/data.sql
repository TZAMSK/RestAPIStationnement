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
    heures_fin
)
VALUES
    (uuid(), '1001', 'ajhawd aeas', 'H4N 0G5', -73.92123, 45.2345, '/panneaux_images/SB-AC_NE-181.png', '09:00:00', '12:00:00'),
    (uuid(), '1002', 'ajhawd aeas', 'H4N 0G5', -73.92123, 45.2345, '/panneaux_images/SB-DB_NE-223.png', '13:00:00', '15:30:00'),
    (uuid(), '1003', 'rue 1', 'H4N 0G6', -73.92130, 45.2346, '/panneaux_images/SB-JZ_QE-0547.png', '08:00:00', '16:00:00'),
    (uuid(), '1004', 'rue 2', 'H4N 0G7', -73.92140, 45.2347, '/panneaux_images/SB-PB_QE-0877.png', '13:00:00', '16:00:00'),
    (uuid(), '1005', 'rue 3', 'H4N 0G8', -73.92150, 45.2348, '/panneaux_images/SB-PC_NE-182.png', '13:00:00', '16:00:00'),
    (uuid(), '1006', 'rue 4', 'H4N 0G9', -73.92160, 45.2349, '/panneaux_images/SB-RB_NE-178.png', '09:00:00', '15:00:00'),
    (uuid(), '1007', 'rue 5', 'H4N 1G1', -73.92170, 45.2350, '/panneaux_images/SB-RC_NE-463.png', '09:00:00', '16:00:00'),
    (uuid(), '1008', 'rue 6', 'H4N 1G2', -73.92180, 45.2351, '/panneaux_images/SB-US_NE-2312.png', '18:00:00', '00:00:00'),
    (uuid(), '1009', 'rue 7', 'H4N 1G3', -73.92190, 45.2352, '/panneaux_images/SS-JA_NE-204.png', '07:00:00', '19:00:00'),
    (uuid(), '1010', 'rue 8', 'H4N 1G4', -73.92200, 45.2353, '/panneaux_images/SS-JC_QE-0530.png', '08:00:00', '17:00:00'),
    (uuid(), '1011', 'rue 9', 'H4N 1G5', -73.92210, 45.2354, '/panneaux_images/SS-JL_NE-2119.png', '09:00:00', '21:00:00'),
    (uuid(), '1012', 'rue 10', 'H4N 1G6', -73.92220, 45.2355, '/panneaux_images/ST-AS_NE-1181.png', '09:00:00', '10:00:00'),
    (uuid(), '1013', 'rue 11', 'H4N 1G7', -73.92230, 45.2356, '/panneaux_images/SU-OA_NE-1970.png', '08:00:00', '16:00:00'),
    (uuid(), '1014', 'rue 12', 'H4N 1G8', -73.92240, 45.2357, '/panneaux_images/SV-JB_QE-0377.png', '08:00:00', '16:00:00'),
    (uuid(), '1015', 'rue 13', 'H4N 1G9', -73.92250, 45.2358, '/panneaux_images/SV-PN_NE-678.png', '16:00:00', '18:00:00'),
    (uuid(), '1016', 'rue 14', 'H4N 2G1', -73.92260, 45.2359, '/panneaux_images/SV-PP_NE-1037.png', '16:00:00', '17:00:00'),
    (uuid(), '1017', 'rue 15', 'H4N 2G2', -73.92270, 45.2360, '/panneaux_images/SV-PS_NE-1446.png', '13:00:00', '14:00:00'),
    (uuid(), '1018', 'rue 16', 'H4N 2G3', -73.92280, 45.2361, '/panneaux_images/SS-JA_NE-204.png', '07:00:00', '19:00:00'),
    (uuid(), '1019', 'rue 17', 'H4N 2G4', -73.92290, 45.2362, '/panneaux_images/SB-PC_NE-182.png', '13:00:00', '16:00:00'),
    (uuid(), '1020', 'rue 18', 'H4N 2G5', -73.92300, 45.2363, '/panneaux_images/SB-PB_QE-0877.png', '13:00:00', '16:00:00'),
    (uuid(), '1021', 'rue 19', 'H4N 2G6', -73.92310, 45.2364, '/panneaux_images/SB-AC_NE-181.png', '09:00:00', '12:00:00'),
    (uuid(), '1022', 'rue 20', 'H4N 2G7', -73.92320, 45.2365, '/panneaux_images/SV-PS_NE-1446.png', '13:00:00', '14:00:00');