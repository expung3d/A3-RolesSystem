comment "
	NORTHCOM's AAF-CTRG Joint Missions Config
	For Altis.
";

[
	independent,
	"Altis",
	[
		// Uniforms ONLY
		"U_I_CombatUniform","U_I_CombatUniform_shortsleeve","U_I_OfficerUniform","U_I_Wetsuit","U_BG_Guerilla1_1","U_BG_leader","U_B_CTRG_1","U_B_CTRG_2","U_B_CTRG_3","U_B_CTRG_Soldier_F","U_B_CTRG_Soldier_2_F","U_B_CTRG_Soldier_3_F","U_B_CTRG_Soldier_Arid_F","U_B_CTRG_Soldier_2_Arid_F","U_B_CTRG_Soldier_3_Arid_F","U_BG_Guerilla1_2_F","U_I_E_Uniform_01_F","U_I_E_Uniform_01_tanktop_F","U_I_E_Uniform_01_shortsleeve_F","U_I_CBRN_Suit_01_AAF_F","U_B_CTRG_Soldier_urb_1_F","U_B_CTRG_Soldier_urb_2_F","U_B_CTRG_Soldier_urb_3_F"
	],
	[
		// Vests ONLY
		"V_Rangemaster_belt","V_BandollierB_khk","V_BandollierB_cbr","V_BandollierB_rgr","V_BandollierB_blk","V_BandollierB_oli","V_Chestrig_khk","V_Chestrig_rgr","V_Chestrig_blk","V_Chestrig_oli","V_TacVest_khk","V_TacVest_brn","V_TacVest_oli","V_TacVest_blk","V_TacVest_camo","V_TacVestIR_blk","V_PlateCarrierIA1_dgtl","V_PlateCarrierIA2_dgtl","V_RebreatherB","V_RebreatherIA","V_PlateCarrierL_CTRG","V_PlateCarrierH_CTRG","V_I_G_resistanceLeader_F","V_TacChestrig_grn_F","V_TacChestrig_oli_F","V_TacChestrig_cbr_F","V_PlateCarrier1_rgr_noflag_F","V_PlateCarrier2_rgr_noflag_F","V_CarrierRigKBT_01_Olive_F","V_CarrierRigKBT_01_light_Olive_F","V_SmershVest_01_F","V_SmershVest_01_radio_F"
	],
	[
		// Backpacks ONLY
		"B_AssaultPack_khk","B_AssaultPack_rgr","B_AssaultPack_sgg","B_AssaultPack_blk","B_AssaultPack_cbr","B_Kitbag_rgr","B_Kitbag_sgg","B_Kitbag_cbr","B_Kitbag_tan","B_TacticalPack_rgr","B_TacticalPack_blk","B_TacticalPack_oli","B_FieldPack_khk","B_FieldPack_cbr","B_FieldPack_blk","B_FieldPack_oli","B_LegStrapBag_black_F","B_LegStrapBag_coyote_F","B_LegStrapBag_olive_F","B_FieldPack_green_F"
	],
	[
		// Helmets ONLY
		"H_HelmetHBK_F","H_HelmetB","H_HelmetB_camo","H_HelmetB_light","H_Booniehat_khk","H_Booniehat_oli","H_Booniehat_tan","H_Booniehat_dgtl","H_Booniehat_khk_hs","H_HelmetSpecB","H_HelmetSpecB_paint1","H_HelmetSpecB_paint2","H_HelmetSpecB_blk","H_HelmetSpecB_snakeskin","H_HelmetSpecB_sand","H_HelmetB_grass","H_HelmetB_snakeskin","H_HelmetB_desert","H_HelmetB_black","H_HelmetB_sand","H_Cap_oli","H_Cap_headphones","H_Cap_tan","H_Cap_blk","H_Cap_khaki_specops_UK","H_Cap_grn","H_Cap_blk_Raven","H_Cap_oli_hs","H_Cap_surfer","H_MilCap_dgtl","H_HelmetB_light_grass","H_HelmetB_light_snakeskin","H_HelmetB_light_desert","H_HelmetB_light_black","H_HelmetB_light_sand","H_Bandanna_surfer","H_Bandanna_khk","H_Bandanna_khk_hs","H_Bandanna_cbr","H_Bandanna_sgg","H_Bandanna_sand","H_Bandanna_surfer_blk","H_Bandanna_surfer_grn","H_Bandanna_gry","H_Bandanna_camo","H_Shemag_olive","H_Shemag_olive_hs","H_ShemagOpen_tan","H_Beret_blk","H_Beret_02","H_Watchcap_blk","H_Watchcap_cbr","H_Watchcap_khk","H_Watchcap_camo","H_HelmetB_TI_tna_F","H_HelmetB_TI_arid_F","H_HeadSet_black_F","H_PASGT_basic_olive_F","H_PASGT_basic_black_F","H_HeadBandage_stained_F","H_HeadBandage_clean_F","H_HeadBandage_bloody_F","H_Beret_EAF_01_F","H_Booniehat_mgrn","H_MilCap_grn","H_HelmetIA"
	],
	[
		// Facewear ONLY
		"G_Combat","G_Lowprofile","G_Shades_Black","G_Shades_Green","G_Shades_Red","G_Squares_Tinted","G_Sport_Red","G_Tactical_Black","G_Aviator","G_Lady_Blue","G_B_Diving","G_I_Diving","G_Balaclava_blk","G_Balaclava_oli","G_Balaclava_combat","G_Balaclava_lowprofile","G_Bandanna_blk","G_Bandanna_oli","G_Bandanna_khk","G_Bandanna_tan","G_Bandanna_beast","G_Bandanna_shades","G_Bandanna_sport","G_Bandanna_aviator","G_Shades_Blue","G_Tactical_Clear","G_Combat_Goggles_tna_F","G_RegulatorMask_F","G_WirelessEarpiece_F"
	]
] call MAZ_RS_fnc_createNewDefaultSideUniform;

comment "CTRG / AAF Rifleman";
[
	independent,
	"Altis",
	"Rifleman",
	[
		[
			["arifle_TRG21_F","arifle_TRG20_F","arifle_SPAR_01_blk_F","arifle_SPAR_01_snd_F","arifle_MSBS65_F","arifle_MSBS65_UBS_F","arifle_MSBS65_black_F","arifle_MSBS65_UBS_black_F","arifle_MSBS65_sand_F","arifle_MSBS65_UBS_sand_F","arifle_Mk20_F","arifle_Mk20_plain_F","arifle_Mk20C_F","arifle_Mk20C_plain_F","arifle_MXC_F","arifle_MX_F","arifle_MXC_Black_F","arifle_MX_Black_F","SMG_03_TR_black","SMG_03_TR_camo","SMG_03C_TR_black","SMG_03C_TR_camo","SMG_03_black","SMG_03_camo","SMG_03C_black","SMG_03C_camo","arifle_AK12_F","arifle_AKM_F","arifle_AKS_F","arifle_AK12_arid_F","arifle_AK12U_F","arifle_AK12U_arid_F","SMG_01_F"],
			["30Rnd_556x45_Stanag","30Rnd_556x45_Stanag_Tracer_Green","30Rnd_556x45_Stanag_Tracer_Yellow","30Rnd_556x45_Stanag_green","30Rnd_556x45_Stanag_Sand","30Rnd_556x45_Stanag_Sand_green","30Rnd_556x45_Stanag_Sand_Tracer_Green","30Rnd_556x45_Stanag_Sand_Tracer_Yellow","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_black_mag","30Rnd_65x39_caseless_mag_Tracer","30Rnd_65x39_caseless_black_mag_Tracer","30Rnd_45ACP_Mag_SMG_01","30Rnd_45ACP_Mag_SMG_01_Tracer_Green","30Rnd_45ACP_Mag_SMG_01_Tracer_Yellow","50Rnd_570x28_SMG_03","30Rnd_762x39_AK12_Mag_F","30Rnd_762x39_Mag_F","30Rnd_762x39_Mag_Green_F","30Rnd_762x39_Mag_Tracer_F","30Rnd_762x39_Mag_Tracer_Green_F","30Rnd_762x39_AK12_Mag_Tracer_F","30rnd_762x39_AK12_Arid_Mag_F","30rnd_762x39_AK12_Arid_Mag_Tracer_F","30Rnd_545x39_Mag_F","30Rnd_545x39_Mag_Green_F","30Rnd_545x39_Mag_Tracer_F","30Rnd_65x39_caseless_msbs_mag","30Rnd_65x39_caseless_msbs_mag_Tracer","6Rnd_12Gauge_Pellets","6Rnd_12Gauge_Slug"]
		],
		[
			[],
			[]
		],
		[
			["hgun_ACPC2_F","hgun_P07_F","hgun_Pistol_heavy_01_F","hgun_Pistol_heavy_02_F","hgun_Rook40_F","hgun_P07_blk_F","hgun_Pistol_heavy_01_green_F"],
			["9Rnd_45ACP_Mag","16Rnd_9x21_Mag","16Rnd_9x21_green_Mag","16Rnd_9x21_yellow_Mag","11Rnd_45ACP_Mag","6Rnd_45ACP_Cylinder"]
		],
		["muzzle_snds_H","muzzle_snds_L","muzzle_snds_M","muzzle_snds_B","optic_Arco","optic_Hamr","optic_Aco","optic_ACO_grn","optic_Aco_smg","optic_ACO_grn_smg","optic_Holosight","optic_Holosight_smg","acc_flashlight","acc_flashlight_smg_01","acc_flashlight_pistol","acc_pointer_IR","optic_MRCO","muzzle_snds_acp","optic_Yorris","optic_MRD","muzzle_snds_570","muzzle_snds_H_snd_F","muzzle_snds_m_snd_F","muzzle_snds_B_snd_F","muzzle_snds_65_TI_blk_F","optic_Arco_blk_F","optic_ERCO_blk_F","optic_ERCO_snd_F","optic_Holosight_blk_F","optic_Holosight_smg_blk_F","optic_ico_01_f","optic_ico_01_black_f","optic_ico_01_sand_f","muzzle_snds_B_arid_F","optic_Holosight_arid_F","optic_Arco_AK_blk_F","optic_Arco_AK_arid_F","optic_MRD_black"]
	],
	[],
	[],
	[],
	[],
	[],
	[],
	true
] call MAZ_RS_fnc_createNewEquipmentForRole;

