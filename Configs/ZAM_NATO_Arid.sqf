comment "
	Author: ZAM
	Faction: NATO Arid
	Maps: Altis, Malden, Stratis
	Version: 1.0
";

comment "Default NATO Uniforms";
{
	[
		west,
		_x,
		[
			"U_B_CombatUniform_mcam","U_B_CombatUniform_mcam_tshirt","U_B_CombatUniform_mcam_vest","U_B_CombatUniform_mcam_worn","U_B_CTRG_1","U_B_CTRG_2","U_B_CTRG_3","U_B_survival_uniform","U_I_G_Story_Protagonist_F","U_B_CTRG_Soldier_2_Arid_F"
		],
		[
			"V_PlateCarrier1_rgr","V_PlateCarrier2_rgr","V_Chestrig_oli","V_TacVest_khk","V_TacVest_oli","V_PlateCarrier_Kerry","V_PlateCarrierL_CTRG","V_PlateCarrierH_CTRG"
		],
		[
			"B_AssaultPack_rgr","B_AssaultPack_mcamo"
		],
		[
			"H_HelmetB","H_HelmetB_camo","H_HelmetB_light","H_Booniehat_khk","H_Booniehat_mcamo","H_Booniehat_tan","H_Booniehat_khk_hs","H_HelmetB_grass","H_HelmetB_snakeskin","H_HelmetB_desert","H_HelmetB_black","H_HelmetB_sand","H_Cap_oli","H_Cap_headphones","H_Cap_tan","H_Cap_blk","H_Cap_tan_specops_US","H_Cap_khaki_specops_UK","H_Cap_grn","H_Cap_oli_hs","H_Cap_usblack","H_MilCap_mcamo","H_MilCap_gry","H_HelmetB_light_grass","H_HelmetB_light_snakeskin","H_HelmetB_light_desert","H_HelmetB_light_black","H_HelmetB_light_sand","H_Bandanna_khk","H_Bandanna_khk_hs","H_Bandanna_cbr","H_Bandanna_sand","H_Bandanna_gry","H_Bandanna_mcamo","H_Watchcap_blk","H_Watchcap_cbr","H_Watchcap_khk","H_Watchcap_camo","H_Booniehat_mgrn","H_MilCap_grn"
		],
		[
			"G_Lowprofile","G_Spectacles","G_Spectacles_Tinted","G_Combat","G_Shades_Black","G_Shades_Green","G_Shades_Red","G_Tactical_Black","G_Bandanna_blk","G_Bandanna_oli","G_Bandanna_khk","G_Bandanna_tan","G_Shades_Blue","G_Tactical_Clear","G_AirPurifyingRespirator_01_F"
		]
	] call MAZ_RS_fnc_createNewDefaultSideUniform;
}forEach ["Altis","Malden","Stratis"];

