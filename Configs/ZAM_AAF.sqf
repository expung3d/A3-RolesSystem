comment "
	Author: ZAM
	Faction: AAF
	Maps: Altis, Stratis
	Version: 1.0
";

comment "Default AAF Uniforms";
{
	[
		independent,
		_x,
		[
			"U_I_CombatUniform","U_I_CombatUniform_shortsleeve","U_BG_independentilla1_2_F"
		],
		[
			"V_Chestrig_rgr","V_Chestrig_oli","V_TacVest_oli","V_PlateCarrierIA1_dgtl"
		],
		[
			"B_AssaultPack_dgtl"
		],	
		[
			"H_Booniehat_oli","H_Booniehat_dgtl","H_HelmetIA","H_Cap_headphones","H_Cap_grn","H_Cap_blk_Raven","H_Bandanna_khk","H_Bandanna_khk_hs","H_Bandanna_sgg","H_Watchcap_blk","H_Watchcap_camo","H_Booniehat_mgrn"
		],
		[
			"G_Spectacles","G_Spectacles_Tinted","G_Combat","G_Shades_Black","G_Shades_Green","G_Shades_yellow","G_Tactical_Black","G_Bandanna_blk","G_Bandanna_oli","G_Bandanna_khk","G_Bandanna_tan","G_Shades_Blue","G_Tactical_Clear"
		]
	] call MAZ_RS_fnc_createNewDefaultSideUniform;
} forEach ["Altis","Stratis"];