comment "CTRG / AAF Medic";
[
	independent,
	"Altis",
	"Medic",
	[
		[
			["arifle_TRG21_F","arifle_TRG20_F","arifle_SPAR_01_blk_F","arifle_SPAR_01_snd_F","arifle_MSBS65_F","arifle_MSBS65_Mark_F","arifle_MSBS65_UBS_F","arifle_MSBS65_black_F","arifle_MSBS65_Mark_black_F","arifle_MSBS65_UBS_black_F","arifle_MSBS65_sand_F","arifle_MSBS65_Mark_sand_F","arifle_MSBS65_UBS_sand_F","arifle_Mk20_F","arifle_Mk20_plain_F","arifle_Mk20C_F","arifle_Mk20C_plain_F","arifle_MXC_F","arifle_MX_F","arifle_MXM_F","arifle_MXC_Black_F","arifle_MX_Black_F","arifle_MXM_Black_F","SMG_03_TR_black","SMG_03_TR_camo","SMG_03C_TR_black","SMG_03C_TR_camo","SMG_03_black","SMG_03_camo","SMG_03C_black","SMG_03C_camo","arifle_AK12_F","arifle_AKM_F","arifle_AKS_F","arifle_AK12_arid_F","arifle_AK12U_F","arifle_AK12U_arid_F","SMG_01_F"],
			["1Rnd_HE_Grenade_shell","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag_Tracer_Green","30Rnd_556x45_Stanag_Tracer_Yellow","30Rnd_556x45_Stanag_green","30Rnd_556x45_Stanag_Sand","30Rnd_556x45_Stanag_Sand_green","30Rnd_556x45_Stanag_Sand_Tracer_Green","30Rnd_556x45_Stanag_Sand_Tracer_Yellow","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_black_mag","30Rnd_65x39_caseless_mag_Tracer","30Rnd_65x39_caseless_black_mag_Tracer","30Rnd_45ACP_Mag_SMG_01","30Rnd_45ACP_Mag_SMG_01_Tracer_Green","30Rnd_45ACP_Mag_SMG_01_Tracer_Yellow","50Rnd_570x28_SMG_03","30Rnd_762x39_AK12_Mag_F","30Rnd_762x39_Mag_F","30Rnd_762x39_Mag_Green_F","30Rnd_762x39_Mag_Tracer_F","30Rnd_762x39_Mag_Tracer_Green_F","30Rnd_762x39_AK12_Mag_Tracer_F","30rnd_762x39_AK12_Arid_Mag_F","30rnd_762x39_AK12_Arid_Mag_Tracer_F","30Rnd_545x39_Mag_F","30Rnd_545x39_Mag_Green_F","30Rnd_545x39_Mag_Tracer_F","30Rnd_65x39_caseless_msbs_mag","30Rnd_65x39_caseless_msbs_mag_Tracer","6Rnd_12Gauge_Pellets","6Rnd_12Gauge_Slug"]
		],
		[
			[],
			[]
		],
		[
			["hgun_ACPC2_F","hgun_P07_F","hgun_Pistol_heavy_01_F","hgun_Pistol_heavy_02_F","hgun_Rook40_F","hgun_P07_blk_F","hgun_Pistol_heavy_01_green_F"],
			["9Rnd_45ACP_Mag","16Rnd_9x21_Mag","16Rnd_9x21_green_Mag","16Rnd_9x21_yellow_Mag","11Rnd_45ACP_Mag","6Rnd_45ACP_Cylinder"]
		],
		["muzzle_snds_H","muzzle_snds_L","muzzle_snds_M","muzzle_snds_B","optic_Arco","optic_Hamr","optic_Aco","optic_ACO_grn","optic_Aco_smg","optic_ACO_grn_smg","optic_Holosight","optic_Holosight_smg","acc_flashlight","acc_flashlight_smg_01","acc_flashlight_pistol","acc_pointer_IR","optic_MRCO","muzzle_snds_acp","optic_Yorris","optic_MRD","muzzle_snds_570","muzzle_snds_H_snd_F","muzzle_snds_m_snd_F","muzzle_snds_B_snd_F","muzzle_snds_65_TI_blk_F","optic_Arco_blk_F","optic_ERCO_blk_F","optic_ERCO_snd_F","optic_Holosight_blk_F","optic_Holosight_smg_blk_F","optic_ico_01_f","optic_ico_01_black_f","optic_ico_01_sand_f","muzzle_snds_B_arid_F","optic_Holosight_arid_F","optic_Arco_AK_blk_F","optic_Arco_AK_arid_F","optic_MRD_black"]
	],
	[],
	["V_PlateCarrierSpec_rgr","V_PlateCarrierSpec_blk"],
	["B_Carryall_khk","B_Carryall_cbr","B_Carryall_oli","B_Carryall_green_F"],
	[],
	[],
	["Medikit"],
	true
] call MAZ_RS_fnc_createNewEquipmentForRole;

