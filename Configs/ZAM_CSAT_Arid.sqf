comment "
	Author: ZAM
	Faction: CSAT Arid
	Maps: Altis, Stratis
	Version: 1.1
";

comment "Default CSAT Uniforms";
{
	comment "Default CSAT Uniforms";
	[
		east,
		_x,
		["U_O_CombatUniform_ocamo","U_O_CombatUniform_oucamo","U_O_officer_noInsignia_hex_F"],
		["V_HarnessO_brn","V_HarnessO_gry","V_Chestrig_khk","V_BandollierB_cbr","V_TacChestrig_cbr_F","V_Chestrig_blk","V_TacVest_blk","V_BandollierB_blk"],
		["B_AssaultPack_ocamo"],	
		["H_HelmetSpecO_blk","H_HelmetSpecO_ocamo","H_Bandanna_cbr","H_Bandanna_gry","H_Booniehat_khk_hs","H_Cap_brn_SPECOPS","H_HelmetO_ocamo","H_HelmetO_oucamo"],
		["G_Lowprofile","G_Spectacles","G_Spectacles_Tinted","G_Combat","G_Shades_Black","G_Shades_Green","G_Shades_Red","G_Tactical_Black","G_Bandanna_blk","G_Bandanna_oli","G_Bandanna_khk","G_Bandanna_tan","G_Shades_Blue","G_Tactical_Clear","G_AirPurifyingRespirator_02_sand_F"]
	] call MAZ_RS_fnc_createNewDefaultSideUniform;
}forEach ["Altis","Stratis"];

