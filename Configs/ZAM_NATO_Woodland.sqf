comment "
	Author: ZAM
	Faction: NATO Woodland
	Maps: Livonia
	Version: 1.0
";

comment "NATO Livonia Default";

	[
		west,
		"Enoch",
		[
			"U_B_CombatUniform_vest_mcam_wdl_f","U_B_CombatUniform_mcam_wdl_f","U_B_CombatUniform_tshirt_mcam_wdL_f"
		],
		[
			"V_Rangemaster_belt","V_Chestrig_rgr","V_TacVest_oli","V_PlateCarrier1_wdl","V_PlateCarrier2_wdl"
		],
		[
			"B_AssaultPack_wdl_F"
		],
		[
			"H_Booniehat_oli","H_Booniehat_khk_hs","H_Cap_oli","H_Cap_headphones","H_Cap_blk","H_Cap_grn","H_Cap_oli_hs","H_Cap_usblack","H_Bandanna_khk","H_Bandanna_khk_hs","H_Watchcap_blk","H_Watchcap_camo","H_Booniehat_mgrn","H_Booniehat_wdl","H_MilCap_wdl","H_HelmetB_plain_wdl","H_HelmetB_light_wdl"
		],
		[
			"G_Spectacles","G_Spectacles_Tinted","G_Lowprofile","G_Shades_Black","G_Shades_Green","G_Shades_Red","G_Tactical_Black","G_Balaclava_blk","G_Balaclava_oli","G_Balaclava_combat","G_Balaclava_lowprofile","G_Bandanna_blk","G_Bandanna_oli","G_Bandanna_beast","G_Bandanna_shades","G_Bandanna_sport","G_Shades_Blue","G_Tactical_Clear","G_Balaclava_TI_blk_F","G_Balaclava_TI_G_blk_F","G_Combat_Goggles_tna_F","G_AirPurifyingRespirator_01_F"
		]
	] call MAZ_RS_fnc_createNewDefaultSideUniform;