comment "CTRG / AAF Crewman";
[
	independent,
	"Altis",
	"Crewman",
	[
		[
			["arifle_TRG20_F","arifle_SPAR_01_blk_F","arifle_SPAR_01_snd_F","arifle_Mk20C_F","arifle_Mk20C_plain_F","arifle_MXC_F","arifle_MXC_Black_F","SMG_03C_TR_black","SMG_03C_TR_camo","SMG_03C_black","SMG_03C_camo","arifle_AK12_F","arifle_AKS_F","arifle_AK12_arid_F","arifle_AK12U_F","arifle_AK12U_arid_F","SMG_01_F"],
			["30Rnd_556x45_Stanag","30Rnd_556x45_Stanag_Tracer_Green","30Rnd_556x45_Stanag_Tracer_Yellow","30Rnd_556x45_Stanag_green","30Rnd_556x45_Stanag_Sand","30Rnd_556x45_Stanag_Sand_green","30Rnd_556x45_Stanag_Sand_Tracer_Green","30Rnd_556x45_Stanag_Sand_Tracer_Yellow","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_black_mag","30Rnd_65x39_caseless_mag_Tracer","30Rnd_65x39_caseless_black_mag_Tracer","30Rnd_45ACP_Mag_SMG_01","30Rnd_45ACP_Mag_SMG_01_Tracer_Green","30Rnd_45ACP_Mag_SMG_01_Tracer_Yellow","50Rnd_570x28_SMG_03","30Rnd_762x39_AK12_Mag_F","30Rnd_762x39_Mag_F","30Rnd_762x39_Mag_Green_F","30Rnd_762x39_Mag_Tracer_F","30Rnd_762x39_Mag_Tracer_Green_F","30Rnd_762x39_AK12_Mag_Tracer_F","30rnd_762x39_AK12_Arid_Mag_F","30rnd_762x39_AK12_Arid_Mag_Tracer_F","30Rnd_545x39_Mag_F","30Rnd_545x39_Mag_Green_F","30Rnd_545x39_Mag_Tracer_F","30Rnd_65x39_caseless_msbs_mag","30Rnd_65x39_caseless_msbs_mag_Tracer","6Rnd_12Gauge_Pellets","6Rnd_12Gauge_Slug"]
		],
		[
			[],
			[]
		],
		[
			["hgun_ACPC2_F","hgun_P07_F","hgun_Pistol_heavy_01_F","hgun_Pistol_heavy_02_F","hgun_Rook40_F","hgun_P07_blk_F","hgun_Pistol_heavy_01_green_F"],
			["9Rnd_45ACP_Mag","16Rnd_9x21_Mag","16Rnd_9x21_green_Mag","16Rnd_9x21_yellow_Mag","11Rnd_45ACP_Mag","6Rnd_45ACP_Cylinder"]
		],
		["muzzle_snds_H","muzzle_snds_L","muzzle_snds_M","muzzle_snds_B","optic_Arco","optic_Hamr","optic_Aco","optic_ACO_grn","optic_Aco_smg","optic_ACO_grn_smg","optic_Holosight","optic_Holosight_smg","acc_flashlight","acc_flashlight_smg_01","acc_flashlight_pistol","acc_pointer_IR","optic_MRCO","muzzle_snds_acp","optic_Yorris","optic_MRD","muzzle_snds_570","muzzle_snds_H_snd_F","muzzle_snds_m_snd_F","muzzle_snds_B_snd_F","muzzle_snds_65_TI_blk_F","optic_Arco_blk_F","optic_ERCO_blk_F","optic_ERCO_snd_F","optic_Holosight_blk_F","optic_Holosight_smg_blk_F","optic_ico_01_f","optic_ico_01_black_f","optic_ico_01_sand_f","muzzle_snds_B_arid_F","optic_Holosight_arid_F","optic_Arco_AK_blk_F","optic_Arco_AK_arid_F","optic_MRD_black"]
	],
	[["U_Tank_green_F"]],
	[],
	["B_RadioBag_01_mtp_F","B_RadioBag_01_black_F","B_RadioBag_01_digi_F"],
	["H_HelmetCrew_I","H_Tank_eaf_F","H_Tank_black_F"],
	[],
	["ToolKit"],
	true
] call MAZ_RS_fnc_createNewEquipmentForRole;

comment "CTRG / AAF Heli Pilot";
[
	independent,
	"Altis",
	"Heli Pilot",
	[
		[
			["arifle_TRG20_F","arifle_SPAR_01_blk_F","arifle_SPAR_01_snd_F","arifle_Mk20C_F","arifle_Mk20C_plain_F","arifle_MXC_F","arifle_MXC_Black_F","SMG_03C_TR_black","SMG_03C_TR_camo","SMG_03C_black","SMG_03C_camo","arifle_AKS_F","arifle_AK12U_F","arifle_AK12U_arid_F","SMG_01_F"],
			["30Rnd_556x45_Stanag","30Rnd_556x45_Stanag_Tracer_Green","30Rnd_556x45_Stanag_Tracer_Yellow","30Rnd_556x45_Stanag_green","30Rnd_556x45_Stanag_Sand","30Rnd_556x45_Stanag_Sand_green","30Rnd_556x45_Stanag_Sand_Tracer_Green","30Rnd_556x45_Stanag_Sand_Tracer_Yellow","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_black_mag","30Rnd_65x39_caseless_mag_Tracer","30Rnd_65x39_caseless_black_mag_Tracer","30Rnd_45ACP_Mag_SMG_01","30Rnd_45ACP_Mag_SMG_01_Tracer_Green","30Rnd_45ACP_Mag_SMG_01_Tracer_Yellow","50Rnd_570x28_SMG_03","30Rnd_762x39_AK12_Mag_F","30Rnd_762x39_Mag_F","30Rnd_762x39_Mag_Green_F","30Rnd_762x39_Mag_Tracer_F","30Rnd_762x39_Mag_Tracer_Green_F","30Rnd_762x39_AK12_Mag_Tracer_F","30rnd_762x39_AK12_Arid_Mag_F","30rnd_762x39_AK12_Arid_Mag_Tracer_F","30Rnd_545x39_Mag_F","30Rnd_545x39_Mag_Green_F","30Rnd_545x39_Mag_Tracer_F","30Rnd_65x39_caseless_msbs_mag","30Rnd_65x39_caseless_msbs_mag_Tracer","6Rnd_12Gauge_Pellets","6Rnd_12Gauge_Slug"]
		],
		[
			[],
			[]
		],
		[
			["hgun_ACPC2_F","hgun_P07_F","hgun_Pistol_heavy_01_F","hgun_Pistol_heavy_02_F","hgun_Rook40_F","hgun_P07_blk_F","hgun_Pistol_heavy_01_green_F","hgun_Pistol_Signal_F"],
			["9Rnd_45ACP_Mag","16Rnd_9x21_Mag","16Rnd_9x21_green_Mag","16Rnd_9x21_yellow_Mag","11Rnd_45ACP_Mag","6Rnd_45ACP_Cylinder","6Rnd_GreenSignal_F","6Rnd_RedSignal_F"]
		],
		["muzzle_snds_H","muzzle_snds_L","muzzle_snds_M","muzzle_snds_B","optic_Aco","optic_ACO_grn","optic_Aco_smg","optic_ACO_grn_smg","optic_Holosight","optic_Holosight_smg","acc_flashlight","acc_flashlight_smg_01","acc_flashlight_pistol","acc_pointer_IR","muzzle_snds_acp","optic_Yorris","optic_MRD","muzzle_snds_570","muzzle_snds_H_snd_F","muzzle_snds_m_snd_F","muzzle_snds_B_snd_F","muzzle_snds_65_TI_blk_F","optic_Holosight_blk_F","optic_Holosight_smg_blk_F","muzzle_snds_B_arid_F","optic_Holosight_arid_F","optic_MRD_black"]
	],
	["U_B_HeliPilotCoveralls","U_B_PilotCoveralls","U_I_pilotCoveralls","U_I_HeliPilotCoveralls","U_I_CBRN_Suit_01_AAF_F"],
	["V_Rangemaster_belt","V_BandollierB_khk","V_BandollierB_cbr","V_BandollierB_rgr","V_BandollierB_blk","V_BandollierB_oli","V_TacVest_khk","V_TacVest_brn","V_TacVest_oli","V_TacVest_blk","V_TacVest_camo","V_TacVestIR_blk","V_I_G_resistanceLeader_F","V_DeckCrew_yellow_F","V_DeckCrew_blue_F","V_DeckCrew_green_F","V_DeckCrew_red_F","V_DeckCrew_white_F","V_DeckCrew_brown_F","V_DeckCrew_violet_F","V_Pocketed_olive_F","V_Pocketed_coyote_F","V_Pocketed_black_F","V_Safety_yellow_F","V_Safety_orange_F","V_Safety_blue_F","V_LegStrapBag_black_F","V_LegStrapBag_coyote_F","V_LegStrapBag_olive_F","V_CarrierRigKBT_01_Olive_F"],
	["B_TacticalPack_rgr","B_TacticalPack_blk","B_TacticalPack_oli","B_Parachute","B_LegStrapBag_black_F","B_LegStrapBag_coyote_F","B_LegStrapBag_olive_F"],
	["H_PilotHelmetHeli_B","H_PilotHelmetHeli_I","H_CrewHelmetHeli_B","H_CrewHelmetHeli_I","H_EarProtectors_black_F","H_HeadSet_black_F","H_PilotHelmetHeli_I_E","H_CrewHelmetHeli_I_E"],
	["G_Combat","G_Lowprofile","G_Shades_Black","G_Shades_Green","G_Shades_Red","G_Squares_Tinted","G_Sport_Red","G_Tactical_Black","G_Aviator","G_Lady_Blue","G_B_Diving","G_I_Diving","G_Balaclava_blk","G_Balaclava_oli","G_Balaclava_combat","G_Balaclava_lowprofile","G_Bandanna_blk","G_Bandanna_oli","G_Bandanna_khk","G_Bandanna_tan","G_Bandanna_beast","G_Bandanna_shades","G_Bandanna_sport","G_Bandanna_aviator","G_Shades_Blue","G_Tactical_Clear","G_Combat_Goggles_tna_F","G_RegulatorMask_F","G_WirelessEarpiece_F"],
	["ToolKit"],
	false
] call MAZ_RS_fnc_createNewEquipmentForRole;