comment "Default NATO Roles";
{
	comment "NATO Recruit";
	[
		west,
		_x,
		"Recruit",
		[
			[
				["arifle_MXC_F","arifle_MXC_Black_F","arifle_MX_F","arifle_MX_Black_F","arifle_SPAR_01_blk_F","arifle_SPAR_01_snd_F"],
				["30Rnd_556x45_Stanag","30Rnd_556x45_Stanag_Tracer_Red","30Rnd_556x45_Stanag_Sand","30Rnd_556x45_Stanag_Sand_Tracer_Red","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_black_mag","30Rnd_65x39_caseless_mag_Tracer","30Rnd_65x39_caseless_black_mag_Tracer"]
			],
			[
				[],
				[]
			],
			[
				["hgun_P07_F","hgun_Pistol_heavy_01_F","hgun_P07_blk_F"],
				["16Rnd_9x21_Mag","16Rnd_9x21_green_Mag","11Rnd_45ACP_Mag"]
			],
			["optic_Aco","optic_ACO_grn","optic_Holosight","acc_flashlight","acc_pointer_IR","optic_Holosight_blk_F"]
		],
		["U_B_CombatUniform_mcam","U_B_CombatUniform_mcam_tshirt","U_B_CombatUniform_mcam_vest","U_B_CombatUniform_mcam_worn","U_B_CTRG_1","U_B_CTRG_2","U_B_CTRG_3","U_B_survival_uniform","U_I_G_Story_Protagonist_F","U_B_CTRG_Soldier_2_Arid_F"],
		["V_Chestrig_rgr","V_Chestrig_oli","V_TacVest_khk","V_TacVest_oli"],
		[],
		["H_Booniehat_khk","H_Booniehat_mcamo","H_Booniehat_tan","H_Booniehat_khk_hs","H_Cap_oli","H_Cap_headphones","H_Cap_tan","H_Cap_blk","H_Cap_tan_specops_US","H_Cap_khaki_specops_UK","H_Cap_grn","H_Cap_oli_hs","H_Cap_usblack","H_MilCap_mcamo","H_MilCap_gry","H_Bandanna_khk","H_Bandanna_khk_hs","H_Bandanna_cbr","H_Bandanna_sand","H_Bandanna_gry","H_Bandanna_mcamo","H_Watchcap_blk","H_Watchcap_cbr","H_Watchcap_khk","H_Watchcap_camo","H_Booniehat_mgrn","H_MilCap_grn"],
		["G_Spectacles","G_Spectacles_Tinted","G_Combat","G_Shades_Black","G_Shades_Green","G_Shades_Red","G_Tactical_Black","G_Bandanna_blk","G_Bandanna_oli","G_Bandanna_khk","G_Bandanna_tan","G_Shades_Blue","G_Tactical_Clear","G_AirPurifyingRespirator_01_F"],
		[],
		false
	] call MAZ_RS_fnc_createNewEquipmentForRole;

	comment "NATO Rifleman";
	[
		west,
		_x,
		"Rifleman",
		[
			[
				["arifle_MX_F","arifle_MX_Black_F","arifle_SPAR_01_blk_F","arifle_SPAR_01_snd_F"],
				["30Rnd_556x45_Stanag","30Rnd_556x45_Stanag_Tracer_Red","30Rnd_556x45_Stanag_Sand","30Rnd_556x45_Stanag_Sand_Tracer_Red","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_black_mag","30Rnd_65x39_caseless_mag_Tracer","30Rnd_65x39_caseless_black_mag_Tracer"]
			],
			[
				[],
				[]
			],
			[
				["hgun_P07_F","hgun_Pistol_heavy_01_F","hgun_P07_blk_F"],
				["16Rnd_9x21_Mag","16Rnd_9x21_green_Mag","11Rnd_45ACP_Mag"]
			],
			["optic_Aco","optic_ACO_grn","optic_Holosight","acc_flashlight","acc_flashlight_smg_01","acc_pointer_IR","optic_Holosight_blk_F"]
		],
		[],
		[],
		[],
		[],
		[],
		[],
		true
	] call MAZ_RS_fnc_createNewEquipmentForRole;

	comment "NATO Medic";
	[
		west,
		_x,
		"Medic",
		[
			[
				["arifle_MX_F","arifle_MX_Black_F","arifle_SPAR_01_blk_F","arifle_SPAR_01_snd_F"],
				["30Rnd_556x45_Stanag","30Rnd_556x45_Stanag_Tracer_Red","30Rnd_556x45_Stanag_Sand","30Rnd_556x45_Stanag_Sand_Tracer_Red","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_black_mag","30Rnd_65x39_caseless_mag_Tracer","30Rnd_65x39_caseless_black_mag_Tracer"]
			],
			[
				[],
				[]
			],
			[
				["hgun_P07_F","hgun_Pistol_heavy_01_F","hgun_P07_blk_F"],
				["16Rnd_9x21_Mag","16Rnd_9x21_green_Mag","11Rnd_45ACP_Mag"]
			],
			["optic_Aco","optic_ACO_grn","optic_Holosight","acc_flashlight","acc_flashlight_smg_01","acc_pointer_IR","optic_Holosight_blk_F"]
		],
		[],
		["V_PlateCarrierSpec_rgr"],
		["B_Kitbag_rgr"],
		["H_HelmetSpecB","H_HelmetSpecB_paint1","H_HelmetSpecB_paint2","H_HelmetSpecB_blk","H_HelmetSpecB_snakeskin","H_HelmetSpecB_sand"],
		[],
		["Medikit","G_Respirator_white_F","G_Respirator_Red_F","G_Respirator_blue_F"],
		true
	] call MAZ_RS_fnc_createNewEquipmentForRole;

	comment "NATO Engineer";
	[
		west,
		_x,
		"Engineer",
		[
			[
				["arifle_MX_F","arifle_MX_Black_F","arifle_SPAR_01_blk_F","arifle_SPAR_01_snd_F"],
				["30Rnd_556x45_Stanag","30Rnd_556x45_Stanag_Tracer_Red","30Rnd_556x45_Stanag_Sand","30Rnd_556x45_Stanag_Sand_Tracer_Red","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_black_mag","30Rnd_65x39_caseless_mag_Tracer","30Rnd_65x39_caseless_black_mag_Tracer","DemoCharge_Remote_Mag","SatchelCharge_Remote_Mag","ATMine_Range_Mag","ClaymoreDirectionalMine_Remote_Mag","APERSMine_Range_Mag","SLAMDirectionalMine_Wire_Mag","APERSTripMine_Wire_Mag"]
			],
			[
				[],
				[]
			],
			[
				["hgun_P07_F","hgun_Pistol_heavy_01_F","hgun_P07_blk_F"],
				["16Rnd_9x21_Mag","16Rnd_9x21_green_Mag","11Rnd_45ACP_Mag"]
			],
			["optic_Aco","optic_ACO_grn","optic_Holosight","acc_flashlight","acc_flashlight_smg_01","acc_pointer_IR","optic_Holosight_blk_F"]
		],
		[],
		["V_PlateCarrierGL_rgr"],
		[],
		[],
		[],
		["Toolkit","MineDetector"],
		true
	] call MAZ_RS_fnc_createNewEquipmentForRole;

	comment "NATO Crewman";
	[
		west,
		_x,
		"Crewman",
		[
			[
				["arifle_MXC_F","arifle_MXC_Black_F","SMG_01_F","arifle_SPAR_01_blk_F","arifle_SPAR_01_snd_F"],
				["30Rnd_556x45_Stanag","30Rnd_556x45_Stanag_Tracer_Red","30Rnd_556x45_Stanag_Sand","30Rnd_556x45_Stanag_Sand_Tracer_Red","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_black_mag","30Rnd_65x39_caseless_mag_Tracer","30Rnd_65x39_caseless_black_mag_Tracer","30Rnd_45ACP_Mag_SMG_01","30Rnd_45ACP_Mag_SMG_01_Tracer_Red"]
			],
			[
				[],
				[]
			],
			[
				["hgun_P07_F","hgun_Pistol_heavy_01_F","hgun_P07_blk_F"],
				["16Rnd_9x21_Mag","16Rnd_9x21_green_Mag","11Rnd_45ACP_Mag"]
			],
			["optic_Aco","optic_ACO_grn","optic_Holosight","acc_flashlight","acc_flashlight_smg_01","acc_pointer_IR","optic_Holosight_blk_F"]
		],
		["U_B_CombatUniform_mcam","U_B_CombatUniform_mcam_tshirt","U_B_CTRG_1","U_B_CTRG_2","U_B_CTRG_3"],
		["V_Chestrig_rgr","V_Chestrig_oli","V_TacVest_khk","V_TacVest_oli"],
		["B_AssaultPack_rgr"],
		["H_HelmetCrew_B"],
		["G_Spectacles","G_Spectacles_Tinted","G_Shades_Black","G_Shades_Green","G_Shades_Red","G_Tactical_Black","G_Aviator","G_Bandanna_blk","G_Bandanna_khk","G_Bandanna_tan","G_Bandanna_shades","G_Shades_Blue","G_Tactical_Clear"],
		["ToolKit"],
		false
	] call MAZ_RS_fnc_createNewEquipmentForRole;

	comment "NATO Heli Pilot";
	[
		west,
		_x,
		"Heli Pilot",
		[
			[
				["arifle_MXC_F","arifle_MXC_Black_F","SMG_01_F","arifle_SPAR_01_blk_F","arifle_SPAR_01_snd_F"],
				["30Rnd_556x45_Stanag","30Rnd_556x45_Stanag_Tracer_Red","30Rnd_556x45_Stanag_Sand","30Rnd_556x45_Stanag_Sand_Tracer_Red","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_black_mag","30Rnd_65x39_caseless_mag_Tracer","30Rnd_65x39_caseless_black_mag_Tracer","30Rnd_45ACP_Mag_SMG_01","30Rnd_45ACP_Mag_SMG_01_Tracer_Red"]
			],
			[
				[],
				[]
			],
			[
				["hgun_P07_F","hgun_Pistol_heavy_01_F","hgun_P07_blk_F"],
				["16Rnd_9x21_Mag","16Rnd_9x21_green_Mag","11Rnd_45ACP_Mag"]
			],
			["optic_Aco","optic_ACO_grn","optic_Holosight","acc_flashlight","acc_flashlight_smg_01","acc_pointer_IR","optic_Holosight_blk_F"]
		],
		["U_B_HeliPilotCoveralls"],
		["V_Chestrig_rgr","V_Chestrig_oli","V_TacVest_oli","V_TacVest_blk"],
		["B_AssaultPack_rgr","B_Parachute"],
		["H_PilotHelmetHeli_B","H_CrewHelmetHeli_B"],
		["G_Spectacles","G_Spectacles_Tinted","G_Shades_Black","G_Shades_Green","G_Shades_Red","G_Tactical_Black","G_Aviator","G_Bandanna_blk","G_Bandanna_khk","G_Bandanna_tan","G_Bandanna_shades","G_Shades_Blue","G_Tactical_Clear"],
		["ToolKit"],
		false
	] call MAZ_RS_fnc_createNewEquipmentForRole;

	comment "NATO Pilot";
	[
		west,
		_x,
		"Pilot",
		[
			[
				["arifle_MXC_F","arifle_MXC_Black_F","SMG_01_F","arifle_SPAR_01_blk_F","arifle_SPAR_01_snd_F"],
				["30Rnd_556x45_Stanag","30Rnd_556x45_Stanag_Tracer_Red","30Rnd_556x45_Stanag_Sand","30Rnd_556x45_Stanag_Sand_Tracer_Red","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_black_mag","30Rnd_65x39_caseless_mag_Tracer","30Rnd_65x39_caseless_black_mag_Tracer","30Rnd_45ACP_Mag_SMG_01","30Rnd_45ACP_Mag_SMG_01_Tracer_Red"]
			],
			[
				[],
				[]
			],
			[
				["hgun_P07_F","hgun_Pistol_heavy_01_F","hgun_P07_blk_F"],
				["16Rnd_9x21_Mag","16Rnd_9x21_green_Mag","11Rnd_45ACP_Mag"]
			],
			["optic_Aco","optic_ACO_grn","optic_Holosight","acc_flashlight","acc_flashlight_smg_01","acc_pointer_IR","optic_Holosight_blk_F"]
		],
		["U_B_PilotCoveralls"],
		[],
		["B_Parachute"],
		["H_PilotHelmetFighter_B"],
		["G_Spectacles","G_Spectacles_Tinted","G_Shades_Black","G_Shades_Green","G_Shades_Red","G_Tactical_Black","G_Aviator","G_Bandanna_blk","G_Bandanna_khk","G_Bandanna_tan","G_Bandanna_shades","G_Shades_Blue","G_Tactical_Clear"],
		[],
		false
	] call MAZ_RS_fnc_createNewEquipmentForRole;

	comment "NATO Squad leader";
	[
		west,
		_x,
		"Squad Leader",
		[
			[
				["arifle_MX_F","arifle_MX_Black_F","arifle_SPAR_01_blk_F","arifle_SPAR_01_snd_F"],
				["30Rnd_556x45_Stanag","30Rnd_556x45_Stanag_Tracer_Red","30Rnd_556x45_Stanag_Sand","30Rnd_556x45_Stanag_Sand_Tracer_Red","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_black_mag","30Rnd_65x39_caseless_mag_Tracer","30Rnd_65x39_caseless_black_mag_Tracer"]
			],
			[
				[],
				[]
			],
			[
				["hgun_P07_F","hgun_Pistol_heavy_01_F","hgun_P07_blk_F"],
				["16Rnd_9x21_Mag","16Rnd_9x21_green_Mag","11Rnd_45ACP_Mag"]
			],
			["optic_Aco","optic_ACO_grn","optic_Holosight","acc_flashlight","acc_flashlight_smg_01","acc_pointer_IR","optic_Holosight_blk_F","optic_Hamr","optic_MRCO","optic_ERCO_blk_F","optic_ERCO_snd_F"]
		],
		[],
		[],
		["B_RadioBag_01_mtp_F","B_RadioBag_01_black_F"],
		["H_HelmetSpecB","H_HelmetSpecB_paint1","H_HelmetSpecB_paint2","H_HelmetSpecB_blk","H_HelmetSpecB_snakeskin","H_HelmetSpecB_sand"],
		[],
		["Laserdesignator","B_UavTerminal"],
		true
	] call MAZ_RS_fnc_createNewEquipmentForRole;

	comment "NATO Autorifleman";
	[
		west,
		_x,
		"Autorifleman",
		[
			[
				["arifle_MX_SW_F","arifle_MX_SW_Black_F","LMG_03_F","arifle_SPAR_02_blk_F","arifle_SPAR_02_snd_F"],
				["100Rnd_65x39_caseless_mag","100Rnd_65x39_caseless_black_mag","100Rnd_65x39_caseless_mag_Tracer","100Rnd_65x39_caseless_black_mag_tracer","150Rnd_556x45_Drum_Mag_F","150Rnd_556x45_Drum_Sand_Mag_F","200Rnd_556x45_Box_F","200Rnd_556x45_Box_Tracer_F"]
			],
			[
				[],
				[]
			],
			[
				["hgun_P07_F","hgun_Pistol_heavy_01_F","hgun_P07_blk_F"],
				["16Rnd_9x21_Mag","16Rnd_9x21_green_Mag","11Rnd_45ACP_Mag"]
			],
			["optic_Aco","optic_ACO_grn","optic_Holosight","acc_flashlight","acc_flashlight_smg_01","acc_pointer_IR","optic_Holosight_blk_F","optic_Hamr","optic_ERCO_blk_F"]
		],
		[],
		[],
		["H_HelmetSpecB","H_HelmetSpecB_paint1","H_HelmetSpecB_paint2","H_HelmetSpecB_blk","H_HelmetSpecB_snakeskin","H_HelmetSpecB_sand"],
		[],
		[],
		[],
		true
	] call MAZ_RS_fnc_createNewEquipmentForRole;

	comment "NATO Light Anti-Tank";
	[
		west,
		_x,
		"Light Anti-Tank",
		[
			[
				["arifle_MX_F","arifle_MX_Black_F","arifle_SPAR_01_blk_F","arifle_SPAR_01_snd_F"],
				["30Rnd_556x45_Stanag","30Rnd_556x45_Stanag_Tracer_Red","30Rnd_556x45_Stanag_Sand","30Rnd_556x45_Stanag_Sand_Tracer_Red","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_black_mag","30Rnd_65x39_caseless_mag_Tracer","30Rnd_65x39_caseless_black_mag_Tracer"]
			],
			[
				["launch_NLAW_F","launch_MRAWS_olive_rail_F","launch_MRAWS_green_rail_F","launch_MRAWS_sand_rail_F"],
				["NLAW_F","MRAWS_HE_F","MRAWS_HEAT55_F"]
			],
			[
				["hgun_P07_F","hgun_Pistol_heavy_01_F","hgun_P07_blk_F"],
				["16Rnd_9x21_Mag","16Rnd_9x21_green_Mag","11Rnd_45ACP_Mag"]
			],
			["optic_Aco","optic_ACO_grn","optic_Holosight","acc_flashlight","acc_flashlight_smg_01","acc_pointer_IR","optic_Holosight_blk_F"]
		],
		[],
		[],
		["B_Kitbag_rgr"],
		[],
		[],
		[],
		true
	] call MAZ_RS_fnc_createNewEquipmentForRole;

	comment "NATO Marksman";
	[
		west,
		_x,
		"Marksman",
		[
			[
				["arifle_MXM_F","arifle_MXM_Black_F","srifle_EBR_F","srifle_DMR_03_F","srifle_DMR_03_khaki_F","srifle_DMR_03_tan_F","srifle_DMR_03_multicam_F","arifle_SPAR_03_blk_F","arifle_SPAR_03_snd_F"],
				["30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_black_mag","30Rnd_65x39_caseless_mag_Tracer","30Rnd_65x39_caseless_black_mag_Tracer","20Rnd_762x51_Mag"]
			],
			[
				[],
				[]
			],
			[
				["hgun_P07_F","hgun_Pistol_heavy_01_F","hgun_P07_blk_F"],
				["16Rnd_9x21_Mag","16Rnd_9x21_green_Mag","11Rnd_45ACP_Mag"]
			],
			["acc_flashlight","acc_flashlight_smg_01","acc_pointer_IR","muzzle_snds_H","optic_SOS","optic_DMS","bipod_01_F_snd","bipod_01_F_blk","muzzle_snds_H_snd_F","optic_NVS"]
		],
		["U_B_CombatUniform_mcam","U_B_CombatUniform_mcam_tshirt","U_B_CombatUniform_mcam_vest","U_B_GhillieSuit","U_B_CTRG_1","U_B_CTRG_2","U_B_CTRG_3","U_B_survival_uniform"],
		["V_Rangemaster_belt","V_PlateCarrier1_rgr","V_Chestrig_rgr","V_Chestrig_oli","V_TacVest_khk","V_TacVest_oli"],
		[],
		["H_Booniehat_khk","H_Booniehat_mcamo","H_Booniehat_tan","H_Booniehat_khk_hs","H_Bandanna_khk","H_Bandanna_khk_hs","H_Bandanna_cbr","H_Bandanna_sand","H_Bandanna_mcamo","H_ShemagOpen_tan","H_Watchcap_cbr","H_Watchcap_khk","H_Watchcap_camo","H_Booniehat_mgrn"],
		["G_Tactical_Black","G_Bandanna_oli","G_Bandanna_khk","G_Bandanna_tan","G_Tactical_Clear"],
		["Rangefinder"],
		false
	] call MAZ_RS_fnc_createNewEquipmentForRole;

	comment "NATO Grenadier";
	[
		west,
		_x,
		"Grenadier",
		[
			[
				["arifle_MX_GL_F","arifle_MX_GL_Black_F","arifle_SPAR_01_GL_blk_F","arifle_SPAR_01_GL_snd_F"],
				["1Rnd_HE_Grenade_shell","1Rnd_Smoke_Grenade_shell","1Rnd_SmokeGreen_Grenade_shell","1Rnd_SmokeRed_Grenade_shell","1Rnd_SmokeYellow_Grenade_shell","1Rnd_SmokePurple_Grenade_shell","1Rnd_SmokeBlue_Grenade_shell","1Rnd_SmokeOrange_Grenade_shell","3Rnd_HE_Grenade_shell","3Rnd_Smoke_Grenade_shell","3Rnd_SmokeRed_Grenade_shell","3Rnd_SmokeGreen_Grenade_shell","3Rnd_SmokeYellow_Grenade_shell","3Rnd_SmokePurple_Grenade_shell","3Rnd_SmokeBlue_Grenade_shell","3Rnd_SmokeOrange_Grenade_shell","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag_Tracer_Red","30Rnd_556x45_Stanag_Sand","30Rnd_556x45_Stanag_Sand_Tracer_Red","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_black_mag","30Rnd_65x39_caseless_mag_Tracer","30Rnd_65x39_caseless_black_mag_Tracer"]
			],
			[
				[],
				[]
			],
			[
				["hgun_P07_F","hgun_Pistol_heavy_01_F","hgun_P07_blk_F"],
				["16Rnd_9x21_Mag","16Rnd_9x21_green_Mag","11Rnd_45ACP_Mag"]
			],
			["optic_Aco","optic_ACO_grn","optic_Holosight","acc_flashlight","acc_flashlight_smg_01","acc_pointer_IR","optic_Holosight_blk_F"]
		],
		["U_B_CombatUniform_mcam","U_B_CombatUniform_mcam_tshirt","U_B_CombatUniform_mcam_vest","U_B_CombatUniform_mcam_worn","U_B_CTRG_1","U_B_CTRG_2","U_B_CTRG_3","U_I_G_Story_Protagonist_F","U_B_CTRG_Soldier_2_Arid_F"],
		["V_PlateCarrierGL_rgr"],
		["B_AssaultPack_rgr"],
		["H_HelmetB","H_HelmetB_camo","H_HelmetB_light","H_Booniehat_khk","H_Booniehat_mcamo","H_Booniehat_tan","H_Booniehat_khk_hs","H_HelmetSpecB","H_HelmetSpecB_paint1","H_HelmetSpecB_paint2","H_HelmetSpecB_blk","H_HelmetSpecB_snakeskin","H_HelmetSpecB_sand","H_HelmetB_grass","H_HelmetB_snakeskin","H_HelmetB_desert","H_HelmetB_black","H_HelmetB_sand","H_Cap_oli","H_Cap_headphones","H_Cap_tan","H_Cap_blk","H_Cap_tan_specops_US","H_Cap_khaki_specops_UK","H_Cap_grn","H_Cap_oli_hs","H_Cap_usblack","H_MilCap_mcamo","H_MilCap_gry","H_HelmetB_light_grass","H_HelmetB_light_snakeskin","H_HelmetB_light_desert","H_HelmetB_light_black","H_HelmetB_light_sand","H_Bandanna_khk","H_Bandanna_khk_hs","H_Bandanna_cbr","H_Bandanna_sand","H_Bandanna_gry","H_Bandanna_mcamo","H_Watchcap_blk","H_Watchcap_cbr","H_Watchcap_khk","H_Watchcap_camo","H_Booniehat_mgrn","H_MilCap_grn"],
		["G_Spectacles","G_Spectacles_Tinted","G_Combat","G_Shades_Black","G_Shades_Green","G_Shades_Red","G_Tactical_Black","G_Bandanna_blk","G_Bandanna_oli","G_Bandanna_khk","G_Bandanna_tan","G_Shades_Blue","G_Tactical_Clear","G_AirPurifyingRespirator_01_F"],
		[],
		true
	] call MAZ_RS_fnc_createNewEquipmentForRole;

	comment "NATO Heavy Gunner";
	[
		west,
		_x,
		"Heavy Gunner",
		[
			[
				["MMG_02_camo_F","MMG_02_black_F","MMG_02_sand_F"],
				["130Rnd_338_Mag"]
			],
			[
				[],
				[]
			],
			[
				["hgun_P07_F","hgun_Pistol_heavy_01_F","hgun_P07_blk_F"],
				["16Rnd_9x21_Mag","16Rnd_9x21_green_Mag","11Rnd_45ACP_Mag"]
			],
			["optic_Aco","optic_ACO_grn","optic_Holosight","acc_flashlight","acc_flashlight_smg_01","acc_pointer_IR","optic_Holosight_blk_F","optic_Hamr","optic_ERCO_blk_F"]
		],
		[],
		[],
		[],
		[],
		[],
		[],
		true
	] call MAZ_RS_fnc_createNewEquipmentForRole;

	comment "NATO Heavy Anti-Tank";
	[
		west,
		_x,
		"Heavy Anti-Tank",
		[
			[
				["arifle_MX_F","arifle_MX_Black_F","arifle_SPAR_01_blk_F","arifle_SPAR_01_snd_F"],
				["30Rnd_556x45_Stanag","30Rnd_556x45_Stanag_Tracer_Red","30Rnd_556x45_Stanag_Sand","30Rnd_556x45_Stanag_Sand_Tracer_Red","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_black_mag","30Rnd_65x39_caseless_mag_Tracer","30Rnd_65x39_caseless_black_mag_Tracer"]
			],
			[
				["launch_B_Titan_F","launch_B_Titan_short_F","launch_MRAWS_olive_F","launch_MRAWS_green_F","launch_MRAWS_sand_F"],
				["Titan_AA","Titan_AT","MRAWS_HEAT_F","MRAWS_HEAT55_F"]
			],
			[
				["hgun_P07_F","hgun_Pistol_heavy_01_F","hgun_P07_blk_F"],
				["16Rnd_9x21_Mag","16Rnd_9x21_green_Mag","11Rnd_45ACP_Mag"]
			],
			["optic_Aco","optic_ACO_grn","optic_Holosight","acc_flashlight","acc_flashlight_smg_01","acc_pointer_IR","optic_Holosight_blk_F"]
		],
		[],
		[],
		["B_Kitbag_rgr"],
		[],
		[],
		[],
		true
	] call MAZ_RS_fnc_createNewEquipmentForRole;

	comment "NATO Sharpshooter";
	[
		west,
		_x,
		"Sharpshooter",
		[
			[
				["srifle_LRR_F","srifle_LRR_camo_F","srifle_DMR_02_F","srifle_DMR_02_camo_F","srifle_DMR_02_sniper_F"],
				["7Rnd_408_Mag","10Rnd_338_Mag"]
			],
			[
				[],
				[]
			],
			[
				["hgun_P07_F","hgun_Pistol_heavy_01_F","hgun_P07_blk_F"],
				["16Rnd_9x21_Mag","16Rnd_9x21_green_Mag","11Rnd_45ACP_Mag"]
			],
			["muzzle_snds_L","muzzle_snds_acp","optic_LRPS","optic_AMS","optic_AMS_snd","optic_KHS_blk","optic_KHS_tan","bipod_01_F_blk","optic_NVS"]
		],
		["U_B_CombatUniform_mcam","U_B_CombatUniform_mcam_tshirt","U_B_CombatUniform_mcam_vest","U_B_GhillieSuit","U_B_CTRG_1","U_B_CTRG_2","U_B_CTRG_3","U_B_survival_uniform"],
		["V_Rangemaster_belt","V_PlateCarrier1_rgr","V_Chestrig_rgr","V_Chestrig_oli","V_TacVest_khk","V_TacVest_oli"],
		[],
		["H_Booniehat_khk","H_Booniehat_mcamo","H_Booniehat_tan","H_Booniehat_khk_hs","H_Bandanna_khk","H_Bandanna_khk_hs","H_Bandanna_cbr","H_Bandanna_sand","H_Bandanna_mcamo","H_ShemagOpen_tan","H_Watchcap_cbr","H_Watchcap_khk","H_Watchcap_camo","H_Booniehat_mgrn"],
		["G_Tactical_Black","G_Bandanna_oli","G_Bandanna_khk","G_Bandanna_tan","G_Tactical_Clear"],
		["Rangefinder"],
		false
	] call MAZ_RS_fnc_createNewEquipmentForRole;
}forEach ["Altis","Malden","Stratis"];