comment "NATO Livonia Roles";

	[
		west,
		"Enoch",
		"Recruit",
		[
			[
				["arifle_MXC_Black_F","arifle_MX_Black_F","arifle_SPAR_01_blk_F"],
				["30Rnd_556x45_Stanag_Tracer_Red","30Rnd_556x45_Stanag_red","30Rnd_65x39_caseless_black_mag","30Rnd_65x39_caseless_black_mag_Tracer"]
			],
			[
				[],
				[]
			],
			[
				["hgun_P07_blk_F","hgun_Pistol_heavy_01_green_F"],
				["16Rnd_9x21_Mag","16Rnd_9x21_red_Mag","11Rnd_45ACP_Mag"]
			],
			["optic_Aco","optic_ACO_grn","acc_flashlight","acc_pointer_IR","optic_Holosight_blk_F"]
		],
		["U_B_CombatUniform_vest_mcam_wdl_f","U_B_CombatUniform_mcam_wdl_f","U_B_CombatUniform_tshirt_mcam_wdL_f"],
		["V_Rangemaster_belt","V_Chestrig_rgr","V_TacVest_oli","V_PlateCarrier1_wdl","V_PlateCarrier2_wdl"],
		["B_AssaultPack_wdl_F"],
		["H_Booniehat_oli","H_Booniehat_khk_hs","H_Cap_oli","H_Cap_headphones","H_Cap_blk","H_Cap_grn","H_Cap_oli_hs","H_Cap_usblack","H_Bandanna_khk","H_Bandanna_khk_hs","H_Watchcap_blk","H_Watchcap_camo","H_Booniehat_mgrn","H_Booniehat_wdl","H_MilCap_wdl","H_HelmetB_plain_wdl","H_HelmetB_light_wdl"],
		["G_Spectacles","G_Spectacles_Tinted","G_Lowprofile","G_Shades_Black","G_Shades_Green","G_Shades_Red","G_Tactical_Black","G_Balaclava_blk","G_Balaclava_oli","G_Balaclava_combat","G_Balaclava_lowprofile","G_Bandanna_blk","G_Bandanna_oli","G_Bandanna_beast","G_Bandanna_shades","G_Bandanna_sport","G_Shades_Blue","G_Tactical_Clear","G_Balaclava_TI_blk_F","G_Balaclava_TI_G_blk_F","G_Combat_Goggles_tna_F","G_AirPurifyingRespirator_01_F"],
		[],
		false
	] call MAZ_RS_fnc_createNewEquipmentForRole;

	[
		west,
		"Enoch",
		"Rifleman",
		[
			[
				["arifle_MXC_Black_F","arifle_MX_Black_F","arifle_SPAR_01_blk_F"],
				["30Rnd_556x45_Stanag_Tracer_Red","30Rnd_556x45_Stanag_red","30Rnd_65x39_caseless_black_mag","30Rnd_65x39_caseless_black_mag_Tracer"]
			],
			[
				[],
				[]
			],
			[
				["hgun_P07_blk_F","hgun_Pistol_heavy_01_green_F"],
				["16Rnd_9x21_Mag","16Rnd_9x21_red_Mag","11Rnd_45ACP_Mag"]
			],
			["optic_Aco","optic_ACO_grn","acc_flashlight","acc_pointer_IR","optic_Holosight_blk_F"]
		],
		[],
		[],
		[],
		[],
		[],
		[],
		true
	] call MAZ_RS_fnc_createNewEquipmentForRole;

	[
		west,
		"Enoch",
		"Medic",
		[
			[
				["arifle_MXC_Black_F","arifle_MX_Black_F","arifle_SPAR_01_blk_F"],
				["30Rnd_556x45_Stanag_Tracer_Red","30Rnd_556x45_Stanag_red","30Rnd_65x39_caseless_black_mag","30Rnd_65x39_caseless_black_mag_Tracer"]
			],
			[
				[],
				[]
			],
			[
				["hgun_P07_blk_F","hgun_Pistol_heavy_01_green_F"],
				["16Rnd_9x21_Mag","16Rnd_9x21_red_Mag","11Rnd_45ACP_Mag"]
			],
			["optic_Aco","optic_ACO_grn","acc_flashlight","acc_pointer_IR","optic_Holosight_blk_F"]
		],
		[],
		[],
		[],
		[],
		[],
		[],
		true
	] call MAZ_RS_fnc_createNewEquipmentForRole;

	[
		west,
		"Enoch",
		"Crewman",
		[
			[
				["arifle_MXC_Black_F","arifle_MX_Black_F","arifle_SPAR_01_blk_F"],
				["30Rnd_556x45_Stanag_Tracer_Red","30Rnd_556x45_Stanag_red","30Rnd_65x39_caseless_black_mag","30Rnd_65x39_caseless_black_mag_Tracer"]
			],
			[
				[],
				[]
			],
			[
				["hgun_P07_blk_F","hgun_Pistol_heavy_01_green_F"],
				["16Rnd_9x21_Mag","16Rnd_9x21_red_Mag","11Rnd_45ACP_Mag"]
			],
			["optic_Aco","optic_ACO_grn","acc_flashlight","acc_pointer_IR","optic_Holosight_blk_F"]
		],
		[],
		[],
		[],
		[],
		[],
		[],
		true
	] call MAZ_RS_fnc_createNewEquipmentForRole;

	[
		west,
		"Enoch",
		"Heli Pilot",
		[
			[
				["arifle_MXC_Black_F","arifle_MX_Black_F","arifle_SPAR_01_blk_F"],
				["30Rnd_556x45_Stanag_Tracer_Red","30Rnd_556x45_Stanag_red","30Rnd_65x39_caseless_black_mag","30Rnd_65x39_caseless_black_mag_Tracer"]
			],
			[
				[],
				[]
			],
			[
				["hgun_P07_blk_F","hgun_Pistol_heavy_01_green_F"],
				["16Rnd_9x21_Mag","16Rnd_9x21_red_Mag","11Rnd_45ACP_Mag"]
			],
			["optic_Aco","optic_ACO_grn","acc_flashlight","acc_pointer_IR","optic_Holosight_blk_F"]
		],
		[],
		[],
		[],
		[],
		[],
		[],
		true
	] call MAZ_RS_fnc_createNewEquipmentForRole;

	[
		west,
		"Enoch",
		"Pilot",
		[
			[
				["arifle_MXC_Black_F","arifle_MX_Black_F","arifle_SPAR_01_blk_F"],
				["30Rnd_556x45_Stanag_Tracer_Red","30Rnd_556x45_Stanag_red","30Rnd_65x39_caseless_black_mag","30Rnd_65x39_caseless_black_mag_Tracer"]
			],
			[
				[],
				[]
			],
			[
				["hgun_P07_blk_F","hgun_Pistol_heavy_01_green_F"],
				["16Rnd_9x21_Mag","16Rnd_9x21_red_Mag","11Rnd_45ACP_Mag"]
			],
			["optic_Aco","optic_ACO_grn","acc_flashlight","acc_pointer_IR","optic_Holosight_blk_F"]
		],
		[],
		[],
		[],
		[],
		[],
		[],
		true
	] call MAZ_RS_fnc_createNewEquipmentForRole;

	[
		west,
		"Enoch",
		"Squad Leader",
		[
			[
				["arifle_MXC_Black_F","arifle_MX_Black_F","arifle_SPAR_01_blk_F"],
				["30Rnd_556x45_Stanag_Tracer_Red","30Rnd_556x45_Stanag_red","30Rnd_65x39_caseless_black_mag","30Rnd_65x39_caseless_black_mag_Tracer"]
			],
			[
				[],
				[]
			],
			[
				["hgun_P07_blk_F","hgun_Pistol_heavy_01_green_F"],
				["16Rnd_9x21_Mag","16Rnd_9x21_red_Mag","11Rnd_45ACP_Mag"]
			],
			["optic_Aco","optic_ACO_grn","acc_flashlight","acc_pointer_IR","optic_Holosight_blk_F"]
		],
		[],
		[],
		[],
		[],
		[],
		[],
		true
	] call MAZ_RS_fnc_createNewEquipmentForRole;

	[
		west,
		"Enoch",
		"Autorifleman",
		[
			[
				["arifle_MXC_Black_F","arifle_MX_Black_F","arifle_SPAR_01_blk_F","LMG_03_F"],
				["30Rnd_556x45_Stanag_Tracer_Red","30Rnd_556x45_Stanag_red","30Rnd_65x39_caseless_black_mag","30Rnd_65x39_caseless_black_mag_Tracer","150Rnd_556x45_Drum_Mag_F","150Rnd_556x45_Drum_Sand_Mag_F"]
			],
			[
				[],
				[]
			],
			[
				["hgun_P07_blk_F","hgun_Pistol_heavy_01_green_F"],
				["16Rnd_9x21_Mag","16Rnd_9x21_red_Mag","11Rnd_45ACP_Mag"]
			],
			["optic_Aco","optic_ACO_grn","acc_flashlight","acc_pointer_IR","optic_Holosight_blk_F"]
		],
		[],
		[],
		[],
		[],
		[],
		[],
		true
	] call MAZ_RS_fnc_createNewEquipmentForRole;

	[
		west,
		"Enoch",
		"Light Anti-Tank",
		[
			[
				["arifle_MXC_Black_F","arifle_MX_Black_F","arifle_SPAR_01_blk_F"],
				["30Rnd_556x45_Stanag_Tracer_Red","30Rnd_556x45_Stanag_red","30Rnd_65x39_caseless_black_mag","30Rnd_65x39_caseless_black_mag_Tracer"]
			],
			[
				[],
				[]
			],
			[
				["hgun_P07_blk_F","hgun_Pistol_heavy_01_green_F"],
				["16Rnd_9x21_Mag","16Rnd_9x21_red_Mag","11Rnd_45ACP_Mag"]
			],
			["optic_Aco","optic_ACO_grn","acc_flashlight","acc_pointer_IR","optic_Holosight_blk_F"]
		],
		[],
		[],
		[],
		[],
		[],
		[],
		true
	] call MAZ_RS_fnc_createNewEquipmentForRole;

	[
		west,
		"Enoch",
		"Marksman",
		[
			[
				["arifle_MXC_Black_F","arifle_MX_Black_F","arifle_SPAR_01_blk_F"],
				["30Rnd_556x45_Stanag_Tracer_Red","30Rnd_556x45_Stanag_red","30Rnd_65x39_caseless_black_mag","30Rnd_65x39_caseless_black_mag_Tracer"]
			],
			[
				[],
				[]
			],
			[
				["hgun_P07_blk_F","hgun_Pistol_heavy_01_green_F"],
				["16Rnd_9x21_Mag","16Rnd_9x21_red_Mag","11Rnd_45ACP_Mag"]
			],
			["optic_Aco","optic_ACO_grn","acc_flashlight","acc_pointer_IR","optic_Holosight_blk_F"]
		],
		[],
		[],
		[],
		[],
		[],
		[],
		true
	] call MAZ_RS_fnc_createNewEquipmentForRole;

	[
		west,
		"Enoch",
		"Grenadier",
		[
			[
				["arifle_MXC_Black_F","arifle_MX_Black_F","arifle_SPAR_01_blk_F"],
				["30Rnd_556x45_Stanag_Tracer_Red","30Rnd_556x45_Stanag_red","30Rnd_65x39_caseless_black_mag","30Rnd_65x39_caseless_black_mag_Tracer"]
			],
			[
				[],
				[]
			],
			[
				["hgun_P07_blk_F","hgun_Pistol_heavy_01_green_F"],
				["16Rnd_9x21_Mag","16Rnd_9x21_red_Mag","11Rnd_45ACP_Mag"]
			],
			["optic_Aco","optic_ACO_grn","acc_flashlight","acc_pointer_IR","optic_Holosight_blk_F"]
		],
		[],
		[],
		[],
		[],
		[],
		[],
		true
	] call MAZ_RS_fnc_createNewEquipmentForRole;

	[
		west,
		"Enoch",
		"Heavy Gunner",
		[
			[
				["arifle_MXC_Black_F","arifle_MX_Black_F","arifle_SPAR_01_blk_F"],
				["30Rnd_556x45_Stanag_Tracer_Red","30Rnd_556x45_Stanag_red","30Rnd_65x39_caseless_black_mag","30Rnd_65x39_caseless_black_mag_Tracer"]
			],
			[
				[],
				[]
			],
			[
				["hgun_P07_blk_F","hgun_Pistol_heavy_01_green_F"],
				["16Rnd_9x21_Mag","16Rnd_9x21_red_Mag","11Rnd_45ACP_Mag"]
			],
			["optic_Aco","optic_ACO_grn","acc_flashlight","acc_pointer_IR","optic_Holosight_blk_F"]
		],
		[],
		[],
		[],
		[],
		[],
		[],
		true
	] call MAZ_RS_fnc_createNewEquipmentForRole;

	[
		west,
		"Enoch",
		"Heavy Anti-Tank",
		[
			[
				["arifle_MXC_Black_F","arifle_MX_Black_F","arifle_SPAR_01_blk_F"],
				["30Rnd_556x45_Stanag_Tracer_Red","30Rnd_556x45_Stanag_red","30Rnd_65x39_caseless_black_mag","30Rnd_65x39_caseless_black_mag_Tracer"]
			],
			[
				[],
				[]
			],
			[
				["hgun_P07_blk_F","hgun_Pistol_heavy_01_green_F"],
				["16Rnd_9x21_Mag","16Rnd_9x21_red_Mag","11Rnd_45ACP_Mag"]
			],
			["optic_Aco","optic_ACO_grn","acc_flashlight","acc_pointer_IR","optic_Holosight_blk_F"]
		],
		[],
		[],
		[],
		[],
		[],
		[],
		true
	] call MAZ_RS_fnc_createNewEquipmentForRole;

	[
		west,
		"Enoch",
		"Sniper",
		[
			[
				["arifle_MXC_Black_F","arifle_MX_Black_F","arifle_SPAR_01_blk_F"],
				["30Rnd_556x45_Stanag_Tracer_Red","30Rnd_556x45_Stanag_red","30Rnd_65x39_caseless_black_mag","30Rnd_65x39_caseless_black_mag_Tracer"]
			],
			[
				[],
				[]
			],
			[
				["hgun_P07_blk_F","hgun_Pistol_heavy_01_green_F"],
				["16Rnd_9x21_Mag","16Rnd_9x21_red_Mag","11Rnd_45ACP_Mag"]
			],
			["optic_Aco","optic_ACO_grn","acc_flashlight","acc_pointer_IR","optic_Holosight_blk_F"]
		],
		[],
		[],
		[],
		[],
		[],
		[],
		true
	] call MAZ_RS_fnc_createNewEquipmentForRole;