comment "CTRG / AAF Pilot";
[
	independent,
	"Altis",
	"Pilot",
	[
		[
			["arifle_TRG20_F","arifle_SPAR_01_blk_F","arifle_SPAR_01_snd_F","arifle_Mk20C_F","arifle_Mk20C_plain_F","arifle_MXC_F","arifle_MXC_Black_F","SMG_03C_TR_black","SMG_03C_TR_camo","SMG_03C_black","SMG_03C_camo","arifle_AKS_F","arifle_AK12U_F","arifle_AK12U_arid_F","SMG_01_F"],
			["30Rnd_556x45_Stanag","30Rnd_556x45_Stanag_Tracer_Green","30Rnd_556x45_Stanag_Tracer_Yellow","30Rnd_556x45_Stanag_green","30Rnd_556x45_Stanag_Sand","30Rnd_556x45_Stanag_Sand_green","30Rnd_556x45_Stanag_Sand_Tracer_Green","30Rnd_556x45_Stanag_Sand_Tracer_Yellow","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_black_mag","30Rnd_65x39_caseless_mag_Tracer","30Rnd_65x39_caseless_black_mag_Tracer","30Rnd_45ACP_Mag_SMG_01","30Rnd_45ACP_Mag_SMG_01_Tracer_Green","30Rnd_45ACP_Mag_SMG_01_Tracer_Yellow","50Rnd_570x28_SMG_03","30Rnd_762x39_AK12_Mag_F","30Rnd_762x39_Mag_F","30Rnd_762x39_Mag_Green_F","30Rnd_762x39_Mag_Tracer_F","30Rnd_762x39_Mag_Tracer_Green_F","30Rnd_762x39_AK12_Mag_Tracer_F","30rnd_762x39_AK12_Arid_Mag_F","30rnd_762x39_AK12_Arid_Mag_Tracer_F","30Rnd_545x39_Mag_F","30Rnd_545x39_Mag_Green_F","30Rnd_545x39_Mag_Tracer_F","30Rnd_65x39_caseless_msbs_mag","30Rnd_65x39_caseless_msbs_mag_Tracer","6Rnd_12Gauge_Pellets","6Rnd_12Gauge_Slug"]
		],
		[
			[],
			[]
		],
		[
			["hgun_ACPC2_F","hgun_P07_F","hgun_Pistol_heavy_01_F","hgun_Pistol_heavy_02_F","hgun_Rook40_F","hgun_P07_blk_F","hgun_Pistol_heavy_01_green_F","hgun_Pistol_Signal_F"],
			["9Rnd_45ACP_Mag","16Rnd_9x21_Mag","16Rnd_9x21_green_Mag","16Rnd_9x21_yellow_Mag","11Rnd_45ACP_Mag","6Rnd_45ACP_Cylinder","6Rnd_GreenSignal_F","6Rnd_RedSignal_F"]
		],
		["muzzle_snds_H","muzzle_snds_L","muzzle_snds_M","muzzle_snds_B","optic_Aco","optic_ACO_grn","optic_Aco_smg","optic_ACO_grn_smg","optic_Holosight","optic_Holosight_smg","acc_flashlight","acc_flashlight_smg_01","acc_flashlight_pistol","acc_pointer_IR","muzzle_snds_acp","optic_Yorris","optic_MRD","muzzle_snds_570","muzzle_snds_H_snd_F","muzzle_snds_m_snd_F","muzzle_snds_B_snd_F","muzzle_snds_65_TI_blk_F","optic_Holosight_blk_F","optic_Holosight_smg_blk_F","muzzle_snds_B_arid_F","optic_Holosight_arid_F","optic_MRD_black"]
	],
	["U_B_PilotCoveralls","U_I_pilotCoveralls"],
	["V_Rangemaster_belt","V_BandollierB_khk","V_BandollierB_cbr","V_BandollierB_rgr","V_BandollierB_blk","V_BandollierB_oli","V_TacVest_khk","V_TacVest_brn","V_TacVest_oli","V_TacVest_blk","V_TacVest_camo","V_TacVestIR_blk","V_I_G_resistanceLeader_F","V_DeckCrew_yellow_F","V_DeckCrew_blue_F","V_DeckCrew_green_F","V_DeckCrew_red_F","V_DeckCrew_white_F","V_DeckCrew_brown_F","V_DeckCrew_violet_F","V_Pocketed_olive_F","V_Pocketed_coyote_F","V_Pocketed_black_F","V_Safety_yellow_F","V_Safety_orange_F","V_Safety_blue_F","V_LegStrapBag_black_F","V_LegStrapBag_coyote_F","V_LegStrapBag_olive_F","V_CarrierRigKBT_01_Olive_F"],
	["B_TacticalPack_rgr","B_TacticalPack_blk","B_TacticalPack_oli","B_Parachute","B_LegStrapBag_black_F","B_LegStrapBag_coyote_F","B_LegStrapBag_olive_F"],
	["H_PilotHelmetFighter_B","H_PilotHelmetFighter_I","H_PilotHelmetFighter_I_E"],
	["G_Combat","G_Lowprofile","G_Shades_Black","G_Shades_Green","G_Shades_Red","G_Squares_Tinted","G_Sport_Red","G_Tactical_Black","G_Aviator","G_Lady_Blue","G_B_Diving","G_I_Diving","G_Balaclava_blk","G_Balaclava_oli","G_Balaclava_combat","G_Balaclava_lowprofile","G_Bandanna_blk","G_Bandanna_oli","G_Bandanna_khk","G_Bandanna_tan","G_Bandanna_beast","G_Bandanna_shades","G_Bandanna_sport","G_Bandanna_aviator","G_Shades_Blue","G_Tactical_Clear","G_Combat_Goggles_tna_F","G_RegulatorMask_F","G_WirelessEarpiece_F"],
	[],
	false
] call MAZ_RS_fnc_createNewEquipmentForRole;

