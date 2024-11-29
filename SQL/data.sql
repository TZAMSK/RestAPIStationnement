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
    (uuid(), '3571', 'Rue Beaubien', 'H1X 1H1', -73.583856, 45.557873, '/panneaux_images/SB-AC_NE-181.png', '09:00:00', '12:00:00'),
    (uuid(), '3642', 'Rue Beaubien', 'H1X 1G2', -73.588192, 45.557309, '/panneaux_images/SB-AC_NE-181.png', '09:00:00', '12:00:00'),
    (uuid(), '3561', 'Rue Beaubien', 'H1X 1G5', -73.590612, 45.556543, '/panneaux_images/SB-AC_NE-181.png', '09:00:00', '12:00:00'),
	(uuid(), '3370', 'Rue Bélanger', 'H1X 1A3', -73.592942, 45.558541, '/panneaux_images/SB-AC_NE-181.png', '09:00:00', '12:00:00'),

	(uuid(), '6411', '23e Avenue', 'H1T 3N4', -73.576743, 45.562682, '/panneaux_images/SB-DB_NE-223.png', '13:00:00', '15:30:00'),
	(uuid(), '3454', 'Rue Beaubien', 'H1X 1G1', -73.589946, 45.556087, '/panneaux_images/SB-DB_NE-223.png', '13:00:00', '15:30:00'),
    (uuid(), '3535', 'Rue Beaubien', 'H1X 1G7', -73.583420, 45.557371, '/panneaux_images/SB-DB_NE-223.png', '13:00:00', '15:30:00'),

    (uuid(), '3425', 'Rue Beaubien', 'H1X 1G8', -73.585094, 45.556506, '/panneaux_images/SB-JZ_QE-0547.png', '08:00:00', '16:00:00'),
    (uuid(), '3589', 'Bb Rosemont', 'H1X 1L6', -73.577818, 45.556938, '/panneaux_images/SB-JZ_QE-0547.png', '08:00:00', '16:00:00'),

    (uuid(), '3571', 'Bb Rosemont', 'H1X 1L1', -73.578099, 45.5565070, '/panneaux_images/SB-PB_QE-0877.png', '13:00:00', '16:00:00'),
    (uuid(), '3617', 'Bb Rosemont', 'H1X 1L5', -73.578404, 45.556763, '/panneaux_images/SB-PB_QE-0877.png', '13:00:00', '16:00:00'),
    (uuid(), '2762', 'Rue Beaubien', 'H1Y 1G8', -73.589573, 45.551411, '/panneaux_images/SB-PB_QE-0877.png', '13:00:00', '16:00:00'),
    (uuid(), '6823', '21e Avenue', 'H1X 2G9', -73.586096, 45.563659, '/panneaux_images/SB-PB_QE-0877.png', '13:00:00', '16:00:00'),

    (uuid(), '3603', 'Bb Rosemont', 'H1X 1L1', -73.577736, 45.556400, '/panneaux_images/SB-PC_NE-182.png', '13:00:00', '16:00:00'),
    (uuid(), '3674', 'Bb Rosemont', 'H1X 1L7', -73.577745, 45.556596, '/panneaux_images/SB-PC_NE-182.png', '13:00:00', '16:00:00'),
    (uuid(), '3620', 'Rue Saint-Zotique', 'H1X 1E4', -73.587421, 45.559276, '/panneaux_images/SB-PC_NE-182.png', '13:00:00', '16:00:00'),

    (uuid(), '3660', 'Bb Rosemont', 'H1X 1L2', -73.577209, 45.556794, '/panneaux_images/SB-RB_NE-178.png', '09:00:00', '15:00:00'),
    (uuid(), '3284', 'Rue Beaubien', 'H1X 1G2', -73.586239, 45.555609, '/panneaux_images/SB-RB_NE-178.png', '09:00:00', '15:00:00'),
        (uuid(), '6312', 'Rue Jarry', 'H2E 1Y6', -73.643292, 45.560142, '/panneaux_images/SB-RB_NE-178.png', '09:00:00', '15:00:00'),
    (uuid(), '5778', 'Avenue Van Horne', 'H2V 3G1', -73.619563, 45.515874, '/panneaux_images/SB-RB_NE-178.png', '09:00:00', '15:00:00'),
    (uuid(), '5364', 'Rue Sherbrooke', 'H3A 1B5', -73.579624, 45.506372, '/panneaux_images/SB-RB_NE-178.png', '09:00:00', '15:00:00'),
    (uuid(), '6293', 'Rue Beaubien', 'H2S 2P7', -73.612920, 45.528929, '/panneaux_images/SB-RB_NE-178.png', '09:00:00', '15:00:00'),

    (uuid(), '3299', 'Rue Beaubien', 'H1X 1G4', -73.586063, 45.555320, '/panneaux_images/SB-RC_NE-463.png', '09:00:00', '16:00:00'),
        (uuid(), '5984', 'Avenue Papineau', 'H2K 1W4', -73.574370, 45.527520, '/panneaux_images/SB-RC_NE-463.png', '09:00:00', '16:00:00'),
    (uuid(), '6612', 'Boulevard Saint-Laurent', 'H2X 1S7', -73.579314, 45.523167, '/panneaux_images/SB-RC_NE-463.png', '09:00:00', '16:00:00'),
    (uuid(), '6708', 'Rue de la Montagne', 'H3G 1Z5', -73.586913, 45.494799, '/panneaux_images/SB-RC_NE-463.png', '09:00:00', '16:00:00'),
    (uuid(), '5892', 'Boulevard Pie-IX', 'H1V 3A2', -73.562024, 45.557866, '/panneaux_images/SB-RC_NE-463.png', '09:00:00', '16:00:00'),
    (uuid(), '6072', 'Avenue Henri-Julien', 'H2T 2S6', -73.591327, 45.532964, '/panneaux_images/SB-RC_NE-463.png', '09:00:00', '16:00:00'),
    (uuid(), '6500', 'Rue des Pins', 'H2W 1P9', -73.604245, 45.526918, '/panneaux_images/SB-RC_NE-463.png', '09:00:00', '16:00:00'),

    (uuid(), '6507', '10e Avenue', 'H1Y 2H8', -73.587830, 45.554600, '/panneaux_images/SB-US_NE-2312.png', '18:00:00', '00:00:00'),
    (uuid(), '6392', '10e Avenue', 'H1Y 2H10', -73.588532, 45.553961, '/panneaux_images/SB-US_NE-2312.png', '18:00:00', '00:00:00'),
    (uuid(), '6189', 'BD Saint-Michel', 'H1Y E30', -73.582765, 45.553116, '/panneaux_images/SB-US_NE-2312.png', '18:00:00', '00:00:00'),
    (uuid(), '6756', '20e Avenue', 'H1X 2J9', -73.586228, 45.562443, '/panneaux_images/SB-US_NE-2312.png', '18:00:00', '00:00:00'),
    (uuid(), '6683', '21e Avenue', 'H1X 2G8', -73.584062, 45.562188, '/panneaux_images/SB-US_NE-2312.png', '18:00:00', '00:00:00'),
    (uuid(), '3626', 'Rue Saint-Zotique', 'H1X 1E6', -73.588248, 45.559659, '/panneaux_images/SB-US_NE-2312.png', '18:00:00', '00:00:00'),

    (uuid(), '6050', ' BD Saint-Michel', 'H1Y E25', -73.581698, 45.553640, '/panneaux_images/SS-JA_NE-204.png', '07:00:00', '19:00:00'),
    (uuid(), '6691', '21e Avenue', 'H1X 2G6', -73.582246, 45.562449, '/panneaux_images/SS-JA_NE-204.png', '07:00:00', '19:00:00'),
    (uuid(), '5187', 'Avenue du Parc', 'H2V 4C7', -73.609276, 45.514743, '/panneaux_images/SS-JA_NE-204.png', '07:00:00', '19:00:00'),
    (uuid(), '5476', 'Rue Saint-Denis', 'H2X 3K8', -73.595350, 45.521974, '/panneaux_images/SS-JA_NE-204.png', '07:00:00', '19:00:00'),
    (uuid(), '5601', 'Boulevard de Acadie', 'H3T 1C8', -73.637126, 45.495312, '/panneaux_images/SS-JA_NE-204.png', '07:00:00', '19:00:00'),

    (uuid(), '6545', '9e Avenue', 'H1Y 2K7', -73.584843, 45.553012, '/panneaux_images/SS-JC_QE-0530.png', '08:00:00', '17:00:00'),
        (uuid(), '5423', 'Rue Notre-Dame', 'H3C 1H3', -73.549861, 45.485964, '/panneaux_images/SS-JC_QE-0530.png', '08:00:00', '17:00:00'),
    (uuid(), '5678', 'Boulevard René-Lévesque', 'H3B 1X7', -73.566879, 45.504076, '/panneaux_images/SS-JC_QE-0530.png', '08:00:00', '17:00:00'),
    (uuid(), '6615', 'Rue Saint-Hubert', 'H2J 2Z4', -73.589904, 45.536130, '/panneaux_images/SS-JC_QE-0530.png', '08:00:00', '17:00:00'),
    (uuid(), '5764', 'Rue Parc', 'H3P 2A1', -73.647659, 45.490239, '/panneaux_images/SS-JC_QE-0530.png', '08:00:00', '17:00:00'),
    (uuid(), '6128', 'Boulevard Saint-Joseph', 'H2H 1G3', -73.592911, 45.546102, '/panneaux_images/SS-JC_QE-0530.png', '08:00:00', '17:00:00'),
    (uuid(), '6333', 'Avenue Beaconsfield', 'H4X 2H9', -73.602430, 45.470117, '/panneaux_images/SS-JC_QE-0530.png', '08:00:00', '17:00:00'),
    (uuid(), '6359', 'Avenue du Mont-Royal', 'H2S 1T3', -73.626385, 45.523106, '/panneaux_images/SS-JC_QE-0530.png', '08:00:00', '17:00:00'),

    (uuid(), '6474', '6e Avenue', 'H1Y 2R6', -73.587719, 45.551943, '/panneaux_images/SS-JL_NE-2119.png', '09:00:00', '21:00:00'),
        (uuid(), '5867', 'Rue Legendre', 'H3N 1S7', -73.633029, 45.518072, '/panneaux_images/SS-JL_NE-2119.png', '09:00:00', '21:00:00'),
    (uuid(), '6541', 'Boulevard De La Côte-des-Neiges', 'H3S 1Z2', -73.613763, 45.488968, '/panneaux_images/SS-JL_NE-2119.png', '09:00:00', '21:00:00'),
    (uuid(), '6115', 'Avenue du Parc', 'H2V 4M6', -73.609023, 45.511689, '/panneaux_images/SS-JL_NE-2119.png', '09:00:00', '21:00:00'),
    (uuid(), '6001', 'Boulevard Saint-Michel', 'H2J 3G2', -73.588593, 45.530251, '/panneaux_images/SS-JL_NE-2119.png', '09:00:00', '21:00:00'),
    (uuid(), '6681', 'Rue Saint-Viateur', 'H2T 1Z6', -73.604502, 45.526779, '/panneaux_images/SS-JL_NE-2119.png', '09:00:00', '21:00:00'),
    (uuid(), '5600', 'Avenue Saint-Charles', 'H3M 1C2', -73.656206, 45.472363, '/panneaux_images/SS-JL_NE-2119.png', '09:00:00', '21:00:00'),

    (uuid(), '6498', '3e Avenue', 'H1Y 2X5', -73.588266, 45.551270, '/panneaux_images/ST-AS_NE-1181.png', '09:00:00', '10:00:00'),
        (uuid(), '5722', 'Rue des Érables', 'H2J 3X9', -73.589206, 45.543926, '/panneaux_images/ST-AS_NE-1181.png', '09:00:00', '10:00:00'),
    (uuid(), '6321', 'Boulevard Henri-Bourassa', 'H3L 1A3', -73.707120, 45.507418, '/panneaux_images/ST-AS_NE-1181.png', '09:00:00', '10:00:00'),
    (uuid(), '6752', 'Rue Saint-Antoine', 'H3J 1G1', -73.578989, 45.478821, '/panneaux_images/ST-AS_NE-1181.png', '09:00:00', '10:00:00'),
    (uuid(), '5690', 'Rue Laurier', 'H2T 1P4', -73.601132, 45.522402, '/panneaux_images/ST-AS_NE-1181.png', '09:00:00', '10:00:00'),

    (uuid(), '2661', 'Rue Beaubien', 'H1Y 1G8', -73.589576, 45.551259, '/panneaux_images/SU-OA_NE-1970.png', '08:00:00', '16:00:00'),
        (uuid(), '5448', 'Avenue De L\'Hospital', 'H2X 1A5', -73.589317, 45.537271, '/panneaux_images/SU-OA_NE-1970.png', '08:00:00', '16:00:00'),
    (uuid(), '5930', 'Boulevard Gouin', 'H4N 1C9', -73.715973, 45.470011, '/panneaux_images/SU-OA_NE-1970.png', '08:00:00', '16:00:00'),
    (uuid(), '5745', 'Avenue D\'Outremont', 'H2V 3J2', -73.607241, 45.518798, '/panneaux_images/SU-OA_NE-1970.png', '08:00:00', '16:00:00'),

    (uuid(), '6420', '2e Avenue', 'H1Y 2Z2', -73.589072, 45.550667, '/panneaux_images/SV-JB_QE-0377.png', '08:00:00', '16:00:00'),
    (uuid(), '6486', '3e Avenue', 'H1Y 2X7', -73.589346, 45.551282, '/panneaux_images/SV-JB_QE-0377.png', '08:00:00', '16:00:00'),
        (uuid(), '6329', 'Boulevard de la Côte-des-Neiges', 'H3S 1Z7', -73.607276, 45.489206, '/panneaux_images/SV-JB_QE-0377.png', '08:00:00', '16:00:00'),
    (uuid(), '6175', 'Rue Charlevoix', 'H4J 1V5', -73.587423, 45.469229, '/panneaux_images/SV-JB_QE-0377.png', '08:00:00', '16:00:00'),
    (uuid(), '5481', 'Rue Parthenais', 'H2L 1A9', -73.556907, 45.538036, '/panneaux_images/SV-JB_QE-0377.png', '08:00:00', '16:00:00'),

    (uuid(), '6401', '23e Avenue', 'H1T 3N2', -73.577292, 45.562667, '/panneaux_images/SV-PN_NE-678.png', '16:00:00', '18:00:00'),
        (uuid(), '6412', 'Avenue Tache', 'H2K 4S9', -73.560019, 45.536072, '/panneaux_images/SV-PN_NE-678.png', '16:00:00', '18:00:00'),
    (uuid(), '5637', 'Boulevard de l\'Acadie', 'H3T 1P6', -73.623794, 45.493626, '/panneaux_images/SV-PN_NE-678.png', '16:00:00', '18:00:00'),
    (uuid(), '6513', 'Rue de la Visitation', 'H2X 2B3', -73.578239, 45.523953, '/panneaux_images/SV-PN_NE-678.png', '16:00:00', '18:00:00'),

    (uuid(), '6320', '24e Avenue', 'H1T 3M5', -73.576668, 45.563166, '/panneaux_images/SV-PP_NE-1037.png', '16:00:00', '17:00:00'),
    (uuid(), '6414', '2e Avenue', 'H1Y 2Z4', -73.589587, 45.550748, '/panneaux_images/SV-PP_NE-1037.png', '16:00:00', '17:00:00'),
    (uuid(), '6820', '21e Avenue', 'H1X 2G11', -73.587017, 45.563907, '/panneaux_images/SV-PP_NE-1037.png', '16:00:00', '17:00:00'),
    (uuid(), '3368', 'Rue Bélanger', 'H1X 1A5', -73.593334, 45.558701, '/panneaux_images/SV-PP_NE-1037.png', '16:00:00', '17:00:00'),
    (uuid(), '6981', '12e Avenue', 'H2A 3P4', -73.594741, 45.558671, '/panneaux_images/SV-PP_NE-1037.png', '16:00:00', '17:00:00'),

    (uuid(), '6750', '20e Avenue', 'H1X 2J7', -73.585755, 45.562645, '/panneaux_images/SV-PS_NE-1446.png', '13:00:00', '14:00:00'),
    (uuid(), '6976', '12e Avenue', 'H2A 3P2', -73.594077, 45.558286, '/panneaux_images/SV-PS_NE-1446.png', '13:00:00', '14:00:00'),
    (uuid(), '6609', '9e Avenue', 'H1Y 2K9', -73.585348, 45.552659, '/panneaux_images/SV-PS_NE-1446.png', '13:00:00', '14:00:00'),
    (uuid(), '6741', '6e Avenue', 'H1Y 2R8', -73.589033, 45.551782, '/panneaux_images/SV-PS_NE-1446.png', '13:00:00', '14:00:00'),
    (uuid(), '6306', '24e Avenue', 'H1T 3M7', -73.576522, 45.563081, '/panneaux_images/SV-PS_NE-1446.png', '13:00:00', '14:00:00');
