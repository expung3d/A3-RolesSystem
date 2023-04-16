comment "
	Author: ZAM
	Faction: NATO Woodland
	Maps: Livonia
	Version: 1.1
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

	comment "Recruit";
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

	comment "Rifleman";
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

	comment "Medic";
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
		["V_PlateCarrierSpec_wdl"],
		["B_Kitbag_rgr"],
		["H_HelmetSpecB_wdl"],
		[],
		["Medikit","G_Respirator_white_F","G_Respirator_Red_F","G_Respirator_blue_F"],
		true
	] call MAZ_RS_fnc_createNewEquipmentForRole;

	comment "Engineer";
	[
		west,
		"Enoch",
		"Engineer",
		[
			[
				["arifle_MXC_Black_F","arifle_MX_Black_F","arifle_SPAR_01_blk_F"],
				["30Rnd_556x45_Stanag_Tracer_Red","30Rnd_556x45_Stanag_red","30Rnd_65x39_caseless_black_mag","30Rnd_65x39_caseless_black_mag_Tracer",
				"DemoCharge_Remote_Mag","SatchelCharge_Remote_Mag","ATMine_Range_Mag","ClaymoreDirectionalMine_Remote_Mag","APERSMine_Range_Mag","SLAMDirectionalMine_Wire_Mag","APERSTripMine_Wire_Mag"]
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
		["B_Kitbag_rgr"],
		[],
		[],
		["Toolkit","MineDetector"],
		true
	] call MAZ_RS_fnc_createNewEquipmentForRole;

	comment "Crewman";
	[
		west,
		"Enoch",
		"Crewman",
		[
			[
				["arifle_MXC_Black_F","SMG_01_F","arifle_SPAR_01_blk_F"],
				["30Rnd_556x45_Stanag_Tracer_Red","30Rnd_556x45_Stanag_red","30Rnd_65x39_caseless_black_mag","30Rnd_65x39_caseless_black_mag_Tracer","30Rnd_45ACP_Mag_SMG_01","30Rnd_45ACP_Mag_SMG_01_Tracer_Red"]
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
		["V_Chestrig_rgr","V_Chestrig_oli","V_TacVest_oli"],
		["B_AssaultPack_rgr"],
		["H_HelmetCrew_B"],
		["G_Spectacles","G_Spectacles_Tinted","G_Shades_Black","G_Shades_Green","G_Shades_Red","G_Tactical_Black","G_Aviator","G_Bandanna_blk","G_Bandanna_khk","G_Bandanna_tan","G_Bandanna_shades","G_Shades_Blue","G_Tactical_Clear"],
		["ToolKit"],
		false
	] call MAZ_RS_fnc_createNewEquipmentForRole;

	comment "Heli Pilot";
	[
		west,
		"Enoch",
		"Heli Pilot",
		[
			[
				["arifle_MXC_Black_F","SMG_01_F","arifle_SPAR_01_blk_F"],
				["30Rnd_556x45_Stanag_Tracer_Red","30Rnd_556x45_Stanag_red","30Rnd_65x39_caseless_black_mag","30Rnd_65x39_caseless_black_mag_Tracer","30Rnd_45ACP_Mag_SMG_01","30Rnd_45ACP_Mag_SMG_01_Tracer_Red"]
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
		["U_B_HeliPilotCoveralls"],
		["V_Chestrig_rgr","V_Chestrig_oli","V_TacVest_oli","V_TacVest_blk"],
		["B_AssaultPack_rgr","B_Parachute"],
		["H_PilotHelmetHeli_B","H_CrewHelmetHeli_B"],
		["G_Spectacles","G_Spectacles_Tinted","G_Shades_Black","G_Shades_Green","G_Shades_Red","G_Tactical_Black","G_Aviator","G_Bandanna_blk","G_Bandanna_khk","G_Bandanna_tan","G_Bandanna_shades","G_Shades_Blue","G_Tactical_Clear"],
		["ToolKit"],
		false
	] call MAZ_RS_fnc_createNewEquipmentForRole;

	comment "Pilot";
	[
		west,
		"Enoch",
		"Pilot",
		[
			[
				["arifle_MXC_Black_F","SMG_01_F","arifle_SPAR_01_blk_F"],
				["30Rnd_556x45_Stanag_Tracer_Red","30Rnd_556x45_Stanag_red","30Rnd_65x39_caseless_black_mag","30Rnd_65x39_caseless_black_mag_Tracer","30Rnd_45ACP_Mag_SMG_01","30Rnd_45ACP_Mag_SMG_01_Tracer_Red"]
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
		["U_B_PilotCoveralls"],
		[],
		["B_Parachute"],
		["H_PilotHelmetFighter_B"],
		["G_Spectacles","G_Spectacles_Tinted","G_Shades_Black","G_Shades_Green","G_Shades_Red","G_Tactical_Black","G_Aviator","G_Bandanna_blk","G_Bandanna_khk","G_Bandanna_tan","G_Bandanna_shades","G_Shades_Blue","G_Tactical_Clear"],
		[],
		false
	] call MAZ_RS_fnc_createNewEquipmentForRole;

	comment "Squad Leader";
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
			["optic_Aco","optic_ACO_grn","acc_flashlight","acc_pointer_IR","optic_Holosight_blk_F","optic_Hamr","optic_MRCO","optic_ERCO_blk"]
		],
		[],
		[],
		["B_RadioBag_01_wdl_F"],
		["H_HelmetSpecB_wdl"],
		[],
		["Laserdesignator_01_khk_F","B_UavTerminal"],
		true
	] call MAZ_RS_fnc_createNewEquipmentForRole;

	comment "Autorifleman";
	[
		west,
		"Enoch",
		"Autorifleman",
		[
			[
				["arifle_MX_SW_Black_F","LMG_03_F","arifle_SPAR_02_blk_F","arifle_SPAR_02_snd_F"],
				["100Rnd_65x39_caseless_black_mag","100Rnd_65x39_caseless_black_mag_tracer","150Rnd_556x45_Drum_Mag_F","200Rnd_556x45_Box_F","200Rnd_556x45_Box_Tracer_F"]
			],
			[
				[],
				[]
			],
			[
				["hgun_P07_blk_F","hgun_Pistol_heavy_01_green_F"],
				["16Rnd_9x21_Mag","16Rnd_9x21_red_Mag","11Rnd_45ACP_Mag"]
			],
			["optic_Aco","optic_ACO_grn","acc_flashlight","acc_pointer_IR","optic_Holosight_blk_F","optic_Hamr","optic_ERCO_blk_F"]
		],
		[],
		[],
		["H_HelmetSpecB_wdl"],
		[],
		[],
		[],
		true
	] call MAZ_RS_fnc_createNewEquipmentForRole;

	comment "Light Anti-Tank";
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
				["launch_NLAW_F","launch_MRAWS_green_rail_F"],
				["NLAW_F","MRAWS_HE_F","MRAWS_HEAT55_F"]
			],
			[
				["hgun_P07_blk_F","hgun_Pistol_heavy_01_green_F"],
				["16Rnd_9x21_Mag","16Rnd_9x21_red_Mag","11Rnd_45ACP_Mag"]
			],
			["optic_Aco","optic_ACO_grn","acc_flashlight","acc_pointer_IR","optic_Holosight_blk_F"]
		],
		[],
		[],
		["B_Kitbag_rgr"],
		[],
		[],
		[],
		true
	] call MAZ_RS_fnc_createNewEquipmentForRole;

	comment "Marksman";
	[
		west,
		"Enoch",
		"Marksman",
		[
			[
				["arifle_MXM_Black_F","srifle_EBR_F","srifle_DMR_03_F","srifle_DMR_03_khaki_F","arifle_SPAR_03_blk_F"],
				["30Rnd_65x39_caseless_black_mag","30Rnd_65x39_caseless_black_mag_Tracer","20Rnd_762x51_Mag"]
			],
			[
				[],
				[]
			],
			[
				["hgun_P07_blk_F","hgun_Pistol_heavy_01_green_F"],
				["16Rnd_9x21_Mag","16Rnd_9x21_red_Mag","11Rnd_45ACP_Mag"]
			],
			["acc_flashlight","acc_pointer_IR","muzzle_snds_H","optic_SOS","optic_DMS","bipod_01_F_blk","optic_NVS"]
		],
		["U_B_CombatUniform_vest_mcam_wdl_f","U_B_CombatUniform_mcam_wdl_f","U_B_CombatUniform_tshirt_mcam_wdL_f"],
		["V_Rangemaster_belt","V_PlateCarrier1_wdl","V_Chestrig_rgr","V_Chestrig_oli","V_TacVest_oli"],
		[],
		["H_Booniehat_mgrn","H_Booniehat_oli","H_Booniehat_wdl","H_Bandanna_oli","H_ShemagOpen_olive","H_Watchcap_camo","H_Watchcap_khk","H_Watchcap_blk"],
		["G_Tactical_Black","G_Bandanna_oli","G_Bandanna_khk","G_Bandanna_tan","G_Tactical_Clear"],
		["Rangefinder"],
		false
	] call MAZ_RS_fnc_createNewEquipmentForRole;

	comment "Grenadier";
	[
		west,
		"Enoch",
		"Grenadier",
		[
			[
				["arifle_MX_GL_Black_F","arifle_SPAR_01_GL_blk_F"],
				["1Rnd_HE_Grenade_shell","1Rnd_Smoke_Grenade_shell","1Rnd_SmokeGreen_Grenade_shell","1Rnd_SmokeRed_Grenade_shell","1Rnd_SmokeYellow_Grenade_shell","1Rnd_SmokePurple_Grenade_shell","1Rnd_SmokeBlue_Grenade_shell","1Rnd_SmokeOrange_Grenade_shell","3Rnd_HE_Grenade_shell","3Rnd_Smoke_Grenade_shell","3Rnd_SmokeRed_Grenade_shell","3Rnd_SmokeGreen_Grenade_shell","3Rnd_SmokeYellow_Grenade_shell","3Rnd_SmokePurple_Grenade_shell","3Rnd_SmokeBlue_Grenade_shell","3Rnd_SmokeOrange_Grenade_shell","30Rnd_556x45_Stanag_Tracer_Red","30Rnd_556x45_Stanag_red","30Rnd_65x39_caseless_black_mag","30Rnd_65x39_caseless_black_mag_Tracer"]
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
		["V_PlateCarrierGL_wdl"],
		["B_AssaultPack_rgr","B_AssaultPack_wdl"],
		["H_HelmetB_wdl","H_HelmetB_light_wdl","H_Booniehat_mcamo","H_HelmetSpecB_wdl","H_Cap_oli","H_Cap_headphones","H_Cap_blk","H_Cap_grn","H_Cap_oli_hs","H_Cap_usblack","H_Bandanna_khk","H_Bandanna_khk_hs","H_Watchcap_blk","H_Watchcap_khk","H_Watchcap_camo","H_Booniehat_mgrn","H_MilCap_grn"],
		["G_Spectacles","G_Spectacles_Tinted","G_Combat","G_Shades_Black","G_Shades_Green","G_Shades_Red","G_Tactical_Black","G_Bandanna_blk","G_Bandanna_oli","G_Bandanna_khk","G_Bandanna_tan","G_Shades_Blue","G_Tactical_Clear","G_AirPurifyingRespirator_01_F"],
		[],
		true
	] call MAZ_RS_fnc_createNewEquipmentForRole;

	comment "Heavy Gunner";
	[
		west,
		"Enoch",
		"Heavy Gunner",
		[
			[
				["MMG_02_black_F"],
				["130Rnd_338_Mag"]
			],
			[
				[],
				[]
			],
			[
				["hgun_P07_blk_F","hgun_Pistol_heavy_01_green_F"],
				["16Rnd_9x21_Mag","16Rnd_9x21_red_Mag","11Rnd_45ACP_Mag"]
			],
			["optic_Aco","optic_ACO_grn","acc_flashlight","acc_pointer_IR","optic_Holosight_blk_F","optic_Hamr","optic_ERCO_blk_F"]
		],
		[],
		[],
		[],
		[],
		[],
		[],
		true
	] call MAZ_RS_fnc_createNewEquipmentForRole;

	comment "Heavy Anti-Tank";
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
				["launch_B_Titan_olive_F","launch_I_Titan_short_F","launch_MRAWS_green_F"],
				["Titan_AA","Titan_AT","MRAWS_HEAT_F","MRAWS_HEAT55_F"]
			],
			[
				["hgun_P07_blk_F","hgun_Pistol_heavy_01_green_F"],
				["16Rnd_9x21_Mag","16Rnd_9x21_red_Mag","11Rnd_45ACP_Mag"]
			],
			["optic_Aco","optic_ACO_grn","acc_flashlight","acc_pointer_IR","optic_Holosight_blk_F"]
		],
		[],
		[],
		["B_Kitbag_rgr"],
		[],
		[],
		[],
		true
	] call MAZ_RS_fnc_createNewEquipmentForRole;

	comment "Sharpshooter";
	[
		west,
		"Enoch",
		"Sharpshooter",
		[
			[
				["srifle_LRR_F","srifle_DMR_02_F","srifle_DMR_02_camo_F"],
				["7Rnd_408_Mag","10Rnd_338_Mag"]
			],
			[
				[],
				[]
			],
			[
				["hgun_P07_blk_F","hgun_Pistol_heavy_01_green_F"],
				["16Rnd_9x21_Mag","16Rnd_9x21_red_Mag","11Rnd_45ACP_Mag"]
			],
			["muzzle_snds_L","muzzle_snds_acp","optic_LRPS","optic_AMS","optic_KHS_blk","bipod_01_F_blk","optic_NVS"]
		],
		["U_B_CombatUniform_vest_mcam_wdl_f","U_B_CombatUniform_mcam_wdl_f","U_B_CombatUniform_tshirt_mcam_wdL_f"],
		["V_Rangemaster_belt","V_PlateCarrier1_wdl","V_Chestrig_rgr","V_Chestrig_oli","V_TacVest_oli"],
		[],
		["H_Booniehat_mgrn","H_Booniehat_oli","H_Booniehat_wdl","H_Bandanna_oli","H_ShemagOpen_olive","H_Watchcap_camo","H_Watchcap_khk","H_Watchcap_blk"],
		["G_Tactical_Black","G_Bandanna_oli","G_Bandanna_khk","G_Bandanna_tan","G_Tactical_Clear"],
		["Rangefinder"],
		false
	] call MAZ_RS_fnc_createNewEquipmentForRole;