comment "CTRG / AAF Squad leader";
[
	independent,
	"Altis",
	"Squad Leader",
	[
		[
			["arifle_TRG21_F","arifle_TRG20_F","arifle_SPAR_01_blk_F","arifle_SPAR_01_snd_F","arifle_MSBS65_F","arifle_MSBS65_Mark_F","arifle_MSBS65_UBS_F","arifle_MSBS65_black_F","arifle_MSBS65_Mark_black_F","arifle_MSBS65_UBS_black_F","arifle_MSBS65_sand_F","arifle_MSBS65_Mark_sand_F","arifle_MSBS65_UBS_sand_F","arifle_Mk20_F","arifle_Mk20_plain_F","arifle_Mk20C_F","arifle_Mk20C_plain_F","arifle_MXC_F","arifle_MX_F","arifle_MXM_F","arifle_MXC_Black_F","arifle_MX_Black_F","arifle_MXM_Black_F","SMG_03_TR_black","SMG_03_TR_camo","SMG_03C_TR_black","SMG_03C_TR_camo","SMG_03_black","SMG_03_camo","SMG_03C_black","SMG_03C_camo","arifle_AK12_F","arifle_AKM_F","arifle_AKS_F","arifle_AK12_arid_F","arifle_AK12U_F","arifle_AK12U_arid_F","SMG_01_F","arifle_Mk20_GL_F","arifle_Mk20_GL_plain_F","arifle_MX_GL_F","arifle_MX_GL_Black_F","arifle_TRG21_GL_F","arifle_AK12_GL_F","arifle_SPAR_01_GL_blk_F","arifle_SPAR_01_GL_snd_F","arifle_AK12_GL_arid_F","arifle_MSBS65_GL_F","arifle_MSBS65_GL_black_F","arifle_MSBS65_GL_sand_F"],
			["1Rnd_HE_Grenade_shell","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag_Tracer_Green","30Rnd_556x45_Stanag_Tracer_Yellow","30Rnd_556x45_Stanag_green","30Rnd_556x45_Stanag_Sand","30Rnd_556x45_Stanag_Sand_green","30Rnd_556x45_Stanag_Sand_Tracer_Green","30Rnd_556x45_Stanag_Sand_Tracer_Yellow","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_black_mag","30Rnd_65x39_caseless_mag_Tracer","30Rnd_65x39_caseless_black_mag_Tracer","30Rnd_45ACP_Mag_SMG_01","30Rnd_45ACP_Mag_SMG_01_Tracer_Green","30Rnd_45ACP_Mag_SMG_01_Tracer_Yellow","50Rnd_570x28_SMG_03","30Rnd_762x39_AK12_Mag_F","30Rnd_762x39_Mag_F","30Rnd_762x39_Mag_Green_F","30Rnd_762x39_Mag_Tracer_F","30Rnd_762x39_Mag_Tracer_Green_F","30Rnd_762x39_AK12_Mag_Tracer_F","30rnd_762x39_AK12_Arid_Mag_F","30rnd_762x39_AK12_Arid_Mag_Tracer_F","30Rnd_545x39_Mag_F","30Rnd_545x39_Mag_Green_F","30Rnd_545x39_Mag_Tracer_F","30Rnd_65x39_caseless_msbs_mag","30Rnd_65x39_caseless_msbs_mag_Tracer","6Rnd_12Gauge_Pellets","6Rnd_12Gauge_Slug","UGL_FlareWhite_F","UGL_FlareGreen_F","UGL_FlareRed_F","UGL_FlareYellow_F","UGL_FlareCIR_F","1Rnd_Smoke_Grenade_shell","1Rnd_SmokeRed_Grenade_shell","1Rnd_SmokeGreen_Grenade_shell","1Rnd_SmokeYellow_Grenade_shell","1Rnd_SmokePurple_Grenade_shell","1Rnd_SmokeBlue_Grenade_shell","1Rnd_SmokeOrange_Grenade_shell"]
		],
		[
			[],
			[]
		],
		[
			["hgun_ACPC2_F","hgun_P07_F","hgun_Pistol_heavy_01_F","hgun_Pistol_heavy_02_F","hgun_Rook40_F","hgun_P07_blk_F","hgun_Pistol_heavy_01_green_F"],
			["9Rnd_45ACP_Mag","16Rnd_9x21_Mag","16Rnd_9x21_green_Mag","16Rnd_9x21_yellow_Mag","11Rnd_45ACP_Mag","6Rnd_45ACP_Cylinder"]
		],
		["muzzle_snds_H","muzzle_snds_L","muzzle_snds_M","muzzle_snds_B","optic_Arco","optic_Hamr","optic_Aco","optic_ACO_grn","optic_Aco_smg","optic_ACO_grn_smg","optic_Holosight","optic_Holosight_smg","acc_flashlight","acc_flashlight_smg_01","acc_flashlight_pistol","acc_pointer_IR","optic_MRCO","muzzle_snds_acp","optic_Yorris","optic_MRD","muzzle_snds_570","muzzle_snds_H_snd_F","muzzle_snds_m_snd_F","muzzle_snds_B_snd_F","muzzle_snds_65_TI_blk_F","optic_Arco_blk_F","optic_ERCO_blk_F","optic_ERCO_snd_F","optic_Holosight_blk_F","optic_Holosight_smg_blk_F","optic_ico_01_f","optic_ico_01_black_f","optic_ico_01_sand_f","muzzle_snds_B_arid_F","optic_Holosight_arid_F","optic_Arco_AK_blk_F","optic_Arco_AK_arid_F","optic_MRD_black"]
	],
	[],
	["V_PlateCarrierGL_rgr","V_PlateCarrierGL_blk","V_PlateCarrierIAGL_dgtl","V_PlateCarrierIAGL_oli","V_CarrierRigKBT_01_heavy_Olive_F"],
	["B_RadioBag_01_mtp_F","B_RadioBag_01_black_F","B_RadioBag_01_digi_F"],
	[],
	[],
	["Laserdesignator"],
	true
] call MAZ_RS_fnc_createNewEquipmentForRole;

comment "CTRG / AAF Autorifleman";    
[
	independent,
	"Altis",
	"Autorifleman",
	[
		[
			["arifle_AKM_F","arifle_RPK12_F","arifle_RPK12_arid_F","LMG_Mk200_F","arifle_MX_SW_F","arifle_MX_SW_Black_F","LMG_03_Vehicle_F","arifle_SPAR_02_blk_F","LMG_Mk200_black_F"],
			["100Rnd_65x39_caseless_mag","100Rnd_65x39_caseless_black_mag","100Rnd_65x39_caseless_mag_Tracer","100Rnd_65x39_caseless_black_mag_tracer","75Rnd_762x39_Mag_F","75Rnd_762x39_Mag_Tracer_F","75rnd_762x39_AK12_Mag_F","75rnd_762x39_AK12_Mag_Tracer_F","75rnd_762x39_AK12_Lush_Mag_Tracer_F","75rnd_762x39_AK12_Arid_Mag_F","150Rnd_556x45_Drum_Mag_F","150Rnd_556x45_Drum_Mag_Tracer_F","150Rnd_556x45_Drum_Sand_Mag_F","150Rnd_556x45_Drum_Sand_Mag_Tracer_F","200Rnd_65x39_cased_Box","200Rnd_65x39_cased_Box_Tracer","200Rnd_556x45_Box_F","200Rnd_556x45_Box_Tracer_F"]
		],
		[
			[],
			[]
		],
		[
			["hgun_ACPC2_F","hgun_P07_F","hgun_Pistol_heavy_01_F","hgun_Pistol_heavy_02_F","hgun_Rook40_F","hgun_P07_blk_F","hgun_Pistol_heavy_01_green_F"],
			["9Rnd_45ACP_Mag","16Rnd_9x21_Mag","16Rnd_9x21_green_Mag","16Rnd_9x21_yellow_Mag","11Rnd_45ACP_Mag","6Rnd_45ACP_Cylinder"]
		],
		["muzzle_snds_H","muzzle_snds_L","muzzle_snds_M","muzzle_snds_B","optic_Aco","optic_ACO_grn","optic_Aco_smg","optic_ACO_grn_smg","optic_Holosight","optic_Holosight_smg","acc_flashlight","acc_flashlight_smg_01","acc_flashlight_pistol","acc_pointer_IR","optic_MRCO","muzzle_snds_acp","optic_Yorris","optic_MRD","muzzle_snds_570","muzzle_snds_H_snd_F","muzzle_snds_m_snd_F","muzzle_snds_B_snd_F","muzzle_snds_65_TI_blk_F","optic_Holosight_blk_F","optic_Holosight_smg_blk_F","muzzle_snds_B_arid_F","optic_Holosight_arid_F","optic_MRD_black","bipod_01_F_snd","bipod_01_F_blk","bipod_03_F_blk","bipod_03_F_oli"]
	],
	[],
	[],
	[],
	[],
	[],
	[],
	true
] call MAZ_RS_fnc_createNewEquipmentForRole;

