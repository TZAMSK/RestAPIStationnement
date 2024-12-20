USE stationnementsdb;

INSERT INTO stationnements (
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
    ('3571', 'Rue Beaubien', 'H1X 1H1', -73.583889, 45.557855, '/panneaux_images/SB-AC_NE-181.png', '09:00:00', '12:00:00'),
    ('3642', 'Rue Beaubien', 'H1X 1G2', -73.579645, 45.562631, '/panneaux_images/SB-AC_NE-181.png', '09:00:00', '12:00:00'),
    ('3561', 'Rue Beaubien', 'H1X 1G5', -73.584195, 45.557525, '/panneaux_images/SB-AC_NE-181.png', '09:00:00', '12:00:00'),
	('3370', 'Rue Bélanger', 'H1X 1A3', -73.592950, 45.558501, '/panneaux_images/SB-AC_NE-181.png', '09:00:00', '12:00:00'),

	('6411', '23e Avenue', 'H1T 3N4', -73.577413, 45.562716, '/panneaux_images/SB-DB_NE-223.png', '13:00:00', '15:30:00'),
	('3454', 'Rue Beaubien', 'H1X 1G1', -73.584952, 45.556564, '/panneaux_images/SB-DB_NE-223.png', '13:00:00', '15:30:00'),
    ('3535', 'Rue Beaubien', 'H1X 1G7', -73.584428, 45.557270, '/panneaux_images/SB-DB_NE-223.png', '13:00:00', '15:30:00'),

    ('3425', 'Rue Beaubien', 'H1X 1G8', -73.585118, 45.556478, '/panneaux_images/SB-JZ_QE-0547.png', '08:00:00', '16:00:00'),
    ('3880', 'Bb Rosemont', 'H1X 1L6', -73.575519, 45.558717, '/panneaux_images/SB-JZ_QE-0547.png', '08:00:00', '16:00:00'),

    ('3587', 'Bb Rosemont', 'H1X 1L1', -73.577781, 45.556369, '/panneaux_images/SB-PB_QE-0877.png', '13:00:00', '16:00:00'),
    ('3855', 'Bb Rosemont', 'H1X 1L5', -73.576001, 45.558465, '/panneaux_images/SB-PB_QE-0877.png', '13:00:00', '16:00:00'),
    ('2762', 'Rue Beaubien', 'H1Y 1G8', -73.588737, 45.552139, '/panneaux_images/SB-PB_QE-0877.png', '13:00:00', '16:00:00'),
    ('6823', '21e Avenue', 'H1X 2G9', -73.586010, 45.563621, '/panneaux_images/SB-PB_QE-0877.png', '13:00:00', '16:00:00'),

    ('3603', 'Bb Rosemont', 'H1X 1L1', -73.577736, 45.556400, '/panneaux_images/SB-PC_NE-182.png', '13:00:00', '16:00:00'),
    ('3674', 'Bb Rosemont', 'H1X 1L7', -73.577745, 45.556596, '/panneaux_images/SB-PC_NE-182.png', '13:00:00', '16:00:00'),
    ('3620', 'Rue Saint-Zotique', 'H1X 1E4', -73.587400, 45.559273, '/panneaux_images/SB-PC_NE-182.png', '13:00:00', '16:00:00'),

    ('3650', 'Bb Rosemont', 'H1X 1L2', -73.577349, 45.556613, '/panneaux_images/SB-RB_NE-178.png', '09:00:00', '15:00:00'),
    ('3284', 'Rue Beaubien', 'H1X 1G2', -73.585767, 45.555560, '/panneaux_images/SB-RB_NE-178.png', '09:00:00', '15:00:00'),
	('6312', 'Rue Jarry', 'H2E 1Y6', -73.583031, 45.593369, '/panneaux_images/SB-RB_NE-178.png', '09:00:00', '15:00:00'),
    ('5778', 'Avenue Van Horne', 'H2V 3G1', -73.644493, 45.486976, '/panneaux_images/SB-RB_NE-178.png', '09:00:00', '15:00:00'),
    ('5364', 'Rue Sherbrooke', 'H3A 1B5', -73.551821, 45.569018, '/panneaux_images/SB-RB_NE-178.png', '09:00:00', '15:00:00'),
    ('6293', 'Rue Beaubien', 'H2S 2P7', -73.562766, 45.584525, '/panneaux_images/SB-RB_NE-178.png', '09:00:00', '15:00:00'),

    ('3299', 'Rue Beaubien', 'H1X 1G4', -73.585830, 45.555629, '/panneaux_images/SB-RC_NE-463.png', '09:00:00', '16:00:00'),
	('5984', 'Avenue Papineau', 'H2K 1W4', -73.592170, 45.541006, '/panneaux_images/SB-RC_NE-463.png', '09:00:00', '16:00:00'),
    ('6612', 'Boulevard Saint-Laurent', 'H2X 1S7', -73.611972, 45.531799, '/panneaux_images/SB-RC_NE-463.png', '09:00:00', '16:00:00'),
    ('6708', 'Rue de la Montagne', 'H3G 1Z5', -73.583357, 45.501913, '/panneaux_images/SB-RC_NE-463.png', '09:00:00', '16:00:00'),
    ('5892', 'Boulevard Pie-IX', 'H1V 3A2', -73.574436, 45.560880, '/panneaux_images/SB-RC_NE-463.png', '09:00:00', '16:00:00'),
    ('6072', 'Avenue Henri-Julien', 'H2T 2S6', -73.602467, 45.531215, '/panneaux_images/SB-RC_NE-463.png', '09:00:00', '16:00:00'),
    ('6500', 'Rue des Pins', 'H2W 1P9', -73.581020, 45.505693, '/panneaux_images/SB-RC_NE-463.png', '09:00:00', '16:00:00'),

    ('6507', '10e Avenue', 'H1Y 2H8', -73.587287, 45.554431, '/panneaux_images/SB-US_NE-2312.png', '18:00:00', '00:00:00'),
    ('6392', '10e Avenue', 'H1Y 2H10', -73.585912, 45.554026, '/panneaux_images/SB-US_NE-2312.png', '18:00:00', '00:00:00'),
    ('6189', 'BD Saint-Michel', 'H1Y E30', -73.582823, 45.554063, '/panneaux_images/SB-US_NE-2312.png', '18:00:00', '00:00:00'),
    ('6756', '20e Avenue', 'H1X 2J9', -73.585744, 45.562648, '/panneaux_images/SB-US_NE-2312.png', '18:00:00', '00:00:00'),
    ('6683', '21e Avenue', 'H1X 2G8', -73.583365, 45.562824, '/panneaux_images/SB-US_NE-2312.png', '18:00:00', '00:00:00'),
    ('3626', 'Rue Saint-Zotique', 'H1X 1E6', -73.587382, 45.559318, '/panneaux_images/SB-US_NE-2312.png', '18:00:00', '00:00:00'),

    ('6050', 'BD Saint-Michel', 'H1Y E25', -73.582522, 45.553909, '/panneaux_images/SS-JA_NE-204.png', '07:00:00', '19:00:00'),
    ('6691', '21e Avenue', 'H1X 2G6', -73.583792, 45.562926, '/panneaux_images/SS-JA_NE-204.png', '07:00:00', '19:00:00'),
    ('5187', 'Avenue du Parc', 'H2V 4C7', -73.597456, 45.520412, '/panneaux_images/SS-JA_NE-204.png', '07:00:00', '19:00:00'),
    ('5476', 'Rue Saint-Denis', 'H2X 3K8', -73.594316, 45.529082, '/panneaux_images/SS-JA_NE-204.png', '07:00:00', '19:00:00'),
    ('5601', 'Boulevard de Acadie', 'H3T 1C8', -73.623584, 45.523583, '/panneaux_images/SS-JA_NE-204.png', '07:00:00', '19:00:00'),

    ('6545', '9e Avenue', 'H1Y 2K7', -73.588465, 45.554125, '/panneaux_images/SS-JC_QE-0530.png', '08:00:00', '17:00:00'),
	('5423', 'Rue Notre-Dame', 'H4C 1T7', -73.596285, 45.468403, '/panneaux_images/SS-JC_QE-0530.png', '08:00:00', '17:00:00'),
    ('5678', 'Boulevard René-Lévesque', 'H3B 1X7', -73.568193, 45.501020, '/panneaux_images/SS-JC_QE-0530.png', '08:00:00', '17:00:00'),
    ('6615', 'Rue Saint-Hubert', 'H2S 2M5', -73.604945, 45.536977, '/panneaux_images/SS-JC_QE-0530.png', '08:00:00', '17:00:00'),
    ('5764', 'Rue Parc', 'H3P 2A1', -73.605403, 45.523542, '/panneaux_images/SS-JC_QE-0530.png', '08:00:00', '17:00:00'),
    ('6128', 'Boulevard Saint-Joseph', 'H2H 1G3', -73.568397, 45.549159, '/panneaux_images/SS-JC_QE-0530.png', '08:00:00', '17:00:00'),
    ('6333', 'Avenue Beaconsfield', 'H4A 2H9', -73.634041, 45.472470, '/panneaux_images/SS-JC_QE-0530.png', '08:00:00', '17:00:00'),
    ('6359', 'Avenue du Mont-Royal', 'H1X 1X9', -73.560032, 45.554133, '/panneaux_images/SS-JC_QE-0530.png', '08:00:00', '17:00:00'),

    ('6474', '6e Avenue', 'H1Y 2R6', -73.588920, 45.552302, '/panneaux_images/SS-JL_NE-2119.png', '09:00:00', '21:00:00'),
	('5867', 'Rue Legendre', 'H2M 1E9', -73.646377, 45.546271, '/panneaux_images/SS-JL_NE-2119.png', '09:00:00', '21:00:00'),
    ('6185', 'Chemin Hudson', 'H3S 2G9', -73.627671, 45.505284, '/panneaux_images/SS-JL_NE-2119.png', '09:00:00', '21:00:00'),
    ('6115', 'Avenue du Parc', 'H2V 4H4', -73.609791, 45.525611, '/panneaux_images/SS-JL_NE-2119.png', '09:00:00', '21:00:00'),
    ('6001', 'Boulevard Saint-Michel', 'H1Y 3H1', -73.565336, 45.548858, '/panneaux_images/SS-JL_NE-2119.png', '09:00:00', '21:00:00'),
    ('5501', 'Rue Saint-Urbain', 'H2T 2W6', -73.599757, 45.524603, '/panneaux_images/SS-JL_NE-2119.png', '09:00:00', '21:00:00'),
    ('5600', 'Avenue Saint-Charles', 'H2C 2L1', -73.651958, 45.555545, '/panneaux_images/SS-JL_NE-2119.png', '09:00:00', '21:00:00'),

    ('6498', '3e Avenue', 'H1Y 2X5', -73.589158, 45.551685, '/panneaux_images/ST-AS_NE-1181.png', '09:00:00', '10:00:00'),
	('5722', 'Rue des Érables', 'H2G 2L8', -73.585806, 45.542273, '/panneaux_images/ST-AS_NE-1181.png', '09:00:00', '10:00:00'),
    ('11546', 'Ave L Archevêque', 'H1H 3B3', -73.634438, 45.601144, '/panneaux_images/ST-AS_NE-1181.png', '09:00:00', '10:00:00'),
    ('3582', 'Rue Saint-Antoine', 'H4C 1B2', -73.585078, 45.482319, '/panneaux_images/ST-AS_NE-1181.png', '09:00:00', '10:00:00'),
    ('5690', 'Rue Laurier', 'H1X 1T9', -73.570427, 45.550897, '/panneaux_images/ST-AS_NE-1181.png', '09:00:00', '10:00:00'),

    ('2661', 'Rue Beaubien', 'H1Y 1G8', -73.589558, 45.551312, '/panneaux_images/SU-OA_NE-1970.png', '08:00:00', '16:00:00'),
	('336', 'St Louis Square St', 'H2X 1A5', -73.569235, 45.517066, '/panneaux_images/SU-OA_NE-1970.png', '08:00:00', '16:00:00'),
    ('5930', 'Boulevard Gouin', 'H4J 1E6', -73.721279, 45.531658, '/panneaux_images/SU-OA_NE-1970.png', '08:00:00', '16:00:00'),
    ('2319', 'Bd Keller', 'H4K 2G2', -73.719614, 45.520819, '/panneaux_images/SU-OA_NE-1970.png', '08:00:00', '16:00:00'),

    ('6420', '2e Avenue', 'H1Y 2Z2', -73.588995, 45.550627, '/panneaux_images/SV-JB_QE-0377.png', '08:00:00', '16:00:00'),
    ('6486', '3e Avenue', 'H1Y 2X5', -73.589006, 45.551631, '/panneaux_images/SV-JB_QE-0377.png', '08:00:00', '16:00:00'),
	('5210', 'Earnscliffe', 'H3X 2P5', -73.632844, 45.482929, '/panneaux_images/SV-JB_QE-0377.png', '08:00:00', '16:00:00'),
    ('1272', 'Rue Charlevoix', 'H3K 3A1', -73.570417, 45.479015, '/panneaux_images/SV-JB_QE-0377.png', '08:00:00', '16:00:00'),
    ('5481', 'Rue Parthenais', 'H2K 3T8', -73.562859, 45.532630, '/panneaux_images/SV-JB_QE-0377.png', '08:00:00', '16:00:00'),

    ('6403', '23e Avenue', 'H1T 3N2', -73.577270, 45.562661, '/panneaux_images/SV-PN_NE-678.png', '16:00:00', '18:00:00'),
	('8300', 'Rue du Champ-d\'Eau', 'H1P 1Y3', -73.581734, 45.601139, '/panneaux_images/SV-PN_NE-678.png', '16:00:00', '18:00:00'),
    ('3350', 'Avenue Swail', 'H3T 1P4', -73.619276, 45.496353, '/panneaux_images/SV-PN_NE-678.png', '16:00:00', '18:00:00'),
    ('6513', 'Rue de la Visitation', 'H2X 2B3', -73.559105, 45.520932, '/panneaux_images/SV-PN_NE-678.png', '16:00:00', '18:00:00'),

    ('6320', '24e Avenue', 'H1T 3M5', -73.576666, 45.563160, '/panneaux_images/SV-PP_NE-1037.png', '16:00:00', '17:00:00'),
    ('6414', '2e Avenue', 'H1Y 2Z2', -73.588921, 45.550593, '/panneaux_images/SV-PP_NE-1037.png', '16:00:00', '17:00:00'),
    ('7621', 'Avenue Louis-Hébert', 'H1X 2G11', -73.608909, 45.555842, '/panneaux_images/SV-PP_NE-1037.png', '16:00:00', '17:00:00'),
    ('3368', 'Rue Bélanger', 'H1X 1A3', -73.592986, 45.558454, '/panneaux_images/SV-PP_NE-1037.png', '16:00:00', '17:00:00'),
    ('6985', '12e Avenue', 'H2A 2X9', -73.594146, 45.558328, '/panneaux_images/SV-PP_NE-1037.png', '16:00:00', '17:00:00'),

    ('6750', '20e Avenue', 'H1X 2J7', -73.585746, 45.562638, '/panneaux_images/SV-PS_NE-1446.png', '13:00:00', '14:00:00'),
    ('6976', '12e Avenue', 'H2A 3P2', -73.594121 , 45.558311, '/panneaux_images/SV-PS_NE-1446.png', '13:00:00', '14:00:00'),
    ('6609', '9e Avenue', 'H1Y 2K8', -73.589473, 45.554418, '/panneaux_images/SV-PS_NE-1446.png', '13:00:00', '14:00:00'),
    ('6635', '3e Avenue', 'H1Y 2X8', -73.591322, 45.552695, '/panneaux_images/SV-PS_NE-1446.png', '13:00:00', '14:00:00'),
    ('6306', '24e Avenue', 'H1T 3M5', -73.576481, 45.563095, '/panneaux_images/SV-PS_NE-1446.png', '13:00:00', '14:00:00');