comment "Default CSAT Roles";
{
	comment "CSAT Recruit";
	[
		east,
		_x,
		"Recruit",
		[
			[
				["arifle_Katiba_F","arifle_Katiba_C_F","arifle_CTAR_blk_F","arifle_CTAR_hex_F"],
				["30Rnd_580x42_Mag_F","30Rnd_580x42_Mag_Tracer_F","30Rnd_65x39_caseless_green","30Rnd_65x39_caseless_green_mag_Tracer"]
			],
			[
				[],
				[]
			],
			[
				["hgun_Pistol_heavy_02_F","hgun_Rook40_F","hgun_Pistol_01_F"],
				["16Rnd_9x21_green_Mag","6Rnd_45ACP_Cylinder","10Rnd_9x21_Mag"]
			],
			["optic_Aco","optic_ACO_grn","acc_pointer_IR","optic_Holosight_blk_F","acc_flashlight","acc_flashlight_smg_01","optic_Holosight"]
		],
		[],
		[],
		[],
		[],
		[],
		[],
		true
	] call MAZ_RS_fnc_createNewEquipmentForRole;

	comment "CSAT Rifleman";
	[
		east,
		_x,
		"Rifleman",
		[
			[
				["arifle_Katiba_F","arifle_Katiba_C_F","arifle_CTAR_blk_F","arifle_CTAR_hex_F"],
				["30Rnd_580x42_Mag_F","30Rnd_580x42_Mag_Tracer_F","30Rnd_65x39_caseless_green","30Rnd_65x39_caseless_green_mag_Tracer"]
			],
			[
				[],
				[]
			],
			[
				["hgun_Pistol_heavy_02_F","hgun_Rook40_F","hgun_Pistol_01_F"],
				["16Rnd_9x21_green_Mag","6Rnd_45ACP_Cylinder","10Rnd_9x21_Mag"]
			],
			["optic_Aco","optic_ACO_grn","acc_pointer_IR","optic_Holosight_blk_F","acc_flashlight","acc_flashlight_smg_01","optic_Holosight"]
		],
		[],
		[],
		[],
		[],
		[],
		[],
		true
	] call MAZ_RS_fnc_createNewEquipmentForRole;

	comment "CSAT Medic";
	[
		east,
		_x,
		"Medic",
		[
			[
				["arifle_Katiba_F","arifle_Katiba_C_F","arifle_CTAR_blk_F","arifle_CTAR_hex_F"],
				["30Rnd_580x42_Mag_F","30Rnd_580x42_Mag_Tracer_F","30Rnd_65x39_caseless_green","30Rnd_65x39_caseless_green_mag_Tracer"]
			],
			[
				[],
				[]
			],
			[
				["hgun_Pistol_heavy_02_F","hgun_Rook40_F","hgun_Pistol_01_F"],
				["16Rnd_9x21_green_Mag","6Rnd_45ACP_Cylinder","10Rnd_9x21_Mag"]
			],
			["optic_Aco","optic_ACO_grn","acc_pointer_IR","optic_Holosight_blk_F","acc_flashlight","acc_flashlight_smg_01","optic_Holosight"]
		],
		[],
		[],
		["B_FieldPack_ocamo"],
		[],
		[],
		["Medikit"],
		true
	] call MAZ_RS_fnc_createNewEquipmentForRole;

	comment "CSAT Engineer";
	[
		east,
		_x,
		"Engineer",
		[
			[
				["arifle_Katiba_F","arifle_Katiba_C_F","arifle_CTAR_blk_F","arifle_CTAR_hex_F"],
				["30Rnd_580x42_Mag_F","30Rnd_580x42_Mag_Tracer_F","30Rnd_65x39_caseless_green","30Rnd_65x39_caseless_green_mag_Tracer",
				"DemoCharge_Remote_Mag","SatchelCharge_Remote_Mag","ATMine_Range_Mag","ClaymoreDirectionalMine_Remote_Mag","APERSMine_Range_Mag","SLAMDirectionalMine_Wire_Mag","APERSTripMine_Wire_Mag"]
			],
			[
				[],
				[]
			],
			[
				["hgun_Pistol_heavy_02_F","hgun_Rook40_F","hgun_Pistol_01_F"],
				["16Rnd_9x21_green_Mag","6Rnd_45ACP_Cylinder","10Rnd_9x21_Mag"]
			],
			["optic_Aco","optic_ACO_grn","acc_pointer_IR","optic_Holosight_blk_F","acc_flashlight","acc_flashlight_smg_01","optic_Holosight"]
		],
		[],
		[],
		["B_FieldPack_ocamo"],
		[],
		[],
		["Toolkit","MineDetector"],
		true
	] call MAZ_RS_fnc_createNewEquipmentForRole;

	comment "CSAT Crewman";
	[
		east,
		_x,
		"Crewman",
		[
			[
				["arifle_Katiba_F","arifle_Katiba_C_F","arifle_CTAR_blk_F","arifle_CTAR_hex_F"],
				["30Rnd_580x42_Mag_F","30Rnd_580x42_Mag_Tracer_F","30Rnd_65x39_caseless_green","30Rnd_65x39_caseless_green_mag_Tracer"]
			],
			[
				[],
				[]
			],
			[
				["hgun_Pistol_heavy_02_F","hgun_Rook40_F","hgun_Pistol_01_F"],
				["16Rnd_9x21_green_Mag","6Rnd_45ACP_Cylinder","10Rnd_9x21_Mag"]
			],
			["optic_Aco","optic_ACO_grn","acc_pointer_IR","optic_Holosight_blk_F","acc_flashlight","acc_flashlight_smg_01","optic_Holosight"]
		],
		["U_O_CombatUniform_ocamo","U_O_CombatUniform_oucamo"],
		["V_TacVest_khk"],
		["B_AssaultPack_ocamo"],
		["H_HelmetCrew_O","H_Tank_black_F"],
		["G_Spectacles","G_Spectacles_Tinted","G_Combat","G_Shades_Black","G_Shades_Green","G_Shades_Red","G_Tactical_Black","G_Bandanna_blk","G_Bandanna_oli","G_Bandanna_khk","G_Bandanna_tan","G_Shades_Blue","G_Tactical_Clear","G_AirPurifyingRespirator_02_sand_F"],
		["Toolkit"],
		true
	] call MAZ_RS_fnc_createNewEquipmentForRole;

	comment "CSAT Heli Pilot";
	[
		east,
		_x,
		"Heli Pilot",	
		[
			[
				["arifle_Katiba_C_F","SMG_02_F"],
				["30Rnd_65x39_caseless_green","30Rnd_65x39_caseless_green_mag_Tracer","30Rnd_9x21_Mag_SMG_02_Tracer_Green"]
			],
			[
				[],
				[]
			],
			[
				["hgun_Pistol_heavy_02_F","hgun_Rook40_F","hgun_Pistol_01_F"],
				["16Rnd_9x21_green_Mag","6Rnd_45ACP_Cylinder","10Rnd_9x21_Mag"]
			],
			["optic_Aco","optic_ACO_grn","acc_pointer_IR","optic_Holosight_blk_F","acc_flashlight","acc_flashlight_smg_01","optic_Holosight"]
		],
		["U_O_PilotCoveralls"],
		["V_TacVest_khk"],
		["B_Parachute","B_AssaultPack_ocamo"],
		["H_PilotHelmetHeli_O","H_CrewHelmetHeli_O"],
		[],
		["Toolkit"],
		false
	] call MAZ_RS_fnc_createNewEquipmentForRole;

	comment "CSAT Pilot";
	[
		east,
		_x,
		"Pilot",
		[
			[
				["SMG_02_F","arifle_Katiba_C_F"],
				["30Rnd_65x39_caseless_green_mag_Tracer","30Rnd_65x39_caseless_green","30Rnd_65x39_caseless_green_mag_Tracer"]
			],
			[
				[],
				[]
			],
			[
				["hgun_Pistol_heavy_02_F","hgun_Rook40_F","hgun_Pistol_01_F"],
				["16Rnd_9x21_green_Mag","6Rnd_45ACP_Cylinder","10Rnd_9x21_Mag"]
			],
			["optic_Aco","optic_ACO_grn","acc_pointer_IR","optic_Holosight_blk_F","acc_flashlight","acc_flashlight_smg_01","optic_Holosight"]
		],
		["U_O_PilotCoveralls"],
		[],
		["B_Parachute"],
		["H_PilotHelmetFighter_O"],
		[],
		[],
		false
	] call MAZ_RS_fnc_createNewEquipmentForRole;

	comment "CSAT Squad Leader";
	[
		east,
		_x,
		"Squad Leader",
		[
			[
				["arifle_Katiba_F","arifle_Katiba_C_F","arifle_CTAR_blk_F","arifle_CTAR_hex_F"],
				["30Rnd_580x42_Mag_F","30Rnd_580x42_Mag_Tracer_F","30Rnd_65x39_caseless_green","30Rnd_65x39_caseless_green_mag_Tracer"]
			],
			[
				[],
				[]
			],
			[
				["hgun_Pistol_heavy_02_F","hgun_Rook40_F","hgun_Pistol_01_F"],
				["16Rnd_9x21_green_Mag","6Rnd_45ACP_Cylinder","10Rnd_9x21_Mag"]
			],
			["optic_Aco","optic_ACO_grn","acc_pointer_IR","optic_Holosight_blk_F","acc_flashlight","acc_flashlight_smg_01","optic_Arco_blk_f","optic_Hamr","optic_MRCO"]
		],
		[],
		["V_HarnessOGL_brn","V_HarnessOGL_gry"],
		[],
		["H_HelmetLeaderO_ocamo","H_HelmetLeaderO_oucamo"],
		["B_RadioBag_01_hex_F"],
		["Laserdesignator_02","O_UavTerminal"],
		true
	] call MAZ_RS_fnc_createNewEquipmentForRole;

	comment "CSAT Autorifleman";
	[
		east,
		_x,
		"Autorifleman",
		[
			[
				["LMG_Zafir_F","arifle_CTAR_blk_F","arifle_CTAR_hex_F","arifle_CTARS_blk_F","arifle_CTARS_hex_F"],
				["150Rnd_762x54_Box","150Rnd_762x54_Box_Tracer","100Rnd_580x42_Mag_F","100Rnd_580x42_hex_Mag_F","100Rnd_580x42_hex_Mag_Tracer_F"]
			],
			[
				[],
				[]
			],
			[
				["hgun_Pistol_heavy_02_F","hgun_Rook40_F","hgun_Pistol_01_F"],
				["16Rnd_9x21_green_Mag","6Rnd_45ACP_Cylinder","10Rnd_9x21_Mag"]
			],
			["optic_Aco","optic_ACO_grn","acc_pointer_IR","optic_Holosight_blk_F","acc_flashlight","acc_flashlight_smg_01","optic_Holosight"]
		],
		[],
		[],
		[],
		[],
		[],
		[],
		true
	] call MAZ_RS_fnc_createNewEquipmentForRole;
	
	comment "CSAT LAT(Light AT)";
	[
		east,
		_x,
		"Light Anti-Tank",
		[
			[
				["arifle_Katiba_F","arifle_Katiba_C_F","arifle_CTAR_blk_F","arifle_CTAR_hex_F"],
				["30Rnd_580x42_Mag_F","30Rnd_580x42_Mag_Tracer_F","30Rnd_65x39_caseless_green","30Rnd_65x39_caseless_green_mag_Tracer"]
			],
			[
				["launch_RPG32_F","launch_RPG7_F"],
				["RPG32_F","RPG32_HE_F","RPG7_F"]
			],
			[
				["hgun_Pistol_heavy_02_F","hgun_Rook40_F","hgun_Pistol_01_F"],
				["16Rnd_9x21_green_Mag","6Rnd_45ACP_Cylinder","10Rnd_9x21_Mag"]
			],
			["optic_Aco","optic_ACO_grn","acc_pointer_IR","optic_Holosight_blk_F","acc_flashlight","acc_flashlight_smg_01","optic_Holosight"]
		],
		[],
		[],
		["B_TacticalPack_ocamo","B_FieldPack_ocamo"],
		[],
		[],
		[],
		true
	] call MAZ_RS_fnc_createNewEquipmentForRole;

	comment "CSAT Marksman";
	[
		east,
		_x,
		"Marksman",
		[
			[
				["srifle_DMR_01_F","srifle_DMR_07_blk_F","srifle_DMR_07_hex_F"],
				["10Rnd_762x54_Mag","20Rnd_650x39_Cased_Mag_F"]
			],
			[
				[],
				[]
			],
			[
				["hgun_Pistol_heavy_02_F","hgun_Rook40_F","hgun_Pistol_01_F"],
				["16Rnd_9x21_green_Mag","6Rnd_45ACP_Cylinder","10Rnd_9x21_Mag"]
			],
			["bipod_02_F_blk","muzzle_snds_H","optic_SOS","optic_DMS","bipod_01_F_snd","muzzle_snds_H_snd_F"]
		],
		[],
		[],
		[],
		[],
		[],
		["Rangefinder"],
		true
	] call MAZ_RS_fnc_createNewEquipmentForRole;

	comment "CSAT Grenadier";
	[
		east,
		_x,
		"Grenadier",
		[
			[
				["arifle_Katiba_GL_F","arifle_CTAR_GL_blk_F"],
				["30Rnd_580x42_Mag_F","30Rnd_580x42_Mag_Tracer_F","30Rnd_65x39_caseless_green","30Rnd_65x39_caseless_green_mag_Tracer","1Rnd_HE_Grenade_shell","UGL_FlareWhite_F","UGL_FlareGreen_F","UGL_FlareRed_F","UGL_FlareYellow_F","UGL_FlareCIR_F","1Rnd_Smoke_Grenade_shell","1Rnd_SmokeRed_Grenade_shell","1Rnd_SmokeGreen_Grenade_shell","1Rnd_SmokeYellow_Grenade_shell","1Rnd_SmokePurple_Grenade_shell","1Rnd_SmokeBlue_Grenade_shell","1Rnd_SmokeOrange_Grenade_shell"]
			],
			[
				[],
				[]
			],
			[
				["hgun_Pistol_heavy_02_F","hgun_Rook40_F","hgun_Pistol_01_F"],
				["16Rnd_9x21_green_Mag","6Rnd_45ACP_Cylinder","10Rnd_9x21_Mag"]
			],
			["optic_Aco","optic_ACO_grn","acc_pointer_IR","optic_Holosight_blk_F","acc_flashlight","acc_flashlight_smg_01","optic_Holosight"]
		],
		["U_O_CombatUniform_ocamo","U_O_CombatUniform_oucamo"],
		["V_HarnessOGL_brn","V_HarnessOGL_gry"],
		["B_AssaultPack_ocamo"],
		["H_HelmetLeaderO_ocamo","H_HelmetLeaderO_oucamo","H_HelmetSpecO_blk","H_HelmetSpecO_ocamo","H_Bandanna_cbr","H_Bandanna_gry","H_Booniehat_khk_hs","H_Cap_brn_SPECOPS","H_HelmetO_ocamo","H_HelmetO_oucamo"],
		["G_Spectacles","G_Spectacles_Tinted","G_Combat","G_Shades_Black","G_Shades_Green","G_Shades_Red","G_Tactical_Black","G_Bandanna_blk","G_Bandanna_oli","G_Bandanna_khk","G_Bandanna_tan","G_Shades_Blue","G_Tactical_Clear","G_AirPurifyingRespirator_02_sand_F"],
		[],
		false
	] call MAZ_RS_fnc_createNewEquipmentForRole;

	comment "Heavy Gunner";
	[
		east,
		_x,
		"Heavy Gunner",
		[
			[
				["MMG_01_hex_F","MMG_01_tan_F"],
				["150Rnd_93x64_Mag"]
			],
			[
				[],
				[]
			],
			[
				["hgun_Pistol_heavy_02_F","hgun_Rook40_F","hgun_Pistol_01_F"],
				["16Rnd_9x21_green_Mag","6Rnd_45ACP_Cylinder","10Rnd_9x21_Mag"]
			],
			["acc_flashlight","optic_Aco","optic_ACO_grn","optic_Holosight","acc_flashlight_smg_01","acc_pointer_IR","bipod_02_F_tan","bipod_02_F_hex","optic_Holosight_blk_F"]
		],
		[],
		[],
		[],
		[],
		[],
		[],
		true
	] call MAZ_RS_fnc_createNewEquipmentForRole;

	comment "CSAT HAT (Heavy AT)";
	[
		east,
		_x,
		"Heavy Anti-Tank",
		[
			[
				["arifle_Katiba_F","arifle_Katiba_C_F","arifle_CTAR_blk_F","arifle_CTAR_hex_F"],
				["30Rnd_580x42_Mag_F","30Rnd_580x42_Mag_Tracer_F","30Rnd_65x39_caseless_green","30Rnd_65x39_caseless_green_mag_Tracer"]
			],
			[
				["launch_O_Titan_F","launch_O_Titan_short_F"],
				["Titan_AA","Titan_AT","Titan_AP"]
			],
			[
				["hgun_Pistol_heavy_02_F","hgun_Rook40_F","hgun_Pistol_01_F"],
				["16Rnd_9x21_green_Mag","6Rnd_45ACP_Cylinder","10Rnd_9x21_Mag"]
			],
			["optic_Aco","optic_ACO_grn","acc_pointer_IR","optic_Holosight_blk_F","acc_flashlight","acc_flashlight_smg_01"]
		],
		[],
		[],
		["B_TacticalPack_ocamo","B_FieldPack_ocamo"],
		[],
		[],
		[],
		true
	] call MAZ_RS_fnc_createNewEquipmentForRole;

	comment "Sharpshooter";
	[
		east,
		_x,
		"Sharpshooter",
		[
			[
				["srifle_GM6_F","srifle_GM6_camo_F","srifle_DMR_05_blk_F","srifle_DMR_05_hex_F"],
				["5Rnd_127x108_Mag","10Rnd_93x64_DMR_05_Mag"]
			],
			[
				[],
				[]
			],
			[
				["hgun_Pistol_heavy_02_F","hgun_Rook40_F","hgun_Pistol_01_F"],
				["16Rnd_9x21_green_Mag","6Rnd_45ACP_Cylinder","10Rnd_9x21_Mag"]
			],
			["acc_pointer_IR","optic_NVS","optic_LRPS","optic_AMS","optic_KHS_blk","bipod_02_F_blk","bipod_02_F_hex","muzzle_snds_L"]
		],
		[],
		[],
		[],
		[],
		[],
		["Rangefinder"],
		true
	] call MAZ_RS_fnc_createNewEquipmentForRole;
}forEach ["Altis","Stratis"];