comment "CTRG / AAF Light Anti-Tank";
[
	independent,
	"Altis",
	"Light Anti-Tank",
	[
		[
			["arifle_TRG21_F","arifle_TRG20_F","arifle_SPAR_01_blk_F","arifle_SPAR_01_snd_F","arifle_MSBS65_F","arifle_MSBS65_UBS_F","arifle_MSBS65_black_F","arifle_MSBS65_UBS_black_F","arifle_MSBS65_sand_F","arifle_MSBS65_UBS_sand_F","arifle_Mk20_F","arifle_Mk20_plain_F","arifle_Mk20C_F","arifle_Mk20C_plain_F","arifle_MXC_F","arifle_MX_F","arifle_MXC_Black_F","arifle_MX_Black_F","SMG_03_TR_black","SMG_03_TR_camo","SMG_03C_TR_black","SMG_03C_TR_camo","SMG_03_black","SMG_03_camo","SMG_03C_black","SMG_03C_camo","arifle_AK12_F","arifle_AKM_F","arifle_AKS_F","arifle_AK12_arid_F","arifle_AK12U_F","arifle_AK12U_arid_F","SMG_01_F"],
			["30Rnd_556x45_Stanag","30Rnd_556x45_Stanag_Tracer_Green","30Rnd_556x45_Stanag_Tracer_Yellow","30Rnd_556x45_Stanag_green","30Rnd_556x45_Stanag_Sand","30Rnd_556x45_Stanag_Sand_green","30Rnd_556x45_Stanag_Sand_Tracer_Green","30Rnd_556x45_Stanag_Sand_Tracer_Yellow","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_black_mag","30Rnd_65x39_caseless_mag_Tracer","30Rnd_65x39_caseless_black_mag_Tracer","30Rnd_45ACP_Mag_SMG_01","30Rnd_45ACP_Mag_SMG_01_Tracer_Green","30Rnd_45ACP_Mag_SMG_01_Tracer_Yellow","50Rnd_570x28_SMG_03","30Rnd_762x39_AK12_Mag_F","30Rnd_762x39_Mag_F","30Rnd_762x39_Mag_Green_F","30Rnd_762x39_Mag_Tracer_F","30Rnd_762x39_Mag_Tracer_Green_F","30Rnd_762x39_AK12_Mag_Tracer_F","30rnd_762x39_AK12_Arid_Mag_F","30rnd_762x39_AK12_Arid_Mag_Tracer_F","30Rnd_545x39_Mag_F","30Rnd_545x39_Mag_Green_F","30Rnd_545x39_Mag_Tracer_F","30Rnd_65x39_caseless_msbs_mag","30Rnd_65x39_caseless_msbs_mag_Tracer","6Rnd_12Gauge_Pellets","6Rnd_12Gauge_Slug"]
		],
		[
			["launch_RPG7_F","launch_MRAWS_olive_F","launch_MRAWS_olive_rail_F","launch_MRAWS_green_F","launch_MRAWS_green_rail_F","launch_MRAWS_sand_F","launch_MRAWS_sand_rail_F"],
			["RPG7_F","MRAWS_HE_F","MRAWS_HEAT55_F"]
		],
		[
			["hgun_ACPC2_F","hgun_P07_F","hgun_Pistol_heavy_01_F","hgun_Pistol_heavy_02_F","hgun_Rook40_F","hgun_P07_blk_F","hgun_Pistol_heavy_01_green_F"],
			["9Rnd_45ACP_Mag","16Rnd_9x21_Mag","16Rnd_9x21_green_Mag","16Rnd_9x21_yellow_Mag","11Rnd_45ACP_Mag","6Rnd_45ACP_Cylinder"]
		],
		["muzzle_snds_H","muzzle_snds_L","muzzle_snds_M","muzzle_snds_B","optic_Arco","optic_Hamr","optic_Aco","optic_ACO_grn","optic_Aco_smg","optic_ACO_grn_smg","optic_Holosight","optic_Holosight_smg","acc_flashlight","acc_flashlight_smg_01","acc_flashlight_pistol","acc_pointer_IR","optic_MRCO","muzzle_snds_acp","optic_Yorris","optic_MRD","muzzle_snds_570","muzzle_snds_H_snd_F","muzzle_snds_m_snd_F","muzzle_snds_B_snd_F","muzzle_snds_65_TI_blk_F","optic_Arco_blk_F","optic_ERCO_blk_F","optic_ERCO_snd_F","optic_Holosight_blk_F","optic_Holosight_smg_blk_F","optic_ico_01_f","optic_ico_01_black_f","optic_ico_01_sand_f","muzzle_snds_B_arid_F","optic_Holosight_arid_F","optic_Arco_AK_blk_F","optic_Arco_AK_arid_F","optic_MRD_black"]
	],
	[],
	[],
	["B_Carryall_khk","B_Carryall_cbr","B_Carryall_oli","B_Carryall_green_F"],
	[],
	[],
	[],
	true
] call MAZ_RS_fnc_createNewEquipmentForRole;

comment "CTRG / AAF Marksman";
[
	independent,
	"Altis",
	"Marksman",
	[
		[
			["srifle_EBR_F","srifle_DMR_03_F","srifle_DMR_03_khaki_F","srifle_DMR_03_tan_F","srifle_DMR_03_multicam_F","srifle_DMR_03_woodland_F","srifle_DMR_06_camo_F","srifle_DMR_06_olive_F","srifle_DMR_07_blk_F","arifle_SPAR_03_blk_F","arifle_SPAR_03_snd_F"],
			["20Rnd_762x51_Mag","20Rnd_650x39_Cased_Mag_F"]
		],
		[
			[],
			[]
		],
		[
			["hgun_ACPC2_F","hgun_P07_F","hgun_Pistol_heavy_01_F","hgun_Pistol_heavy_02_F","hgun_Rook40_F","hgun_P07_blk_F","hgun_Pistol_heavy_01_green_F"],
			["9Rnd_45ACP_Mag","16Rnd_9x21_Mag","16Rnd_9x21_green_Mag","16Rnd_9x21_yellow_Mag","11Rnd_45ACP_Mag","6Rnd_45ACP_Cylinder"]
		],
		["muzzle_snds_H","muzzle_snds_L","muzzle_snds_M","muzzle_snds_B","optic_Arco","optic_Hamr","acc_flashlight","acc_flashlight_smg_01","acc_flashlight_pistol","acc_pointer_IR","optic_MRCO","muzzle_snds_acp","optic_Yorris","optic_MRD","muzzle_snds_570","muzzle_snds_H_snd_F","muzzle_snds_m_snd_F","muzzle_snds_B_snd_F","muzzle_snds_65_TI_blk_F","optic_Arco_blk_F","optic_ERCO_blk_F","optic_ERCO_snd_F","muzzle_snds_B_arid_F","optic_Arco_AK_blk_F","optic_Arco_AK_arid_F","optic_MRD_black","optic_KHS_blk"]
	],
	[],
	[],
	[],
	[],
	[],
	["Rangefinder"],
	true
] call MAZ_RS_fnc_createNewEquipmentForRole;