comment "Default AAF Roles";
{
	comment "AAF Recruit";
	[
		independent,
		_x,
		"Recruit",
		[
			[
				[
					"arifle_Mk20_F","arifle_Mk20C_F","arifle_TRG21_F","arifle_TRG20_F"
				],
				[
					"30Rnd_556x45_Stanag_Tracer_yellow","30Rnd_556x45_Stanag_yellow","30Rnd_556x45_Stanag_Sand_yellow","30Rnd_556x45_Stanag_Sand_Tracer_yellow"
				]
			],
			[
				[],
				[]
			],
			[
				[
					"hgun_ACPC2_F","hgun_Pistol_heavy_02_F"
				],
				[
					"16Rnd_9x21_yellow_Mag","16Rnd_9x21_Mag","11Rnd_45ACP_Mag","6Rnd_45ACP_Cylinder"
				]
			],
			[
				"optic_Aco","optic_ACO_grn","acc_flashlight","acc_flashlight_smg_01","acc_pointer_IR","optic_Holosight_blk_F","optic_Holosight_smg_blk_F"
			]
		],
		[],
		[],
		[],
		[],
		[],
		[],
		true
	] call MAZ_RS_fnc_createNewEquipmentForRole;

	comment "AAF Rifleman";
	[
		independent,
		_x,
		"Rifleman",
		[
			[
				[
					"arifle_Mk20_F","arifle_Mk20C_F","arifle_TRG21_F","arifle_TRG20_F"
				],
				[
					"30Rnd_556x45_Stanag_Tracer_yellow","30Rnd_556x45_Stanag_yellow","30Rnd_556x45_Stanag_Sand_yellow","30Rnd_556x45_Stanag_Sand_Tracer_yellow"
				]
			],
			[
				[],
				[]
			],
			[
				[
					"hgun_ACPC2_F","hgun_Pistol_heavy_02_F"
				],
				[
					"16Rnd_9x21_yellow_Mag","16Rnd_9x21_Mag","11Rnd_45ACP_Mag","6Rnd_45ACP_Cylinder"
				]
			],
			[
				"optic_Aco","optic_ACO_grn","acc_flashlight","acc_flashlight_smg_01","acc_pointer_IR","optic_Holosight_blk_F","optic_Holosight_smg_blk_F"
			]
		],
		[],
		[
			"V_PlateCarrierIA2_dgtl"
		],
		[],
		[],
		[],
		[],
		true
	] call MAZ_RS_fnc_createNewEquipmentForRole;

	comment "AAF Medic";
	[
		independent,
		_x,
		"Medic",
		[
			[
				[
					"arifle_Mk20_F","arifle_Mk20C_F","arifle_TRG21_F","arifle_TRG20_F"
				],
				[
					"30Rnd_556x45_Stanag_Tracer_yellow","30Rnd_556x45_Stanag_yellow","30Rnd_556x45_Stanag_Sand_yellow","30Rnd_556x45_Stanag_Sand_Tracer_yellow"
				]
			],
			[
				[],
				[]
			],
			[
				[
					"hgun_ACPC2_F","hgun_Pistol_heavy_02_F"
				],
				[
					"16Rnd_9x21_yellow_Mag","16Rnd_9x21_Mag","11Rnd_45ACP_Mag","6Rnd_45ACP_Cylinder"
				]
			],
			[
				"optic_Aco","optic_ACO_grn","acc_flashlight","acc_flashlight_smg_01","acc_pointer_IR","optic_Holosight_blk_F","optic_Holosight_smg_blk_F","Medikit"
			]
		],
		[
			
		],
		[
			"V_PlateCarrierIA2_dgtl"
		],
		[
			"B_TacticalPack_oli","B_Kitbag_rgr"
		],
		[
			
		],
		[
			
		],
		[

		],
		true
	] call MAZ_RS_fnc_createNewEquipmentForRole;

	comment "AAF Crewman";
	[
		independent,
		_x,
		"Crewman",
		[
			[
				[
					"arifle_Mk20_F","arifle_Mk20C_F","arifle_TRG21_F","arifle_TRG20_F"
				],
				[
					"30Rnd_556x45_Stanag_Tracer_yellow","30Rnd_556x45_Stanag_yellow","30Rnd_556x45_Stanag_Sand_yellow","30Rnd_556x45_Stanag_Sand_Tracer_yellow"
				]
			],
			[
				[

				],
				[
					
				]
			],
			[
				[
					"hgun_ACPC2_F","hgun_Pistol_heavy_02_F"
				],
				[
					"16Rnd_9x21_yellow_Mag","16Rnd_9x21_Mag","11Rnd_45ACP_Mag","6Rnd_45ACP_Cylinder"
				]
			],
			[
				"optic_Aco","optic_ACO_grn","acc_flashlight","acc_flashlight_smg_01","acc_pointer_IR","optic_Holosight_blk_F","optic_Holosight_smg_blk_F","toolkit"
			]
		],
		[
			"U_Tank_green_F"
		],
		[
			"V_Chestrig_rgr","V_Chestrig_oli","V_TacVest_oli","V_PlateCarrierIA1_dgtl"
		],
		[
			
		],
		[
			"H_HelmetCrew_I"
		],
		[
			"G_Spectacles","G_Spectacles_Tinted","G_Combat","G_Shades_Black","G_Shades_Green","G_Shades_yellow","G_Tactical_Black","G_Bandanna_blk","G_Bandanna_oli","G_Bandanna_khk","G_Bandanna_tan","G_Shades_Blue","G_Tactical_Clear"
		],
		[

		],
		false
	] call MAZ_RS_fnc_createNewEquipmentForRole;

	comment "AAF Heli Pilot";
	[
		independent,
		_x,
		"Heli Pilot",
		[
			[
				[
					"hgun_PDW2000_F","arifle_Mk20C_F","arifle_Mk20C_Plain_F","arifle_TRG21_F","arifle_TRG20_F"
				],
				[
					"30Rnd_9x21_yellow_Mag","30Rnd_556x45_Stanag_Tracer_yellow","30Rnd_556x45_Stanag_yellow","30Rnd_556x45_Stanag_Sand_yellow","30Rnd_556x45_Stanag_Sand_Tracer_yellow"
				]
			],
			[
				[

				],
				[
					
				]
			],
			[
				[
					"hgun_ACPC2_F","hgun_Pistol_heavy_02_F"
				],
				[
					"16Rnd_9x21_yellow_Mag","16Rnd_9x21_Mag","11Rnd_45ACP_Mag","6Rnd_45ACP_Cylinder"
				]
			],
			[
				"optic_Aco","optic_ACO_grn","acc_flashlight","acc_flashlight_smg_01","acc_pointer_IR","optic_Holosight_blk_F","optic_Holosight_smg_blk_F","toolkit"
			]
		],
		[
			"U_I_HeliPilotCoveralls"
		],
		[
			"V_Chestrig_rgr","V_Chestrig_oli","V_TacVest_oli","V_PlateCarrierIA1_dgtl"
		],
		[
			
		],
		[
			"H_PilotHelmetHeli_I","H_CrewHelmetHeli_I"
		],
		[
			"G_Spectacles","G_Spectacles_Tinted","G_Combat","G_Shades_Black","G_Shades_Green","G_Shades_yellow","G_Tactical_Black","G_Bandanna_blk","G_Bandanna_oli","G_Bandanna_khk","G_Bandanna_tan","G_Shades_Blue","G_Tactical_Clear"
		],
		[

		],
		false
	] call MAZ_RS_fnc_createNewEquipmentForRole;

	comment "AAF Pilot";
	[
		independent,
		_x,
		"Pilot",
		[
			[
				[
					"hgun_PDW2000_F","arifle_Mk20C_F"
				],
				[
					"30Rnd_9x21_yellow_Mag","30Rnd_556x45_Stanag_Tracer_yellow","30Rnd_556x45_Stanag_yellow"
				]
			],
			[
				[

				],
				[
					
				]
			],
			[
				[
					"hgun_ACPC2_F","hgun_Pistol_heavy_02_F"
				],
				[
					"16Rnd_9x21_yellow_Mag","16Rnd_9x21_Mag","11Rnd_45ACP_Mag","6Rnd_45ACP_Cylinder"
				]
			],
			[
				"optic_Aco","optic_ACO_grn","acc_flashlight","acc_flashlight_smg_01","acc_pointer_IR","optic_Holosight_blk_F","optic_Holosight_smg_blk_F","toolkit"
			]
		],
		[
			"U_I_pilotCoveralls"
		],
		[
		
		],
		[
			"B_Parachute"
		],
		[
			"H_PilotHelmetFighter_I"
		],
		[
			
		],
		[

		],
		false
	] call MAZ_RS_fnc_createNewEquipmentForRole;

	comment "AAF Squad Leader";
	[
		independent,
		_x,
		"Squad Leader",
		[
			[
				[
					"arifle_Mk20_F","arifle_Mk20C_F","arifle_TRG21_F","arifle_TRG20_F"
				],
				[
					"30Rnd_556x45_Stanag_Tracer_yellow","30Rnd_556x45_Stanag_yellow","30Rnd_556x45_Stanag_Sand_yellow","30Rnd_556x45_Stanag_Sand_Tracer_yellow"
				]
			],
			[
				[],
				[]
			],
			[
				[
					"hgun_ACPC2_F","hgun_Pistol_heavy_02_F"
				],
				[
					"16Rnd_9x21_yellow_Mag","16Rnd_9x21_Mag","11Rnd_45ACP_Mag","6Rnd_45ACP_Cylinder"
				]
			],
			[
				"optic_Hamr","optic_Aco","optic_ACO_grn","acc_flashlight","acc_flashlight_smg_01","acc_pointer_IR","optic_Holosight_blk_F","optic_ERCO_blk_F","optic_MRCO","optic_Holosight"
			]
		],
		[],
		["V_PlateCarrierIA2_dgtl"],
		[
			"B_RadioBag_01_digi_F"
		],
		[],
		[],
		["Laserdesignator_03"],
		true
	] call MAZ_RS_fnc_createNewEquipmentForRole;





	comment "AAF Autorifleman";
	[
		independent,
		_x,
		"Autorifleman",
		[
			[
				[
					"LMG_Mk200_F","LMG_Mk200_black_F"
				],
				[
					"200Rnd_65x39_cased_Box","200Rnd_65x39_cased_Box_Tracer","200Rnd_556x45_Box_F","200Rnd_556x45_Box_Tracer_F"
				]
			],
			[
				[],
				[]
			],
			[
				[
					"hgun_ACPC2_F","hgun_Pistol_heavy_02_F"
				],
				[
					"16Rnd_9x21_yellow_Mag","16Rnd_9x21_Mag","11Rnd_45ACP_Mag","6Rnd_45ACP_Cylinder"
				]
			],
			[
				"optic_Aco","optic_ACO_grn","acc_flashlight","acc_flashlight_smg_01","acc_pointer_IR","optic_Holosight_blk_F","optic_Holosight_smg_blk_F"
			]
		],
		[],
		["V_PlateCarrierIA2_dgtl"],
		[
			"B_TacticalPack_oli","B_Kitbag_rgr"
		],
		[],
		[],
		[],
		true
	] call MAZ_RS_fnc_createNewEquipmentForRole;

	comment "AAF LAT (LightAT)";
	[
		independent,
		_x,
		"Light Anti-Tank",
		[
			[
				[
					"arifle_Mk20_F","arifle_Mk20C_F","arifle_TRG21_F","arifle_TRG20_F"
				],
				[
					"30Rnd_556x45_Stanag_Tracer_yellow","30Rnd_556x45_Stanag_yellow","30Rnd_556x45_Stanag_Sand_yellow","30Rnd_556x45_Stanag_Sand_Tracer_yellow"
				]
			],
			[
				[
					"launch_NLAW_F","launch_MRAWS_green_F","launch_MRAWS_green_rail_F"
				],
				[
					"NLAW_F","MRAWS_HE_F","MRAWS_HEAT55_F"
				]
			],
			[
				[
					"hgun_ACPC2_F","hgun_Pistol_heavy_02_F"
				],
				[
					"16Rnd_9x21_yellow_Mag","16Rnd_9x21_Mag","11Rnd_45ACP_Mag","6Rnd_45ACP_Cylinder"
				]
			],
			[
				"optic_Aco","optic_ACO_grn","acc_flashlight","acc_flashlight_smg_01","acc_pointer_IR","optic_Holosight_blk_F","optic_Holosight_smg_blk_F"
			]
		],
		[],
		[],
		[
			"B_TacticalPack_oli","B_Kitbag_rgr","B_Carryall_oli"
		],
		[],
		[],
		[],
		true
	] call MAZ_RS_fnc_createNewEquipmentForRole;

	comment "AAF Marksman";
	[
		independent,
		_x,
		"Marksman",
		[
			[
				[
					"srifle_EBR_F","srifle_DMR_06_olive_F","srifle_DMR_03_khaki_F"
				],
				[
					"20Rnd_762x51_Mag","10Rnd_Mk14_762x51_Mag"
				]
			],
			[
				[],
				[]
			],
			[
				[
					"hgun_ACPC2_F","hgun_Pistol_heavy_02_F"
				],
				[
					"16Rnd_9x21_yellow_Mag","16Rnd_9x21_Mag","11Rnd_45ACP_Mag","6Rnd_45ACP_Cylinder"
				]
			],
			[
				"acc_flashlight","acc_flashlight_smg_01","acc_pointer_IR","muzzle_snds_H","optic_SOS","optic_DMS","bipod_01_F_snd","bipod_01_F_blk","muzzle_snds_H_snd_F","optic_NVS"
			]
		],
		[
			
		],
		[
			"V_PlateCarrierIA2_dgtl"
		],
		[
			
		],
		[
			
		],
		[
			
		],
		[
			"Rangefinder"
		],
		true
	] call MAZ_RS_fnc_createNewEquipmentForRole;

	comment "AAF Grenadier";
	[
		independent,
		_x,
		"Grenadier",
		[
			[
				[
					"arifle_Mk20_GL_F","arifle_TRG21_GL_F"
				],
				[
					"30Rnd_556x45_Stanag_Tracer_yellow","30Rnd_556x45_Stanag_yellow","30Rnd_556x45_Stanag_Sand_yellow","30Rnd_556x45_Stanag_Sand_Tracer_yellow","1Rnd_HE_Grenade_shell","UGL_FlareWhite_F","UGL_FlareGreen_F","UGL_FlareRed_F","UGL_FlareYellow_F","UGL_FlareCIR_F","1Rnd_Smoke_Grenade_shell","1Rnd_SmokeRed_Grenade_shell","1Rnd_SmokeGreen_Grenade_shell","1Rnd_SmokeYellow_Grenade_shell","1Rnd_SmokePurple_Grenade_shell","1Rnd_SmokeBlue_Grenade_shell","1Rnd_SmokeOrange_Grenade_shell"
				]
			],
			[
				[],
				[]
			],
			[
				[
					"hgun_ACPC2_F","hgun_Pistol_heavy_02_F"
				],
				[
					"16Rnd_9x21_yellow_Mag","16Rnd_9x21_Mag","11Rnd_45ACP_Mag","6Rnd_45ACP_Cylinder"
				]
			],
			[
				"optic_Aco","optic_ACO_grn","acc_flashlight","acc_flashlight_smg_01","acc_pointer_IR","optic_Holosight_blk_F","optic_Holosight_smg_blk_F"
			]
		],
		[],
		[
			"V_PlateCarrierIAGL_dgtl"
		],
		[],
		[],
		[],
		[],
		true
	] call MAZ_RS_fnc_createNewEquipmentForRole;





	comment "AAF Heavy Gunner";
	[
		independent,
		_x,
		"Heavy Gunner",
		[
			[
				[
					"MMG_02_black_F","MMG_02_sand_F"
				],
				[
					"130Rnd_338_Mag"
				]
			],
			[
				[],
				[]
			],
			[
				[
					"hgun_ACPC2_F","hgun_Pistol_heavy_02_F"
				],
				[
					"16Rnd_9x21_yellow_Mag","16Rnd_9x21_Mag","11Rnd_45ACP_Mag","6Rnd_45ACP_Cylinder"
				]
			],
			[
				"optic_Aco","optic_ACO_grn","optic_Holosight","acc_flashlight","acc_flashlight_smg_01","acc_pointer_IR","optic_Holosight_blk_F","optic_Hamr","optic_ERCO_blk_F"
			]
		],
		[],
		[],
		[
			"B_Kitbag_rgr","B_TacticalPack_oli"
		],
		[],
		[],
		[],
		true
	] call MAZ_RS_fnc_createNewEquipmentForRole;

	comment "AAF HAT (Heavy AT)";
	[
		independent,
		_x,
		"Heavy Anti-Tank",
		[
			[
				[
					"arifle_Mk20_F","arifle_Mk20C_F","arifle_TRG21_F","arifle_TRG20_F"
				],
				[
					"30Rnd_556x45_Stanag_Tracer_yellow","30Rnd_556x45_Stanag_yellow","30Rnd_556x45_Stanag_Sand_yellow","30Rnd_556x45_Stanag_Sand_Tracer_yellow"
				]
			],
			[
				[
					"launch_MRAWS_green_F","launch_MRAWS_green_rail_F","launch_I_Titan_F","launch_I_Titan_short_F","launch_B_Titan_olive_F"
				],
				[
					"MRAWS_HE_F","Titan_AA","Titan_AT","Titan_AP","MRAWS_HEAT_F","MRAWS_HE_F"
				]
			],
			[
				[
					"hgun_ACPC2_F","hgun_Pistol_heavy_02_F"
				],
				[
					"16Rnd_9x21_yellow_Mag","16Rnd_9x21_Mag","11Rnd_45ACP_Mag","6Rnd_45ACP_Cylinder"
				]
			],
			[
				"optic_Aco","optic_ACO_grn","acc_flashlight","acc_flashlight_smg_01","acc_pointer_IR","optic_Holosight_blk_F","optic_Holosight_smg_blk_F"
			]
		],
		[],
		[],
		[
			"B_Kitbag_rgr","B_Carryall_oli","B_TacticalPack_oli"
		],
		[],
		[],
		[],
		true
	] call MAZ_RS_fnc_createNewEquipmentForRole;

	comment "AAF Sniffysniper";
	[
		independent,
		_x,
		"Sniper",
		[
			[
				[
					"srifle_GM6_F","srifle_DMR_02_F"
				],
				[
					"5Rnd_127x108_Mag","10Rnd_338_Mag"
				]
			],
			[
				[],
				[]
			],
			[
				[
					"hgun_ACPC2_F","hgun_Pistol_heavy_02_F"
				],
				[
					"16Rnd_9x21_yellow_Mag","16Rnd_9x21_Mag","11Rnd_45ACP_Mag","6Rnd_45ACP_Cylinder"
				]
			],
			[
				"optic_NVS","optic_LRPS","optic_AMS","optic_KHS_blk","acc_pointer_IR"
			]
		],
		["U_I_FullGhillie_sard","U_I_FullGhillie_ard"],
		["V_Chestrig_rgr","V_Chestrig_oli","V_TacVest_oli"],
		["H_Booniehat_dgtl"],
		[],
		[],
		["Rangefinder"],
		false
	] call MAZ_RS_fnc_createNewEquipmentForRole;
} forEach ["Altis","Stratis"];