comment "CTRG / AAF Grenadier";
[
	independent,
	"Altis",
	"Grenadier",
	[
		[
			["arifle_Mk20_GL_F","arifle_Mk20_GL_plain_F","arifle_MX_GL_F","arifle_MX_GL_Black_F","arifle_AK12_GL_F","arifle_SPAR_01_GL_blk_F","arifle_SPAR_01_GL_snd_F","arifle_AK12_GL_arid_F","arifle_MSBS65_GL_F","arifle_MSBS65_GL_black_F","arifle_MSBS65_GL_sand_F"],
			["30Rnd_556x45_Stanag","30Rnd_556x45_Stanag_Tracer_Green","30Rnd_556x45_Stanag_Tracer_Yellow","30Rnd_556x45_Stanag_green","30Rnd_556x45_Stanag_Sand","30Rnd_556x45_Stanag_Sand_green","30Rnd_556x45_Stanag_Sand_Tracer_Green","30Rnd_556x45_Stanag_Sand_Tracer_Yellow","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_black_mag","30Rnd_65x39_caseless_mag_Tracer","30Rnd_65x39_caseless_black_mag_Tracer","30Rnd_45ACP_Mag_SMG_01","30Rnd_45ACP_Mag_SMG_01_Tracer_Green","30Rnd_45ACP_Mag_SMG_01_Tracer_Yellow","50Rnd_570x28_SMG_03","30Rnd_762x39_AK12_Mag_F","30Rnd_762x39_Mag_F","30Rnd_762x39_Mag_Green_F","30Rnd_762x39_Mag_Tracer_F","30Rnd_762x39_Mag_Tracer_Green_F","30Rnd_762x39_AK12_Mag_Tracer_F","30rnd_762x39_AK12_Arid_Mag_F","30rnd_762x39_AK12_Arid_Mag_Tracer_F","30Rnd_545x39_Mag_F","30Rnd_545x39_Mag_Green_F","30Rnd_545x39_Mag_Tracer_F","30Rnd_65x39_caseless_msbs_mag","30Rnd_65x39_caseless_msbs_mag_Tracer","6Rnd_12Gauge_Pellets","6Rnd_12Gauge_Slug","1Rnd_HE_Grenade_shell","UGL_FlareWhite_F","UGL_FlareGreen_F","UGL_FlareRed_F","UGL_FlareYellow_F","UGL_FlareCIR_F","1Rnd_Smoke_Grenade_shell","1Rnd_SmokeRed_Grenade_shell","1Rnd_SmokeGreen_Grenade_shell","1Rnd_SmokeYellow_Grenade_shell","1Rnd_SmokePurple_Grenade_shell","1Rnd_SmokeBlue_Grenade_shell","1Rnd_SmokeOrange_Grenade_shell"]
		],
		[
			[],
			[]
		],
		[
			["hgun_ACPC2_F","hgun_P07_F","hgun_Pistol_heavy_01_F","hgun_Pistol_heavy_02_F","hgun_Rook40_F","hgun_P07_blk_F","hgun_Pistol_heavy_01_green_F"],
			["9Rnd_45ACP_Mag","16Rnd_9x21_Mag","16Rnd_9x21_green_Mag","16Rnd_9x21_yellow_Mag","11Rnd_45ACP_Mag","6Rnd_45ACP_Cylinder"]
		],
		["muzzle_snds_H","muzzle_snds_L","muzzle_snds_M","muzzle_snds_B","optic_Arco","optic_Hamr","optic_Aco","optic_ACO_grn","optic_Aco_smg","optic_ACO_grn_smg","optic_Holosight","optic_Holosight_smg","acc_flashlight","acc_flashlight_smg_01","acc_flashlight_pistol","acc_pointer_IR","optic_MRCO","muzzle_snds_acp","optic_Yorris","optic_MRD","muzzle_snds_570","muzzle_snds_H_snd_F","muzzle_snds_m_snd_F","muzzle_snds_B_snd_F","muzzle_snds_65_TI_blk_F","optic_Arco_blk_F","optic_ERCO_blk_F","optic_ERCO_snd_F","optic_Holosight_blk_F","optic_Holosight_smg_blk_F","optic_ico_01_f","optic_ico_01_black_f","optic_ico_01_sand_f","muzzle_snds_B_arid_F","optic_Holosight_arid_F","optic_Arco_AK_blk_F","optic_Arco_AK_arid_F","optic_MRD_black"]
	],
	[],
	["V_PlateCarrierGL_rgr","V_PlateCarrierGL_blk","V_PlateCarrierIAGL_dgtl","V_PlateCarrierIAGL_oli","V_CarrierRigKBT_01_heavy_Olive_F"],
	[],
	[],
	[],
	[],
	true
] call MAZ_RS_fnc_createNewEquipmentForRole;

comment "CTRG / AAF Heavy Gunner";
[
	independent,
	"Altis",
	"Heavy Gunner",
	[
		[
			["MMG_02_black_F","MMG_02_sand_F"],
			["130Rnd_338_Mag"]
		],
		[
			[],
			[]
		],
		[
			["hgun_ACPC2_F","hgun_P07_F","hgun_Pistol_heavy_01_F","hgun_Pistol_heavy_02_F","hgun_Rook40_F","hgun_P07_blk_F","hgun_Pistol_heavy_01_green_F"],
			["9Rnd_45ACP_Mag","16Rnd_9x21_Mag","16Rnd_9x21_green_Mag","16Rnd_9x21_yellow_Mag","11Rnd_45ACP_Mag","6Rnd_45ACP_Cylinder"]
		],
		["muzzle_snds_H","muzzle_snds_L","muzzle_snds_M","muzzle_snds_B","optic_Aco","optic_ACO_grn","optic_Holosight","acc_flashlight","acc_flashlight_smg_01","acc_flashlight_pistol","acc_pointer_IR","optic_MRCO","muzzle_snds_acp","optic_Yorris","optic_MRD","muzzle_snds_570","muzzle_snds_H_snd_F","muzzle_snds_m_snd_F","muzzle_snds_B_snd_F","muzzle_snds_65_TI_blk_F","optic_Holosight_blk_F","muzzle_snds_B_arid_F","optic_Holosight_arid_F","optic_MRD_black","bipod_01_F_snd","bipod_01_F_blk","bipod_03_F_blk","bipod_03_F_oli"]
	],
	[],
	[],
	[],
	[],
	[],
	[],
	true
] call MAZ_RS_fnc_createNewEquipmentForRole;

comment "CTRG / AAF Heavy Anti-Tank";
[
	independent,
	"Altis",
	"Heavy Anti-Tank",
	[
		[
			["arifle_TRG21_F","arifle_TRG20_F","arifle_SPAR_01_blk_F","arifle_SPAR_01_snd_F","arifle_MSBS65_F","arifle_MSBS65_UBS_F","arifle_MSBS65_black_F","arifle_MSBS65_UBS_black_F","arifle_MSBS65_sand_F","arifle_MSBS65_UBS_sand_F","arifle_Mk20_F","arifle_Mk20_plain_F","arifle_Mk20C_F","arifle_Mk20C_plain_F","arifle_MXC_F","arifle_MX_F","arifle_MXC_Black_F","arifle_MX_Black_F","SMG_03_TR_black","SMG_03_TR_camo","SMG_03C_TR_black","SMG_03C_TR_camo","SMG_03_black","SMG_03_camo","SMG_03C_black","SMG_03C_camo","arifle_AK12_F","arifle_AKM_F","arifle_AKS_F","arifle_AK12_arid_F","arifle_AK12U_F","arifle_AK12U_arid_F","SMG_01_F"],
			["30Rnd_556x45_Stanag","30Rnd_556x45_Stanag_Tracer_Green","30Rnd_556x45_Stanag_Tracer_Yellow","30Rnd_556x45_Stanag_green","30Rnd_556x45_Stanag_Sand","30Rnd_556x45_Stanag_Sand_green","30Rnd_556x45_Stanag_Sand_Tracer_Green","30Rnd_556x45_Stanag_Sand_Tracer_Yellow","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_black_mag","30Rnd_65x39_caseless_mag_Tracer","30Rnd_65x39_caseless_black_mag_Tracer","30Rnd_45ACP_Mag_SMG_01","30Rnd_45ACP_Mag_SMG_01_Tracer_Green","30Rnd_45ACP_Mag_SMG_01_Tracer_Yellow","50Rnd_570x28_SMG_03","30Rnd_762x39_AK12_Mag_F","30Rnd_762x39_Mag_F","30Rnd_762x39_Mag_Green_F","30Rnd_762x39_Mag_Tracer_F","30Rnd_762x39_Mag_Tracer_Green_F","30Rnd_762x39_AK12_Mag_Tracer_F","30rnd_762x39_AK12_Arid_Mag_F","30rnd_762x39_AK12_Arid_Mag_Tracer_F","30Rnd_545x39_Mag_F","30Rnd_545x39_Mag_Green_F","30Rnd_545x39_Mag_Tracer_F","30Rnd_65x39_caseless_msbs_mag","30Rnd_65x39_caseless_msbs_mag_Tracer","6Rnd_12Gauge_Pellets","6Rnd_12Gauge_Slug"]
		],
		[
			["launch_NLAW_F","launch_B_Titan_short_F","launch_I_Titan_short_F","launch_O_Titan_short_F","launch_MRAWS_olive_F","launch_MRAWS_green_F","launch_MRAWS_sand_F","launch_O_Vorona_brown_F","launch_O_Vorona_green_F"],
			["NLAW_F","Titan_AT","Titan_AP","MRAWS_HEAT_F","Vorona_HEAT","Vorona_HE"]
		],
		[
			["hgun_ACPC2_F","hgun_P07_F","hgun_Pistol_heavy_01_F","hgun_Pistol_heavy_02_F","hgun_Rook40_F","hgun_P07_blk_F","hgun_Pistol_heavy_01_green_F"],
			["9Rnd_45ACP_Mag","16Rnd_9x21_Mag","16Rnd_9x21_green_Mag","16Rnd_9x21_yellow_Mag","11Rnd_45ACP_Mag","6Rnd_45ACP_Cylinder"]
		],
		["muzzle_snds_H","muzzle_snds_L","muzzle_snds_M","muzzle_snds_B","optic_Arco","optic_Hamr","optic_Aco","optic_ACO_grn","optic_Aco_smg","optic_ACO_grn_smg","optic_Holosight","optic_Holosight_smg","acc_flashlight","acc_flashlight_smg_01","acc_flashlight_pistol","acc_pointer_IR","optic_MRCO","muzzle_snds_acp","optic_Yorris","optic_MRD","muzzle_snds_570","muzzle_snds_H_snd_F","muzzle_snds_m_snd_F","muzzle_snds_B_snd_F","muzzle_snds_65_TI_blk_F","optic_Arco_blk_F","optic_ERCO_blk_F","optic_ERCO_snd_F","optic_Holosight_blk_F","optic_Holosight_smg_blk_F","optic_ico_01_f","optic_ico_01_black_f","optic_ico_01_sand_f","muzzle_snds_B_arid_F","optic_Holosight_arid_F","optic_Arco_AK_blk_F","optic_Arco_AK_arid_F","optic_MRD_black"]
	],
	[],
	[],
	["B_Carryall_khk","B_Carryall_cbr","B_Carryall_oli","B_Carryall_green_F"],
	[],
	[],
	[],
	true
] call MAZ_RS_fnc_createNewEquipmentForRole;

comment "CTRG / AAF Sniper";
[
	independent,
	"Altis",
	"Sniper",
	[
		[
			["srifle_GM6_F","srifle_LRR_F","srifle_LRR_camo_F","srifle_DMR_02_F","srifle_DMR_02_camo_F","srifle_DMR_04_F","srifle_DMR_04_Tan_F","srifle_DMR_05_blk_F","srifle_DMR_05_tan_f"],
			["5Rnd_127x108_Mag","5Rnd_127x108_APDS_Mag","7Rnd_408_Mag","10Rnd_338_Mag","10Rnd_127x54_Mag","10Rnd_93x64_DMR_05_Mag"]
		],
		[
			[],
			[]
		],
		[
			["hgun_ACPC2_F","hgun_P07_F","hgun_Pistol_heavy_01_F","hgun_Pistol_heavy_02_F","hgun_Rook40_F","hgun_P07_blk_F","hgun_Pistol_heavy_01_green_F"],
			["9Rnd_45ACP_Mag","16Rnd_9x21_Mag","16Rnd_9x21_green_Mag","16Rnd_9x21_yellow_Mag","11Rnd_45ACP_Mag","6Rnd_45ACP_Cylinder"]
		],
		["muzzle_snds_L","optic_SOS","optic_NVS","optic_DMS","optic_LRPS","muzzle_snds_338_black","muzzle_snds_338_sand","muzzle_snds_93mmg_tan","optic_AMS","optic_AMS_snd","optic_KHS_blk","optic_KHS_old","optic_KHS_tan","bipod_01_F_snd","bipod_01_F_blk","bipod_03_F_blk","bipod_03_F_oli","bipod_01_F_khk","optic_DMS_weathered_F","optic_DMS_weathered_Kir_F"]
	],
	["U_I_CombatUniform","U_I_CombatUniform_shortsleeve","U_I_OfficerUniform","U_I_Wetsuit","U_BG_Guerilla1_1","U_BG_leader","U_B_CTRG_1","U_B_CTRG_2","U_B_CTRG_3","U_B_CTRG_Soldier_F","U_B_CTRG_Soldier_2_F","U_B_CTRG_Soldier_3_F","U_B_CTRG_Soldier_Arid_F","U_B_CTRG_Soldier_2_Arid_F","U_B_CTRG_Soldier_3_Arid_F","U_BG_Guerilla1_2_F","U_I_E_Uniform_01_F","U_I_E_Uniform_01_tanktop_F","U_I_E_Uniform_01_shortsleeve_F","U_I_CBRN_Suit_01_AAF_F","U_I_GhillieSuit","U_I_FullGhillie_lsh","U_I_FullGhillie_sard","U_I_FullGhillie_ard"],
	["V_Rangemaster_belt","V_BandollierB_khk","V_BandollierB_cbr","V_BandollierB_rgr","V_BandollierB_blk","V_BandollierB_oli","V_Chestrig_khk","V_Chestrig_rgr","V_Chestrig_blk","V_Chestrig_oli","V_TacVest_khk","V_TacVest_brn","V_TacVest_oli","V_TacVest_blk","V_TacVest_camo","V_TacVestIR_blk","V_PlateCarrierIA1_dgtl","V_PlateCarrierIA2_dgtl","V_RebreatherB","V_RebreatherIA","V_PlateCarrierL_CTRG","V_PlateCarrierH_CTRG","V_I_G_resistanceLeader_F","V_TacChestrig_grn_F","V_TacChestrig_oli_F","V_TacChestrig_cbr_F","V_PlateCarrier1_rgr_noflag_F","V_PlateCarrier2_rgr_noflag_F","V_CarrierRigKBT_01_Olive_F","V_CarrierRigKBT_01_light_Olive_F","V_SmershVest_01_F","V_SmershVest_01_radio_F"],
	["B_AssaultPack_khk","B_AssaultPack_rgr","B_AssaultPack_sgg","B_AssaultPack_blk","B_AssaultPack_cbr","B_Kitbag_rgr","B_Kitbag_sgg","B_Kitbag_cbr","B_Kitbag_tan","B_TacticalPack_rgr","B_TacticalPack_blk","B_TacticalPack_oli","B_FieldPack_khk","B_FieldPack_cbr","B_FieldPack_blk","B_FieldPack_oli","B_LegStrapBag_black_F","B_LegStrapBag_coyote_F","B_LegStrapBag_olive_F","B_FieldPack_green_F"],
	["H_Booniehat_khk","H_Booniehat_oli","H_Booniehat_tan","H_Booniehat_dgtl","H_Booniehat_khk_hs","H_Cap_oli","H_Cap_headphones","H_Cap_tan","H_Cap_blk","H_Cap_khaki_specops_UK","H_Cap_grn","H_Cap_blk_Raven","H_Cap_oli_hs","H_Cap_surfer","H_MilCap_dgtl","H_Bandanna_surfer","H_Bandanna_khk","H_Bandanna_khk_hs","H_Bandanna_cbr","H_Bandanna_sgg","H_Bandanna_sand","H_Bandanna_surfer_blk","H_Bandanna_surfer_grn","H_Bandanna_gry","H_Bandanna_camo","H_Shemag_olive","H_Shemag_olive_hs","H_ShemagOpen_tan","H_Beret_blk","H_Beret_02","H_Watchcap_blk","H_Watchcap_cbr","H_Watchcap_khk","H_Watchcap_camo","H_HeadSet_black_F","H_HeadBandage_stained_F","H_HeadBandage_clean_F","H_HeadBandage_bloody_F","H_Beret_EAF_01_F","H_Booniehat_mgrn","H_MilCap_grn"],
	["G_Combat","G_Lowprofile","G_Shades_Black","G_Shades_Green","G_Shades_Red","G_Squares_Tinted","G_Sport_Red","G_Tactical_Black","G_Aviator","G_Lady_Blue","G_B_Diving","G_I_Diving","G_Balaclava_blk","G_Balaclava_oli","G_Balaclava_combat","G_Balaclava_lowprofile","G_Bandanna_blk","G_Bandanna_oli","G_Bandanna_khk","G_Bandanna_tan","G_Bandanna_beast","G_Bandanna_shades","G_Bandanna_sport","G_Bandanna_aviator","G_Shades_Blue","G_Tactical_Clear","G_Combat_Goggles_tna_F","G_RegulatorMask_F","G_WirelessEarpiece_F"],
	["Rangefinder"],
	false
] call MAZ_RS_fnc_createNewEquipmentForRole;