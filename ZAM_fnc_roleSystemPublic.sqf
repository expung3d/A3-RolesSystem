if (missionNamespace getVariable ["MAZ_RS_enabled",false]) exitWith {["The Roles System is already running!","addItemFailed"] call MAZ_RS_fnc_roleSystemMessage;};

private _varName = "MAZ_System_RolesSystem";
private _myJIPCode = "MAZ_RolesSystem_JIP";

MAZ_RS_enabled = true;
publicVariable 'MAZ_RS_enabled';

MAZ_RS_DebugMode = false;
publicVariable "MAZ_RS_DebugMode";

MAZ_RS_Version = "1.4.1";
publicVariable "MAZ_RS_Version";

MAZ_RS_GroundCommanders = ["","",""];
publicVariable "MAZ_RS_GroundCommanders";

MAZ_RS_LimitVoN = true;
publicVariable "MAZ_RS_LimitVoN";

MAZ_RS_Public = true;
publicVariable "MAZ_RS_Public";

MAZ_RS_MAX_PER_GROUP = 8;
publicVariable "MAZ_RS_MAX_PER_GROUP";

MAZ_RS_MIN_FOR_SPECIALIST = 5;
publicVariable "MAZ_RS_MIN_FOR_SPECIALIST";

MAZ_RS_MIN_FOR_SUPPORT = 7;
publicVariable "MAZ_RS_MIN_FOR_SUPPORT";

private _value = (str {
	MAZ_fnc_keybindCarrier = {
		MAZ_isChangingKeybind = false;

		MAZ_fnc_newKeybind = {
			params ["_displayName","_description","_keyCode","_code",["_shift",false],["_ctrl",false],["_alt",false],["_zeusKeybind",false]];
			if(isNil "MAZ_KeybindData") then {
				MAZ_KeybindData = [];
			};
			private _display = if(_zeusKeybind) then {findDisplay 312} else {findDisplay 46};

			MAZ_KeybindData pushBack [_displayName,_description,_display,_keyCode,_code,[_shift,_ctrl,_alt]];
		};

		MAZ_fnc_removeKeybind = {
			params ["_keybindID"];
			if((count MAZ_KeybindData - 1) >= _keybindID) exitWith {
				MAZ_KeybindData deleteAt _keybindID;
				true
			};
			false
		};

		MAZ_fnc_changeKeybindKey = {
			params ["_index","_newKeyCode","_modifierDataNew"];
			private _KeybindData = MAZ_KeybindData select _index;
			_KeybindData params ["_displayName","_description","_display","_keyCode","_code","_modifierData"];
			if(_keyCode != _newKeyCode) then {
				MAZ_KeybindData set [_index,[_displayName,_description,_display,_newKeyCode,_code,_modifierDataNew]]
			};
		};

		MAZ_fnc_populateKeybindsInterface = {
			params ["_listnbox"];
			if(isNil "MAZ_KeybindData") exitWith {};
			{
				_x params ["_displayName","_description","","_keyCode","","_modiferData"];
				private _KeybindText = (keyName _keyCode) trim ['"',0];
				{
					if(_x) then {
						switch (_forEachIndex) do {
							case 0: {
								_KeybindText = _KeybindText insert [0,"[SHIFT] + "];
							};
							case 1: {
								_KeybindText = _KeybindText insert [0,"[CTRL] + "];
							};
							case 2: {
								_KeybindText = _KeybindText insert [0,"[ALT] + "];
							};
						};
					};
				}forEach _modiferData;
				private _descriptionText = _description;
				if(count _descriptionText > 28) then {
					_descriptionText = [_descriptionText,0,27] call BIS_fnc_trimString;
					_descriptionText = _descriptionText insert [28,"..."];
				};
				private _index = _listnbox lnbAddRow [_KeybindText,_displayName,_descriptionText];
				_listnBox lnbSetTooltip [[_index,0],_description];
			}forEach MAZ_KeybindData;
		};

		MAZ_fnc_changeKeybindInterface = {
			params ["_index"];
			private _indexRow = _index + 1;
			private _listNBox = uiNamespace getVariable 'KeybindListnBox';
			private _KeybindMenu = uiNamespace getVariable 'MAZ_KeybindMenu';
			if(isNil "MAZ_isChangingKeybind") then {
				MAZ_isChangingKeybind = false;
				MAZ_isChangingKeybindIndex = -1;
				MAZ_isChangingKeybindEH = -1;
			};

			if(MAZ_isChangingKeybind) then {
				private _data = MAZ_KeybindData select (MAZ_isChangingKeybindIndex - 1);
				_data params ["","","","_keyCode","","_modifierData"];
				private _KeybindText = keyName _keyCode;
				{
					if(_x) then {
						switch (_forEachIndex) do {
							case 0: {
								_KeybindText = _KeybindText insert [0,"[SHIFT] + "];
							};
							case 1: {
								_KeybindText = _KeybindText insert [0,"[CTRL] + "];
							};
							case 2: {
								_KeybindText = _KeybindText insert [0,"[ALT] + "];
							};
						};
					};
				}forEach _modifierData;
				_listnbox lnbSetText [[MAZ_isChangingKeybindIndex,0],_KeybindText];
				_KeybindMenu displayRemoveEventHandler ["KeyDown",MAZ_isChangingKeybindEH];
			};

			MAZ_isChangingKeybind = true;
			MAZ_isChangingKeybindIndex = _indexRow;
			_listnbox lnbSetText [[MAZ_isChangingKeybindIndex,0],"Recording input..."];
			MAZ_isChangingKeybindEH = _KeybindMenu displayAddEventHandler ["KeyDown",{
				params ["_displayOrControl", "_key", "_shift", "_ctrl", "_alt"];
				if(_key == 29 || _key == 56 || _key == 42) exitWith {};
				if(_key == 1) exitWith {
					MAZ_isChangingKeybind = false;
					MAZ_isChangingKeybindIndex = -1;
					_displayOrControl displayRemoveEventHandler [_thisEvent,_thisEventHandler];
					MAZ_isChangingKeybindEH = nil;
				};
				[MAZ_isChangingKeybindIndex - 1,_key,[_shift,_ctrl,_alt]] call MAZ_fnc_changeKeybindKey;
				private _listNBox = uiNamespace getVariable 'KeybindListnBox';
				private _KeybindText = keyName _key;
				{
					if(_x) then {
						switch (_forEachIndex) do {
							case 0: {
								_KeybindText = _KeybindText insert [0,"[SHIFT] + "];
							};
							case 1: {
								_KeybindText = _KeybindText insert [0,"[CTRL] + "];
							};
							case 2: {
								_KeybindText = _KeybindText insert [0,"[ALT] + "];
							};
						};
					};
				}forEach [_shift,_ctrl,_alt];
				_listnbox lnbSetText [[MAZ_isChangingKeybindIndex,0],_KeybindText];


				MAZ_isChangingKeybind = false;
				MAZ_isChangingKeybindIndex = -1;
				_displayOrControl displayRemoveEventHandler [_thisEvent,_thisEventHandler];
				MAZ_isChangingKeybindEH = nil;
			}];
		};

		MAZ_fnc_modifyKeybindsInterface = {
			if(!isNull (findDisplay 49)) then {
				(findDisplay 49) closeDisplay 0;
				waitUntil {(isNull (findDisplay 49))};
			};
			with uiNamespace do {
				private _fn_convertGUIGRID = {
					params ["_mode","_value"];

					comment "Defines";
						private _GUI_GRID_WAbs = ((safeZoneW / safeZoneH) min 1.2);
						private _GUI_GRID_HAbs = (_GUI_GRID_WAbs / 1.2);
						private _GUI_GRID_W = (_GUI_GRID_WAbs / 40);
						private _GUI_GRID_H = (_GUI_GRID_HAbs / 25);
						private _GUI_GRID_X = (safeZoneX);
						private _GUI_GRID_Y = (safeZoneY + safeZoneH - _GUI_GRID_HAbs);

						private _GUI_GRID_CENTER_WAbs = _GUI_GRID_WAbs;
						private _GUI_GRID_CENTER_HAbs = _GUI_GRID_HAbs;
						private _GUI_GRID_CENTER_W = _GUI_GRID_W;
						private _GUI_GRID_CENTER_H = _GUI_GRID_H;
						private _GUI_GRID_CENTER_X = (safeZoneX + (safeZoneW - _GUI_GRID_CENTER_WAbs)/2);
						private _GUI_GRID_CENTER_Y = (safeZoneY + (safeZoneH - _GUI_GRID_CENTER_HAbs)/2);

					comment "Mode Selection";
					private _return = switch (toUpper _mode) do {
						case "X": {((_value) * _GUI_GRID_W + _GUI_GRID_CENTER_X)};
						case "Y": {((_value) * _GUI_GRID_H + _GUI_GRID_CENTER_Y)};
						case "W": {((_value) * _GUI_GRID_W)};
						case "H": {((_value) * _GUI_GRID_H)};
					};
					_return
				};
				createDialog "RscDisplayEmpty";
				showchat true;
				MAZ_KeybindMenu = findDisplay -1;

				private _label = MAZ_KeybindMenu ctrlCreate ["RscText", 1000];
				_label ctrlSetText "Modify Keybinds";
				_label ctrlSetPosition [["X",7] call _fn_convertGUIGRID, ["Y",5] call _fn_convertGUIGRID, ["W",26] call _fn_convertGUIGRID, ["H",1] call _fn_convertGUIGRID];
				_label ctrlSetTextColor [1,1,1,1];
				_label ctrlSetBackgroundColor [(profilenamespace getvariable ['GUI_BCG_RGB_R',0.13]),(profilenamespace getvariable ['GUI_BCG_RGB_G',0.54]),(profilenamespace getvariable ['GUI_BCG_RGB_B',0.21]),(profilenamespace getvariable ['GUI_BCG_RGB_A',0.8])];
				_label ctrlCommit 0;

				private _bg = MAZ_KeybindMenu ctrlCreate ["IGUIBack", 2200];
				_bg ctrlSetPosition [["X",7] call _fn_convertGUIGRID, ["Y",6.2] call _fn_convertGUIGRID, ["W",26] call _fn_convertGUIGRID, ["H",13.8] call _fn_convertGUIGRID];
				_bg ctrlSetBackgroundColor [0,0,0,0.5];
				_bg ctrlCommit 0;

				private _listBG = MAZ_KeybindMenu ctrlCreate ["RscText", 1001];
				_listBG ctrlSetPosition [["X",7.5] call _fn_convertGUIGRID, ["Y",6.5] call _fn_convertGUIGRID, ["W",25] call _fn_convertGUIGRID, ["H",1] call _fn_convertGUIGRID];
				_listBG ctrlSetBackgroundColor [0,0,0,1];
				_listBG ctrlCommit 0;

				private _listBG2 = MAZ_KeybindMenu ctrlCreate ["RscText", 1002];
				_listBG2 ctrlSetPosition [["X",7.5] call _fn_convertGUIGRID, ["Y",7.5] call _fn_convertGUIGRID, ["W",25] call _fn_convertGUIGRID, ["H",12.2] call _fn_convertGUIGRID];
				_listBG2 ctrlSetBackgroundColor [0,0,0,0.4];
				_listBG2 ctrlCommit 0;

				private _listBG2 = MAZ_KeybindMenu ctrlCreate ["RscText", 1002];
				_listBG2 ctrlSetPosition [["X",7.5] call _fn_convertGUIGRID, ["Y",7.5] call _fn_convertGUIGRID, ["W",25] call _fn_convertGUIGRID, ["H",12.2] call _fn_convertGUIGRID];
				_listBG2 ctrlSetBackgroundColor [0,0,0,0.4];
				_listBG2 ctrlCommit 0;

				private _listBG3 = MAZ_KeybindMenu ctrlCreate ["RscText", 1002];
				_listBG3 ctrlSetPosition [["X",12.95] call _fn_convertGUIGRID, ["Y",7.5] call _fn_convertGUIGRID, ["W",9.8] call _fn_convertGUIGRID, ["H",12.2] call _fn_convertGUIGRID];
				_listBG3 ctrlSetBackgroundColor [0.25,0.25,0.25,0.4];
				_listBG3 ctrlCommit 0;

				KeybindListnBox = MAZ_KeybindMenu ctrlCreate ["RscListNBox", 1500];
				KeybindListnBox ctrlSetPosition [["X",7.5] call _fn_convertGUIGRID, ["Y",6.5] call _fn_convertGUIGRID, ["W",25] call _fn_convertGUIGRID, ["H",13.2] call _fn_convertGUIGRID];
				KeybindListnBox ctrlSetBackgroundColor [0,0,0,0.5];
				lnbClear KeybindListnBox;
				for "_i" from 0 to 10 do {	
					KeybindListnBox lnbDeleteColumn _i;
				};
				KeybindListnBox lnbAddColumn 0;
				KeybindListnBox lnbAddColumn 0.2;
				KeybindListnBox lnbAddColumn 0.8;
				KeybindListnBox lnbAddRow ["Keybind","Action","Description"];
				KeybindListnBox ctrlAddEventHandler ["lbDblClick",{
					params ["_control", "_selectedIndex"];
					[_selectedIndex - 1] call MAZ_fnc_changeKeybindInterface;
				}];
				KeybindListnBox ctrlCommit 0;

				private _cancel = MAZ_KeybindMenu ctrlCreate ["RscButtonMenuCancel",2700];
				_cancel ctrlSetPosition [["X",7] call _fn_convertGUIGRID, ["Y",20.1] call _fn_convertGUIGRID, ["W",6] call _fn_convertGUIGRID, ["H",1] call _fn_convertGUIGRID];
				_cancel ctrlAddEventHandler ["ButtonClick",{
					params ["_control"];
					(uiNamespace getVariable 'MAZ_KeybindMenu') closeDisplay 2;
				}];
				_cancel ctrlCommit 0;

				private _confirm = MAZ_KeybindMenu ctrlCreate ["RscButtonMenuOk",2600];
				_confirm ctrlSetPosition [["X",27] call _fn_convertGUIGRID, ["Y",20.1] call _fn_convertGUIGRID, ["W",6] call _fn_convertGUIGRID, ["H",1] call _fn_convertGUIGRID];
				_confirm ctrlAddEventHandler ["ButtonClick",{
					params ["_control"];
					(uiNamespace getVariable 'MAZ_KeybindMenu') closeDisplay 1;
				}];
				_confirm ctrlCommit 0;
			};
			[uiNamespace getVariable 'KeybindListnBox'] call MAZ_fnc_populateKeybindsInterface;
		};

		MAZ_fnc_KeybindSystemInit = {
			waitUntil {uisleep 0.1;!isNull (findDisplay 46) && alive player};
			sleep 0.1;
			if(isNil "MAZ_KeybindData") then {
				MAZ_KeybindData = [];
			};
			if(!isNil "MAZ_Key_Keybinds46") then {
				(findDisplay 46) displayRemoveEventHandler ["KeyDown",MAZ_Key_Keybinds46];
			};
			MAZ_Key_Keybinds46 = (findDisplay 46) displayAddEventHandler ["KeyDown",{
				params ['_display', '_key', '_shift', '_ctrl', '_alt'];
				{
					_x params ["","","_displayBind","_keyCode","_code","_modifiers"];
					_modifiers params ["_isShift","_isCtrl","_isAlt"];
					if(_shift == _isShift && _ctrl == _isCtrl && _alt == _isAlt && _key == _keyCode && _displayBind == _display && !MAZ_isChangingKeybind) then {
						[] call _code;
					};
				}forEach MAZ_KeybindData;
			}];
			if(!isNil "MAZ_Key_Keybinds312") then {
				(findDisplay 46) displayRemoveEventHandler ["KeyDown",MAZ_Key_Keybinds312];
			};
			MAZ_Key_Keybinds312 = (findDisplay 312) displayAddEventHandler ["KeyDown",{
				params ['_display', '_key', '_shift', '_ctrl', '_alt'];
				{
					_x params ["","","_displayBind","_keyCode","_code","_modifiers"];
					_modifiers params ["_isShift","_isCtrl","_isAlt"];
					if(_shift == _isShift && _ctrl == _isCtrl && _alt == _isAlt && _key == _keyCode && _displayBind == _display && !MAZ_isChangingKeybind) then {
						[] call _code;
					};
				}forEach MAZ_KeybindData;
			}];
		};

		comment "Ctrl + 0";
		[] spawn {
			waitUntil {uisleep 0.1;!isNull (findDisplay 46) && alive player};
			sleep 0.1;
			[] spawn MAZ_fnc_KeybindSystemInit;
			if(isNil "MAZ_Key_MainKey") then {
				MAZ_Key_MainKey = ["Keybinds Menu","Edit the in-game keybinds.",11,{[] call MAZ_fnc_modifyKeybindsInterface;},false,true] call MAZ_fnc_newKeybind;
			};
		};
	};
	call MAZ_fnc_keybindCarrier;

	player setVariable ["MAZ_RS_roles_role","Recruit",true];
	MAZ_RS_rolesList = ["Recruit","Rifleman","Medic","Engineer","Crewman","Heli Pilot","Pilot","Squad Leader","Autorifleman","Light Anti-Tank","Marksman","Grenadier","Heavy Gunner","Heavy Anti-Tank","Sharpshooter"];
	MAZ_RS_rolesDescriptions = [
		[
			"Recruit",
			"Default role, limited ammo and mediocre weapons. To switch from this, join a group.",
			"a3\ui_f\data\gui\rsc\rscdisplaymultiplayersetup\disabledai_ca.paa"
		],
		[
			"Rifleman",
			"Standard rifleman, various standard issue rifles available.",
			"a3\ui_f\data\igui\cfg\actions\obsolete\ui_action_gear_ca.paa"
		],
		[
			"Medic",
			"A Combat Lifesaver, can have extra FAKs, can carry a Medkit, and revive others faster.",
			"a3\ui_f\data\igui\cfg\holdactions\holdaction_revivemedic_ca.paa"
		],
		[
			"Engineer",
            "An Engineer who specializes in deploying and clearing mines. Has access to mines, a mine detector, and a toolkit.",
            "a3\ui_f\data\igui\cfg\actions\repair_ca.paa"
        ],
		[
			"Crewman",
			"This role allows the player to enter armored vehicles as a crewman (Driver, Gunner, Commander).",
			"a3\data_f_tank\logos\arma3_tank_picture_ca.paa"
		],
		[
			"Heli Pilot",
			"This role allows the player to enter helicopters as part of the crew (Pilot, Co-Pilot).",
			"a3\data_f_heli\logos\arma3_heli_icon_ca.paa"
		],
		[
			"Pilot",
			"This role allows the player to enter planes as part of the crew (Pilot).",
			"a3\data_f_jets\logos\jets_icon_ca.paa"
		],
		[
			"Squad Leader",
			"Squad Leaders are mobile respawns, they allow their squad members to spawn at their position. Only one per group.",
			"a3\ui_f\data\igui\cfg\holdactions\holdaction_requestleadership_ca.paa"
		],
		[
			"Autorifleman",
			"Autoriflemen have light machine guns. These allow the autorifleman to send lots of firepower down range.",
			"a3\ui_f\data\gui\cfg\respawnroles\assault_ca.paa"
		],
		[
			"Light Anti-Tank",
			"Light Anti-Tank have anti-tank launchers, but the mediocre ones. They wish they were Heavy Anti-Tank.",
			"a3\structures_f_bootcamp\vr\helpers\data\vr_symbol_launchers_ca.paa"
		],
		[
			"Marksman",
			"Marksmen have marksman rifles, they allow the marksman to engage targets at an extended range. They also have high magnification optics.",
			"a3\data_f_mark\logos\arma3_mark_logo_ca.paa"
		],
		[
			"Grenadier",
			"Grenadiers make things go boom. They have underbarrel grenade launchers and can effectively fight infantry and some unarmored vehicles.",
			"a3\ui_f\data\gui\cfg\hints\ugl_ca.paa"
		],
		[
			"Heavy Gunner",
			"Heavy Gunners are everything an autorifleman dreams of being. Instead of a light machine gun, they have heavy machine guns. They have bigger bullets, bigger bullets means better.",
			"a3\structures_f_mark\vr\helpers\data\vr_symbol_mark_weaponhandling1_ca.paa"
		],
		[
			"Heavy Anti-Tank",
			"Heavy Anti-Tank have the anti-tank launchers Light Anti-Tank dream of. Extremely effective at engaging armored targets.",
			"a3\ui_f_jets\data\gui\cfg\hints\weaponsmissiles_ca.paa"
		],
		[
			"Sharpshooter",
			"Sharpshooters are like marksmen, but on steroids. Like marksmen, they have long range rifles, but they shoot bigger bullets, have a farther range, and have larger optics.",
			"a3\structures_f_mark\vr\helpers\data\vr_symbol_mark_weaponhandling3_ca.paa"
		]
	];
	MAZ_RS_specialRolesList = ["Autorifleman","Light Anti-Tank","Marksman","Grenadier"];
	MAZ_RS_supportRolesList = ["Heavy Gunner","Heavy Anti-Tank","Sharpshooter"];

	MAZ_RS_fnc_createNewDefaultSideUniform = {
		params [
			["_side",west,[west]],
			["_map","Altis",[""]],
			["_uniforms",[],[[]]],
			["_vests",[],[[]]],
			["_backpacks",[],[[]]],
			["_headgear",[],[[]]],
			["_goggles",[],[[]]]
		];

		private _variableName = format ["MAZ_RS_%1DefaultUniform_%2",_side,_map];
		private _var = [[],[]];

		private _var1 = _var # 0;
		private _var2 = _var # 1;

		_var1 = _var1 + _uniforms + _vests + _headgear + _goggles;
		_var2 = _var2 + _backpacks;

		_var = [_var1,_var2];

		missionNamespace setVariable [_variableName,_var];
	};

	MAZ_RS_fnc_createNewEquipmentForRole = {
		params [
			["_side",west,[west]],
			["_map","Altis",[""]],
			["_role","Rifleman",[""]],
			["_weapons",[],[[]]],
			["_uniforms",[],[[]]],
			["_vests",[],[[]]],
			["_backpacks",[],[[]]],
			["_headgear",[],[[]]],
			["_goggles",[],[[]]],
			["_extraItems",[],[[]]],
			["_useDefaultSideUniforms",true,[true]]
		];

		_weapons params [
			["_primaryWeaponData",[],[[]]],
			["_launcherWeaponData",[],[[]]],
			["_pistolWeaponData",[],[[]]],
			["_attachments",[],[[]]]
		];

		_role = [_role] call MAZ_RS_fnc_formatRoleName;
		private _variableNameItems = format ["MAZ_RS_%1_%2_%3_Items",_side,_map,_role];
		private _variableNameWeapons = format ["MAZ_RS_%1_%2_%3_Weapons",_side,_map,_role];
		private _variableNameMags = format ["MAZ_RS_%1_%2_%3_Mags",_side,_map,_role];
		private _variableNameBackpack = format ["MAZ_RS_%1_%2_%3_Backpack",_side,_map,_role];

		comment "Add items (Uniform and attachments)";
		private _var = missionNamespace getVariable _variableNameItems;
		if(isNil "_var") then {
			_var = [];
		};
		private _normalItems = ["ItemWatch","ItemCompass","ItemGPS","ItemRadio","ItemMap","Binocular","NVGoggles","NVGoggles_OPFOR","NVGoggles_INDEP","FirstAidKit"];
		_var = _var + _uniforms + _vests + _headgear + _goggles + _attachments + _extraItems + _normalItems;
		comment 'if(getPlayerUID player == "76561198864845841") then {_var = _var + ["H_RacingHelmet_3_F"]}';
		if(_useDefaultSideUniforms) then {
			private _defaultUniVarName = format ["MAZ_RS_%1DefaultUniform_%2",_side,_map];
			private _defaultUniItems = missionNamespace getVariable _defaultUniVarName;
			if(!isNil "_defaultUniItems") then {
				_var = _var + (_defaultUniItems # 0);
			};
		};
		missionNamespace setVariable [_variableNameItems,_var];

		comment "Add weapons";

		_primaryWeaponData params [
			["_primaryWeaponClasses",[],[[]]],
			["_primaryweaponMags",[],[[]]]
		];

		_launcherWeaponData params [
			["_launcherWeaponClasses",[],[[]]],
			["_launcherWeaponMags",[],[[]]]
		];

		_pistolWeaponData params [
			["_pistolWeaponClasses",[],[[]]],
			["_pistolWeaponMags",[],[[]]]
		];

		comment "Add weapons";
		_var = missionNamespace getVariable _variableNameWeapons;
		if(isNil "_var") then {
			_var = [];
		};
		_var = _var + _primaryWeaponClasses + _launcherWeaponClasses + _pistolWeaponClasses;
		missionNamespace setVariable [_variableNameWeapons,_var];

		comment "Add magazines";
		_var = missionNamespace getVariable _variableNameMags;
		if(isNil "_var") then {
			_var = [];
		};
		_var = _var + _primaryweaponMags + _launcherWeaponMags + _pistolWeaponMags;
		missionNamespace setVariable [_variableNameMags,_var];

		comment "Add backpacks";

		_var = missionNamespace getVariable _variableNameBackpack;
		if(isNil "_var") then {
			_var = [];
		};
		_var = _var + _backpacks;
		if(_useDefaultSideUniforms) then {
			private _defaultUniVarName = format ["MAZ_RS_%1DefaultUniform_%2",_side,_map];
			private _defaultUniItems = missionNamespace getVariable _defaultUniVarName;
			if(!isNil "_defaultUniItems") then {
				_var = _var + (_defaultUniItems # 1);
			};
		};
		missionNamespace setVariable [_variableNameBackpack,_var];

	};

	MAZ_RS_fnc_createRoleEquipment = {
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
						["30Rnd_556x45_Stanag","30Rnd_556x45_Stanag_Tracer_Red","30Rnd_556x45_Stanag_Sand","30Rnd_556x45_Stanag_Sand_Tracer_Red","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_black_mag","30Rnd_65x39_caseless_mag_Tracer","30Rnd_65x39_caseless_black_mag_Tracer",
						"DemoCharge_Remote_Mag","SatchelCharge_Remote_Mag","ATMine_Range_Mag","ClaymoreDirectionalMine_Remote_Mag","APERSMine_Range_Mag","SLAMDirectionalMine_Wire_Mag","APERSTripMine_Wire_Mag"]
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
				["B_Kitbag_rgr"],
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

		comment "Default AAF Uniforms";
		{
			[
				independent,
				_x,
				["U_I_CombatUniform","U_I_CombatUniform_shortsleeve","U_BG_independentilla1_2_F"],
				["V_Chestrig_rgr","V_Chestrig_oli","V_TacVest_oli","V_PlateCarrierIA1_dgtl"],
				["B_AssaultPack_dgtl"],	
				["H_Booniehat_oli","H_Booniehat_dgtl","H_HelmetIA","H_Cap_headphones","H_Cap_grn","H_Cap_blk_Raven","H_Bandanna_khk","H_Bandanna_khk_hs","H_Bandanna_sgg","H_Watchcap_blk","H_Watchcap_camo","H_Booniehat_mgrn"],
				["G_Lowprofile","G_Spectacles","G_Spectacles_Tinted","G_Combat","G_Shades_Black","G_Shades_Green","G_Shades_yellow","G_Tactical_Black","G_Bandanna_blk","G_Bandanna_oli","G_Bandanna_khk","G_Bandanna_tan","G_Shades_Blue","G_Tactical_Clear"]
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
						["arifle_Mk20_F","arifle_Mk20C_F","arifle_TRG21_F","arifle_TRG20_F"],
						["30Rnd_556x45_Stanag_Tracer_yellow","30Rnd_556x45_Stanag_yellow","30Rnd_556x45_Stanag_Sand_yellow","30Rnd_556x45_Stanag_Sand_Tracer_yellow"]
					],
					[
						[],
						[]
					],
					[
						["hgun_ACPC2_F","hgun_Pistol_heavy_02_F"],
						["16Rnd_9x21_yellow_Mag","16Rnd_9x21_Mag","11Rnd_45ACP_Mag","6Rnd_45ACP_Cylinder"]
					],
					["optic_Aco","optic_ACO_grn","acc_flashlight","acc_flashlight_smg_01","acc_pointer_IR","optic_Holosight_blk_F","optic_Holosight_smg_blk_F"]
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
						["arifle_Mk20_F","arifle_Mk20C_F","arifle_TRG21_F","arifle_TRG20_F"],
						["30Rnd_556x45_Stanag_Tracer_yellow","30Rnd_556x45_Stanag_yellow","30Rnd_556x45_Stanag_Sand_yellow","30Rnd_556x45_Stanag_Sand_Tracer_yellow"]
					],
					[
						[],
						[]
					],
					[
						["hgun_ACPC2_F","hgun_Pistol_heavy_02_F"],
						["16Rnd_9x21_yellow_Mag","16Rnd_9x21_Mag","11Rnd_45ACP_Mag","6Rnd_45ACP_Cylinder"]
					],
					["optic_Aco","optic_ACO_grn","acc_flashlight","acc_flashlight_smg_01","acc_pointer_IR","optic_Holosight_blk_F","optic_Holosight_smg_blk_F"]
				],
				[],
				["V_PlateCarrierIA2_dgtl"],
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
						["arifle_Mk20_F","arifle_Mk20C_F","arifle_TRG21_F","arifle_TRG20_F"],
						["30Rnd_556x45_Stanag_Tracer_yellow","30Rnd_556x45_Stanag_yellow","30Rnd_556x45_Stanag_Sand_yellow","30Rnd_556x45_Stanag_Sand_Tracer_yellow"]
					],
					[
						[],
						[]
					],
					[
						["hgun_ACPC2_F","hgun_Pistol_heavy_02_F"],
						["16Rnd_9x21_yellow_Mag","16Rnd_9x21_Mag","11Rnd_45ACP_Mag","6Rnd_45ACP_Cylinder"]
					],
					["optic_Aco","optic_ACO_grn","acc_flashlight","acc_flashlight_smg_01","acc_pointer_IR","optic_Holosight_blk_F","optic_Holosight_smg_blk_F","Medikit"]
				],
				[],
				["V_PlateCarrierIA2_dgtl"],
				["B_TacticalPack_oli","B_Kitbag_rgr"],
				[],
				[],
				[],
				true
			] call MAZ_RS_fnc_createNewEquipmentForRole;

			comment "AAF Engineer";
			[
				independent,
				_x,
				"Engineer",
				[
					[
						["arifle_Mk20_F","arifle_Mk20C_F","arifle_TRG21_F","arifle_TRG20_F"],
						["30Rnd_556x45_Stanag_Tracer_yellow","30Rnd_556x45_Stanag_yellow","30Rnd_556x45_Stanag_Sand_yellow","30Rnd_556x45_Stanag_Sand_Tracer_yellow",
						"DemoCharge_Remote_Mag","SatchelCharge_Remote_Mag","ATMine_Range_Mag","ClaymoreDirectionalMine_Remote_Mag","APERSMine_Range_Mag","SLAMDirectionalMine_Wire_Mag","APERSTripMine_Wire_Mag"]
					],
					[
						[],
						[]
					],
					[
						["hgun_ACPC2_F","hgun_Pistol_heavy_02_F"],
						["16Rnd_9x21_yellow_Mag","16Rnd_9x21_Mag","11Rnd_45ACP_Mag","6Rnd_45ACP_Cylinder"]
					],
					["optic_Aco","optic_ACO_grn","acc_flashlight","acc_flashlight_smg_01","acc_pointer_IR","optic_Holosight_blk_F","optic_Holosight_smg_blk_F"]
				],
				[],
				["V_PlateCarrierIA2_dgtl"],
				["B_TacticalPack_oli","B_Kitbag_rgr"],
				[],
				[],
				["Toolkit","MineDetector"],
				true
			] call MAZ_RS_fnc_createNewEquipmentForRole;

			comment "AAF Crewman";
			[
				independent,
				_x,
				"Crewman",
				[
					[
						["arifle_Mk20_F","arifle_Mk20C_F","arifle_TRG21_F","arifle_TRG20_F"],
						["30Rnd_556x45_Stanag_Tracer_yellow","30Rnd_556x45_Stanag_yellow","30Rnd_556x45_Stanag_Sand_yellow","30Rnd_556x45_Stanag_Sand_Tracer_yellow"]
					],
					[
						[],
						[]
					],
					[
						["hgun_ACPC2_F","hgun_Pistol_heavy_02_F"],
						["16Rnd_9x21_yellow_Mag","16Rnd_9x21_Mag","11Rnd_45ACP_Mag","6Rnd_45ACP_Cylinder"]
					],
					["optic_Aco","optic_ACO_grn","acc_flashlight","acc_flashlight_smg_01","acc_pointer_IR","optic_Holosight_blk_F","optic_Holosight_smg_blk_F","toolkit"]
				],
				["U_Tank_green_F"],
				["V_Chestrig_rgr","V_Chestrig_oli","V_TacVest_oli","V_PlateCarrierIA1_dgtl"],
				[],
				["H_HelmetCrew_I"],
				["G_Spectacles","G_Spectacles_Tinted","G_Combat","G_Shades_Black","G_Shades_Green","G_Shades_yellow","G_Tactical_Black","G_Bandanna_blk","G_Bandanna_oli","G_Bandanna_khk","G_Bandanna_tan","G_Shades_Blue","G_Tactical_Clear"],
				[],
				false
			] call MAZ_RS_fnc_createNewEquipmentForRole;

			comment "AAF Heli Pilot";
			[
				independent,
				_x,
				"Heli Pilot",
				[
					[
						["hgun_PDW2000_F","arifle_Mk20C_F","arifle_Mk20C_Plain_F","arifle_TRG21_F","arifle_TRG20_F"],
						["30Rnd_9x21_yellow_Mag","30Rnd_556x45_Stanag_Tracer_yellow","30Rnd_556x45_Stanag_yellow","30Rnd_556x45_Stanag_Sand_yellow","30Rnd_556x45_Stanag_Sand_Tracer_yellow"]
					],
					[
						[],
						[]
					],
					[
						["hgun_ACPC2_F","hgun_Pistol_heavy_02_F"],
						["16Rnd_9x21_yellow_Mag","16Rnd_9x21_Mag","11Rnd_45ACP_Mag","6Rnd_45ACP_Cylinder"]
					],
					["optic_Aco","optic_ACO_grn","acc_flashlight","acc_flashlight_smg_01","acc_pointer_IR","optic_Holosight_blk_F","optic_Holosight_smg_blk_F","toolkit"]
				],
				["U_I_HeliPilotCoveralls"],
				["V_Chestrig_rgr","V_Chestrig_oli","V_TacVest_oli","V_PlateCarrierIA1_dgtl"],
				[],
				["H_PilotHelmetHeli_I","H_CrewHelmetHeli_I"],
				["G_Spectacles","G_Spectacles_Tinted","G_Combat","G_Shades_Black","G_Shades_Green","G_Shades_yellow","G_Tactical_Black","G_Bandanna_blk","G_Bandanna_oli","G_Bandanna_khk","G_Bandanna_tan","G_Shades_Blue","G_Tactical_Clear"],
				[],
				false
			] call MAZ_RS_fnc_createNewEquipmentForRole;

			comment "AAF Pilot";
			[
				independent,
				_x,
				"Pilot",
				[
					[
						["hgun_PDW2000_F","arifle_Mk20C_F"],
						["30Rnd_9x21_yellow_Mag","30Rnd_556x45_Stanag_Tracer_yellow","30Rnd_556x45_Stanag_yellow"]
					],
					[
						[],
						[]
					],
					[
						["hgun_ACPC2_F","hgun_Pistol_heavy_02_F"],
						["16Rnd_9x21_yellow_Mag","16Rnd_9x21_Mag","11Rnd_45ACP_Mag","6Rnd_45ACP_Cylinder"]
					],
					["optic_Aco","optic_ACO_grn","acc_flashlight","acc_flashlight_smg_01","acc_pointer_IR","optic_Holosight_blk_F","optic_Holosight_smg_blk_F","toolkit"]
				],
				["U_I_pilotCoveralls"],
				[],
				["B_Parachute"],
				["H_PilotHelmetFighter_I"],
				[],
				[],
				false
			] call MAZ_RS_fnc_createNewEquipmentForRole;

			comment "AAF Squad Leader";
			[
				independent,
				_x,
				"Squad Leader",
				[
					[
						["arifle_Mk20_F","arifle_Mk20C_F","arifle_TRG21_F","arifle_TRG20_F"],
						["30Rnd_556x45_Stanag_Tracer_yellow","30Rnd_556x45_Stanag_yellow","30Rnd_556x45_Stanag_Sand_yellow","30Rnd_556x45_Stanag_Sand_Tracer_yellow"]
					],
					[
						[],
						[]
					],
					[
						["hgun_ACPC2_F","hgun_Pistol_heavy_02_F"],
						["16Rnd_9x21_yellow_Mag","16Rnd_9x21_Mag","11Rnd_45ACP_Mag","6Rnd_45ACP_Cylinder"]
					],
					["optic_Hamr","optic_Aco","optic_ACO_grn","acc_flashlight","acc_flashlight_smg_01","acc_pointer_IR","optic_Holosight_blk_F","optic_ERCO_blk_F","optic_MRCO","optic_Holosight"]
				],
				[],
				["V_PlateCarrierIA2_dgtl"],
				["B_RadioBag_01_digi_F"],
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
						["LMG_Mk200_F","LMG_Mk200_black_F"],
						["200Rnd_65x39_cased_Box","200Rnd_65x39_cased_Box_Tracer","200Rnd_556x45_Box_F","200Rnd_556x45_Box_Tracer_F"]
					],
					[
						[],
						[]
					],
					[
						["hgun_ACPC2_F","hgun_Pistol_heavy_02_F"],
						["16Rnd_9x21_yellow_Mag","16Rnd_9x21_Mag","11Rnd_45ACP_Mag","6Rnd_45ACP_Cylinder"]
					],
					["optic_Aco","optic_ACO_grn","acc_flashlight","acc_flashlight_smg_01","acc_pointer_IR","optic_Holosight_blk_F","optic_Holosight_smg_blk_F"]
				],
				[],
				["V_PlateCarrierIA2_dgtl"],
				["B_TacticalPack_oli","B_Kitbag_rgr"],
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
						["arifle_Mk20_F","arifle_Mk20C_F","arifle_TRG21_F","arifle_TRG20_F"],
						["30Rnd_556x45_Stanag_Tracer_yellow","30Rnd_556x45_Stanag_yellow","30Rnd_556x45_Stanag_Sand_yellow","30Rnd_556x45_Stanag_Sand_Tracer_yellow"]
					],
					[
						["launch_NLAW_F","launch_MRAWS_green_F","launch_MRAWS_green_rail_F"],
						["NLAW_F","MRAWS_HE_F","MRAWS_HEAT55_F"]
					],
					[
						["hgun_ACPC2_F","hgun_Pistol_heavy_02_F"],
						["16Rnd_9x21_yellow_Mag","16Rnd_9x21_Mag","11Rnd_45ACP_Mag","6Rnd_45ACP_Cylinder"]
					],
					["optic_Aco","optic_ACO_grn","acc_flashlight","acc_flashlight_smg_01","acc_pointer_IR","optic_Holosight_blk_F","optic_Holosight_smg_blk_F"]
				],
				[],
				[],
				["B_TacticalPack_oli","B_Kitbag_rgr","B_Carryall_oli"],
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
						["srifle_EBR_F","srifle_DMR_06_olive_F","srifle_DMR_03_khaki_F"],
						["20Rnd_762x51_Mag","10Rnd_Mk14_762x51_Mag"]
					],
					[
						[],
						[]
					],
					[
						["hgun_ACPC2_F","hgun_Pistol_heavy_02_F"],
						["16Rnd_9x21_yellow_Mag","16Rnd_9x21_Mag","11Rnd_45ACP_Mag","6Rnd_45ACP_Cylinder"]
					],
					["acc_flashlight","acc_flashlight_smg_01","acc_pointer_IR","muzzle_snds_H","optic_SOS","optic_DMS","bipod_01_F_snd","bipod_01_F_blk","muzzle_snds_H_snd_F","optic_NVS"]
				],
				[],
				["V_PlateCarrierIA2_dgtl"],
				[],
				[],
				[],
				["Rangefinder"],
				true
			] call MAZ_RS_fnc_createNewEquipmentForRole;

			comment "AAF Grenadier";
			[
				independent,
				_x,
				"Grenadier",
				[
					[
						["arifle_Mk20_GL_F","arifle_TRG21_GL_F"],
						["30Rnd_556x45_Stanag_Tracer_yellow","30Rnd_556x45_Stanag_yellow","30Rnd_556x45_Stanag_Sand_yellow","30Rnd_556x45_Stanag_Sand_Tracer_yellow","1Rnd_HE_Grenade_shell","UGL_FlareWhite_F","UGL_FlareGreen_F","UGL_FlareRed_F","UGL_FlareYellow_F","UGL_FlareCIR_F","1Rnd_Smoke_Grenade_shell","1Rnd_SmokeRed_Grenade_shell","1Rnd_SmokeGreen_Grenade_shell","1Rnd_SmokeYellow_Grenade_shell","1Rnd_SmokePurple_Grenade_shell","1Rnd_SmokeBlue_Grenade_shell","1Rnd_SmokeOrange_Grenade_shell"]
					],
					[
						[],
						[]
					],
					[
						["hgun_ACPC2_F","hgun_Pistol_heavy_02_F"],
						["16Rnd_9x21_yellow_Mag","16Rnd_9x21_Mag","11Rnd_45ACP_Mag","6Rnd_45ACP_Cylinder"]
					],
					["optic_Aco","optic_ACO_grn","acc_flashlight","acc_flashlight_smg_01","acc_pointer_IR","optic_Holosight_blk_F","optic_Holosight_smg_blk_F"]
				],
				[],
				["V_PlateCarrierIAGL_dgtl"],
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
						["MMG_02_black_F","MMG_02_sand_F"],
						["130Rnd_338_Mag"]
					],
					[
						[],
						[]
					],
					[
						["hgun_ACPC2_F","hgun_Pistol_heavy_02_F"],
						["16Rnd_9x21_yellow_Mag","16Rnd_9x21_Mag","11Rnd_45ACP_Mag","6Rnd_45ACP_Cylinder"]
					],
					["optic_Aco","optic_ACO_grn","optic_Holosight","acc_flashlight","acc_flashlight_smg_01","acc_pointer_IR","optic_Holosight_blk_F","optic_Hamr","optic_ERCO_blk_F"]
				],
				[],
				[],
				["B_Kitbag_rgr","B_TacticalPack_oli"],
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

			comment "AAF Sharpshooter";
			[
				independent,
				_x,
				"Sharpshooter",
				[
					[
						["srifle_GM6_F","srifle_DMR_02_F"],
						["5Rnd_127x108_Mag","10Rnd_338_Mag"]
					],
					[
						[],
						[]
					],
					[
						["hgun_ACPC2_F","hgun_Pistol_heavy_02_F"],
						["16Rnd_9x21_yellow_Mag","16Rnd_9x21_Mag","11Rnd_45ACP_Mag","6Rnd_45ACP_Cylinder"]
					],
					["optic_NVS","optic_LRPS","optic_AMS","optic_KHS_blk","acc_pointer_IR"]
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
	};

	MAZ_RS_fnc_roleSystemMessage = {
		params ["_message",["_sound",""]];
		systemChat format ["[ Roles System ] : %1",_message];
		if(_sound != "") then {
			playSound _sound;
		};
	};

	MAZ_RS_fnc_randomFromEquipment = {
		params ["_role"];
		private _side = side (group player);
		private _map = worldName;
		_role = [_role] call MAZ_RS_fnc_formatRoleName;
		player setUnitLoadout [[],[],[],[],[],[],"","",["","","","",[],[],""],["ItemMap","ItemGPS","ItemRadio","ItemCompass","ItemWatch",""]];
		private _variableNameItems = format ["MAZ_RS_%1_%2_%3_Items",_side,_map,_role];
		private _variableNameWeapons = format ["MAZ_RS_%1_%2_%3_Weapons",_side,_map,_role];
		private _variableNameMags = format ["MAZ_RS_%1_%2_%3_Mags",_side,_map,_role];
		private _variableNameBackpack = format ["MAZ_RS_%1_%2_%3_Backpack",_side,_map,_role];

		private _var = missionNamespace getVariable [_variableNameItems,[]];
		private _uniforms = _var select {((_x call BIS_fnc_itemType) # 1) == "Uniform"};
		private _vests = _var select {((_x call BIS_fnc_itemType) # 1) == "Vest"};
		private _headgear = _var select {((_x call BIS_fnc_itemType) # 1) == "Headgear"};
		private _glasses = _var select {((_x call BIS_fnc_itemType) # 1) == "Glasses"};

		player forceAddUniform (selectRandom _uniforms);
		player addVest (selectRandom _vests);
		player addHeadgear (selectRandom _headgear);
		player addGoggles (selectRandom _glasses);
		for "_i" from 0 to 2 do {
			player addItemToUniform "FirstAidKit";
		};
		if(call MAZ_RS_fnc_isNightTime) then {
			private _nvgs = selectRandom (_var select {((_x call BIS_fnc_itemType) # 1) == "NVGoggles"});
			player addItem _nvgs;
			player assignItem _nvgs;
		};

		_var = missionNamespace getVariable [_variableNameBackpack,[]];
		player addBackpackGlobal (selectRandom _var);

		_var = missionNamespace getVariable [_variableNameWeapons,[]];
		private _rifles = _var select {
			(((_x call BIS_fnc_itemType) # 1) == "AssaultRifle") || 
			(((_x call BIS_fnc_itemType) # 1) == "MachineGun") || 
			(((_x call BIS_fnc_itemType) # 1) == "SniperRifle") || 
			(((_x call BIS_fnc_itemType) # 1) == "SubmachineGun")
		};
		private _launchers = _var select {
			((_x call BIS_fnc_itemType) # 1) == "MissileLauncher" ||
			((_x call BIS_fnc_itemType) # 1) == "RocketLauncher"
		};
		private _pistols = _var select {((_x call BIS_fnc_itemType) # 1) == "Handgun"};
		
		private _rifle = selectRandom _rifles;
		private _launcher = selectRandom _launchers;
		private _pistol = selectRandom _pistols;

		_var = missionNamespace getVariable [_variableNameMags,[]];
		if(!isNil "_rifle") then {
			private _allMags = ([_rifle] call BIS_fnc_compatibleMagazines) apply {tolower _x};
			private _rifleMag = selectRandom (_var select {
				(toLower _x) in _allMags && ((_x call BIS_fnc_itemType) # 1 == "Bullet")
			});
			private _magCount = switch (_role) do {
				case "Heavy_Gunner";
				case "Autorifleman": {2};
				default {6};
			};
			if(_role == "Grenadier") then {
				private _grenadeMag = selectRandom (_var select {
					(toLower _x) in _allMags && ((_x call BIS_fnc_itemType) # 1 == "Shell")
				});
				for "_i" from 0 to 9 do {
					player addMagazine _grenadeMag;
				};
				private _smokeMags = _var select {
					(toLower _x) in _allMags && ((_x call BIS_fnc_itemType) # 1 == "SmokeShell")
				};
				for "_i" from 0 to 3 do {
					player addMagazine (selectRandom _smokeMags);
				};
			};
			for "_i" from 0 to _magCount do {
				player addMagazine _rifleMag;
			};
			player addWeapon _rifle;
		};

		if(!isNil "_launcher") then {
			_allMags = ([_launcher] call BIS_fnc_compatibleMagazines) apply {tolower _x};
			private _launcherMag = selectRandom (_var select {(toLower _x) in _allMags});
			player addMagazine _launcherMag;
			player addWeapon _launcher;
			for "_i" from 0 to 1 do {
				player addMagazine _launcherMag;
			};
		};

		if(!isNil "_pistol") then {
			_allMags = ([_pistol] call BIS_fnc_compatibleMagazines) apply {tolower _x};
			private _pistolMag = selectRandom (_var select {(toLower _x) in _allMags});
			for "_i" from 0 to 1 do {
				player addMagazine _pistolMag;
			};
			player addWeapon _pistol;
		};

		for "_i" from 0 to 1 do {
			player addItemToVest "HandGrenade";
		};

		_var = missionNamespace getVariable [_variableNameItems,[]];
		private _scopes = (_var select {((_x call BIS_fnc_itemType) # 1) == "AccessorySights"}) apply {toLower _x};
		private _scope = "";
		if(call MAZ_RS_fnc_isNightTime) then {
			if("optic_nvs" in _scopes) then {
				_scope = "optic_nvs";
			} else {
				_scope = selectRandom _scopes;
			};
		} else {
			if("optic_nvs" in _scopes) then {
				private _temp = [] + _scopes - ["optic_nvs"];
				_scope = selectRandom _temp;
			} else {
				_scope = selectRandom _scopes;
			};
		};
		private _pointer = selectRandom (_var select {((_x call BIS_fnc_itemType) # 1) == "AccessoryPointer"});
		private _bipod = selectRandom (_var select {((_x call BIS_fnc_itemType) # 1) == "AccessoryBipod"});

		if(!isNil "_scope") then {player addPrimaryWeaponItem _scope;};
		if(!isNil "_pointer") then {player addPrimaryWeaponItem _pointer;};
		if(!isNil "_bipod") then {player addPrimaryWeaponItem _bipod;};

		if(_role == "Squad_Leader") then {
			player addMagazine "Laserbatteries";
			player addWeapon "LaserDesignator";
		} else {
			player addWeapon "Binocular";
		};

		if(_role == "Medic") then {
			player addItemToBackpack "Medikit";
			for "_i" from 0 to 6 do {
				player addItemToBackpack "FirstAidKit";
			};
		};

		if(_role == "Crewman" || _role == "Engineer") then {
			player addItemToBackpack "ToolKit";
		};
		if(_role =="Engineer") then {
			player addItem "MineDetector";
			private _varMines = missionNamespace getVariable [_variableNameMags,[]];
			private _mines = _varMines select {
				((_x call BIS_fnc_itemType) # 1 in ["Mine","MineBounding","MineDirectional"])
			};
			for "_i" from 0 to 3 do {
				player addMagazine (selectRandom _mines);
			};
		};
	};

	MAZ_RS_fnc_isNightTime = {
		([date] call BIS_fnc_sunriseSunsetTime) params ["_sunrise","_sunset"];
		dayTime > _sunset || dayTime < _sunrise
	};

	MAZ_RS_fnc_adjustVoiceChannels = {
		private _role = player getVariable ["MAZ_RS_roles_role","Recruit"];
		private _isCommander = player getVariable ["MAZ_RS_isCommander",false];
		private _isZeus = (!isNull (getAssignedCuratorLogic player));
		if(!MAZ_RS_isAccepted && !_isZeus) exitWith {
			{
				_x enableChannel [true,false];
			}forEach [0,1,2,3];
		};

		private _doesSideHaveCommander = switch (side (group player)) do {
			case west: {0};
			case east: {1};
			case independent: {2};
			default {-1};
		};
		_doesSideHaveCommander = (MAZ_RS_GroundCommanders select _doesSideHaveCommander) != "";

		if(_doesSideHaveCommander) then {
			if(_isCommander || _isZeus) exitWith {
				{
					_x enableChannel true;
				}forEach [0,1,2,3,4];
			};
			if(_role == "Squad Leader") exitWith {
				{
					_x enableChannel [true,false];
				}forEach [0,1];
				{
					_x enableChannel true;
				}forEach [2,3,4,5];
			};
		} else {
			if(_role == "Squad Leader" || _isZeus) then {
				{
					_x enableChannel true;
				}forEach [0,1,2,3,4];
			};
		};

		if(!_isZeus && !_isCommander) then {
			switch (_role) do {
				case "Recruit";
				case "Rifleman";
				case "Medic";
				case "Engineer";
				case "Autorifleman";
				case "Light Anti-Tank";
				case "Marksman";
				case "Grenadier";
				case "Heavy Gunner";
				case "Heavy Anti-Tank";
				case "Sharpshooter": {
					{
						_x enableChannel [true,false];
					}forEach [0,1,2];
					{
						_x enableChannel true;
					}forEach [3,4,5];
				};

				case "Crewman";
				case "Heli Pilot";
				case "Pilot": {
					{
						_x enableChannel [true,false];
					}forEach [0,1];
					{
						_x enableChannel true;
					}forEach [2,3,4,5];
				};
			};
		};
	};

	MAZ_RS_fnc_resetVoiceChannels = {
		{
			_x enableChannel true;
		}forEach [0,1,2,3,4];
	};

	MAZ_RS_fnc_toggleLimitedVoN = {
		params [["_toggle",true,[true]]];
		MAZ_RS_LimitVoN = _toggle;
		publicVariable "MAZ_RS_LimitVoN";
	};

	MAZ_RS_fnc_roleSystemLoopServerInit = {
		while {MAZ_RS_enabled} do {
			[] spawn MAZ_RS_fnc_roleSystemLoopServer;
			sleep 1;
		};
	};

	MAZ_RS_fnc_roleSystemLoopServer = {
		{
			if(({isPlayer _x} count (units _x)) < 1) then {continue};
			private _isSetup = _x getVariable ["MAZ_RS_isServerLoop",false];
			if(_isSetup) then {continue};
			_x setVariable ["MAZ_RS_isServerLoop",true];
			[_x] spawn MAZ_RS_fnc_roleSystemLoopPerGroupServer;
		}forEach allGroups;
	};

	MAZ_RS_fnc_roleSystemLoopPerGroupServer = {
		params ["_group"];
		while{!isNull _group} do {
			private _groupCount = -1;
			if(MAZ_RS_DebugMode) then {
				_groupCount = count (units _group);
			} else {
				_groupCount = {isPlayer _x} count (units _group);
			};
			private _groupLockState = _group getVariable "BIS_dg_pri";
			private _isLocked = _group getVariable ["MAZ_RS_roles_locked",false];
			if(!isNil "_groupLockState") then {
				if(_groupCount >= MAZ_RS_MAX_PER_GROUP) then {
					if(!_groupLockState) then {
						_group setVariable ["MAZ_RS_roles_locked",true,true];
						["SetPrivateState",[_group,true]] call BIS_fnc_dynamicGroups;
					};
				} else {
					if(_groupLockState && _isLocked) then {
						_group setVariable ["MAZ_RS_roles_locked",false,true];
						["SetPrivateState",[_group,false]] call BIS_fnc_dynamicGroups;
					};
				};
			};
			private _squadLeaderCount = {isPlayer _x && (_x getVariable ["MAZ_RS_roles_role","Recruit"]) == "Squad Leader"} count (units _group);
			if(_squadLeaderCount >= 1) then {
				if(_squadLeaderCount == 1) exitWith {
					_group setVariable ["MAZ_RS_roles_grpCanHaveSL",false,true];
				};
				while {count (_group getVariable ["MAZ_RS_GroupSL",[]]) > 1} do {
					private _rolePlayers = _group getVariable "MAZ_RS_GroupSL";
					private _removeID = _rolePlayers select (count _rolePlayers - 1);
					private _remove = objNull;
					{
						if(getPlayerUID _x == _removeID) exitWith {
							_remove = _x;
						};
					}forEach allPlayers;
					_rolePlayers deleteAt (count _rolePlayers - 1);
					[_remove,"Rifleman"] call MAZ_RS_fnc_forceSelectRole;
					sleep 0.1;
					_group setVariable ["MAZ_RS_GroupSL",_rolePlayers,true];
				};
			} else {
				_group setVariable ["MAZ_RS_roles_grpCanHaveSL",true,true];
			};

			private _engineerCount = {isPlayer _x && (_x getVariable ["MAZ_RS_roles_role","Recruit"]) == "Engineer"} count (units _group);
			if(_engineerCount >= 1) then {
				if(_engineerCount == 1) exitWith {
					_group setVariable ["MAZ_RS_roles_grpCanHaveEngineer",false,true];
				};
				while {count (_group getVariable ["MAZ_RS_GroupEngineers",[]]) > 1} do {
					private _rolePlayers = _group getVariable "MAZ_RS_GroupEngineers";
					private _removeID = _rolePlayers select (count _rolePlayers - 1);
					private _remove = objNull;
					{
						if(getPlayerUID _x == _removeID) exitWith {
							_remove = _x;
						};
					}forEach allPlayers;
					_rolePlayers deleteAt (count _rolePlayers - 1);
					[_remove,"Rifleman"] call MAZ_RS_fnc_forceSelectRole;
					sleep 0.1;
					_group setVariable ["MAZ_RS_GroupEngineers",_rolePlayers,true];
				};
			} else {
				_group setVariable ["MAZ_RS_roles_grpCanHaveEngineer",true,true];
			};

			private _medicCount = {isPlayer _x && (_x getVariable ["MAZ_RS_roles_role","Recruit"]) == "Medic"} count (units _group);
			if(_medicCount >= 2) then {
				if(_medicCount == 2) exitWith {
					_group setVariable ["MAZ_RS_roles_grpCanHaveMedic",false,true];
				};
				while {count (_group getVariable ["MAZ_RS_GroupMedics",[]]) > 2} do {
					private _rolePlayers = _group getVariable "MAZ_RS_GroupMedics";
					private _removeID = _rolePlayers select (count _rolePlayers - 1);
					private _remove = objNull;
					{
						if(getPlayerUID _x == _removeID) exitWith {
							_remove = _x;
						};
					}forEach allPlayers;
					_rolePlayers deleteAt (count _rolePlayers - 1);
					[_remove,"Rifleman"] call MAZ_RS_fnc_forceSelectRole;
					sleep 0.1;
					_group setVariable ["MAZ_RS_GroupMedics",_rolePlayers,true];
				};
			} else {
				_group setVariable ["MAZ_RS_roles_grpCanHaveMedic",true,true];
			};

			if(_groupCount >= MAZ_RS_MIN_FOR_SPECIALIST) then {
				private _specialCount = {isPlayer _x && (_x getVariable ["MAZ_RS_roles_role","Recruit"]) in MAZ_RS_specialRolesList} count (units _group);
				if(_specialCount == 2) exitWith {
					_group setVariable ["MAZ_RS_roles_grpCanHaveSpecial",false,true];
				};
				if(_specialCount > 2) exitWith {
					while {count (_group getVariable ["MAZ_RS_GroupSpecials",[]]) > 2} do {
						private _rolePlayers = _group getVariable "MAZ_RS_GroupSpecials";
						private _removeID = _rolePlayers select (count _rolePlayers - 1);
						private _remove = objNull;
						{
							if(getPlayerUID _x == _removeID) exitWith {
								_remove = _x;
							};
						}forEach allPlayers;
						_rolePlayers deleteAt (count _rolePlayers - 1);
						[_remove,"Rifleman"] call MAZ_RS_fnc_forceSelectRole;
						sleep 0.1;
						_group setVariable ["MAZ_RS_GroupSpecials",_rolePlayers,true];
					};
				};
				_group setVariable ["MAZ_RS_roles_grpCanHaveSpecial",true,true];
			} else {
				_group setVariable ["MAZ_RS_roles_grpCanHaveSpecial",false,true];
			};

			if(_groupCount >= MAZ_RS_MIN_FOR_SUPPORT) then {
				private _supportCount = {isPlayer _x && (_x getVariable ["MAZ_RS_roles_role","Recruit"]) in MAZ_RS_supportRolesList} count (units _group);
				if(_supportCount == 1) exitWith {
					_group setVariable ["MAZ_RS_roles_grpCanHaveSupport",false,true];
				};
				if(_supportCount > 1) exitWith {
					while {count (_group getVariable ["MAZ_RS_GroupSupports",[]]) > 2} do {
						private _rolePlayers = _group getVariable "MAZ_RS_GroupSupports";
						private _removeID = _rolePlayers select (count _rolePlayers - 1);
						private _remove = objNull;
						{
							if(getPlayerUID _x == _removeID) exitWith {
								_remove = _x;
							};
						}forEach allPlayers;
						_rolePlayers deleteAt (count _rolePlayers - 1);
						[_remove,"Rifleman"] call MAZ_RS_fnc_forceSelectRole;
						sleep 0.1;
						_group setVariable ["MAZ_RS_GroupSupports",_rolePlayers,true];
					};
				};
				_group setVariable ["MAZ_RS_roles_grpCanHaveSupport",true,true];
			} else {
				_group setVariable ["MAZ_RS_roles_grpCanHaveSupport",false,true];
			};
			sleep 1;
		};
	};

	MAZ_RS_fnc_roleSystemLoop = {
		private _playerRole = player getVariable ["MAZ_RS_roles_role","Recruit"];
		private _group = group player;
		private _groupCount = -1;
		if(MAZ_RS_LimitVoN) then {
			call MAZ_RS_fnc_adjustVoiceChannels;
		} else {
			call MAZ_RS_fnc_resetVoiceChannels;
		};
		if(MAZ_RS_DebugMode) then {
			_groupCount = count (units _group);
		} else {
			_groupCount = {isPlayer _x} count (units _group);
		};
		private _oldGroup = player getVariable ["MAZ_RS_oldGroup",grpNull];
		if(_group != _oldGroup) then {
			player setVariable ["MAZ_RS_oldGroup",_group];
		};
		if(_groupCount == 1 && _playerRole != "Recruit") exitWith {
			["You're not in a group! You've been set to Recruit. Join a new group.","addItemFailed"] call MAZ_RS_fnc_roleSystemMessage;
			player setVariable ["MAZ_RS_roles_role","Recruit",true];
		};
		if(_group != _oldGroup && _playerRole == "Recruit") then {
			player setVariable ["MAZ_RS_roles_role","Rifleman",true];
			[format ["Welcome to %1! You've been set as a Rifleman.",groupID _group],"addItemOk"] call MAZ_RS_fnc_roleSystemMessage;
		};
		
		if(_playerRole == "Medic") then {
			player setUnitTrait ["Medic", true];
		} else {
			if(player getUnitTrait "Medic") then {
				player setUnitTrait ["Medic", false];
			};
		};
		
		if(_playerRole == "Engineer") then {
			player setUnitTrait ["explosiveSpecialist",true];
			player setUnitTrait ["UAVHacker",true];
		} else {
			if(player getUnitTrait "explosiveSpecialist") then {
				player setUnitTrait ["explosiveSpecialist", false];
			};
			if(player getUnitTrait "UAVHacker") then {
				player setUnitTrait ["UAVHacker", false];
			};
		};

		if(isNil "ZAM_SLRS_active") then {
			if(_playerRole == "Squad Leader") then {
				if(isNil "MAZ_RS_roles_SquadLeaderRespawnPos") then {
					MAZ_RS_roles_SquadLeaderRespawnPos = [_group,player,format ["Squad Leader: %1",name player]] call BIS_fnc_addRespawnPosition;
				};
			} else {
				if(!isNil "MAZ_RS_roles_SquadLeaderRespawnPos") then {
					MAZ_RS_roles_SquadLeaderRespawnPos call BIS_fnc_removeRespawnPosition;
					MAZ_RS_roles_SquadLeaderRespawnPos = nil;
				};
			};
		} else {
			if(!isNil "MAZ_RS_roles_SquadLeaderRespawnPos") then {
				MAZ_RS_roles_SquadLeaderRespawnPos call BIS_fnc_removeRespawnPosition;
				MAZ_RS_roles_SquadLeaderRespawnPos = nil;
			};
		};
		if(_playerRole == "Squad Leader" && (leader _group != player) && lifeState player != "INCAPACITATED") then {
			[group player, player] remoteExec ["selectLeader", groupOwner group player];
		};
		
		if(
			(_playerRole in MAZ_RS_specialRolesList && (_groupCount < MAZ_RS_MIN_FOR_SPECIALIST)) || 
			(_playerRole in MAZ_RS_supportRolesList && (_groupCount < MAZ_RS_MIN_FOR_SUPPORT))
		) then {
			private _isChangedAlready = player getVariable "MAZ_RS_newRoleRespawn";
			if(isNil "_isChangedAlready") then {
				["You don't have enough Squad members to be your role anymore! When you respawn you'll be a rifleman.","addItemFailed"] call MAZ_RS_fnc_roleSystemMessage;
				player setVariable ["MAZ_RS_newRoleRespawn","Rifleman",true];
			};
		};
		call MAZ_RS_fnc_checkEquipmentArsenalClosed;
	};

	MAZ_RS_fnc_handleFirstAidKits = {
		private _playerRole = player getVariable ["MAZ_RS_roles_role","Recruit"];
		private _countFAKs = {_x == "FirstAidKit"} count (items player);
		if(_countFAKs > 3 && _playerRole != "Medic") exitWith {
			for "_i" from 0 to (_countFAKs - 4) do {
				player removeItem "FirstAidKit";
			};
			[format ["%1 FAKs removed, only Medics can carry this much!",_countFAKs - 3],"addItemFailed"] call MAZ_RS_fnc_roleSystemMessage;
		};
		if(_countFAKs > 10 && _playerRole == "Medic") then {
			for "_i" from 0 to (_countFAKs - 11) do {
				player removeItem "FirstAidKit";
			};
			[format ["%1 FAKs removed, the max Medics can carry is 10!",_countFAKs - 10],"addItemFailed"] call MAZ_RS_fnc_roleSystemMessage;
		};
	};

	MAZ_RS_fnc_addRoleEquipmentToCrate = {
		params ["_crate","_role","_side"];
		_role = [_role] call MAZ_RS_fnc_formatRoleName;
		private _variableNameItems = format ["MAZ_RS_%1_%2_%3_Items",_side,worldName,_role];
		private _variableNameWeapons = format ["MAZ_RS_%1_%2_%3_Weapons",_side,worldName,_role];
		private _variableNameMags = format ["MAZ_RS_%1_%2_%3_Mags",_side,worldName,_role];
		private _variableNameBackpack = format ["MAZ_RS_%1_%2_%3_Backpack",_side,worldName,_role];
		private _isCommander = player getVariable ["MAZ_RS_isCommander",false];

		private _var = missionNamespace getVariable _variableNameItems;
		if(!isNil "_var") then {
			[_crate,_var] call BIS_fnc_addVirtualItemCargo;
		};

		_var = missionNamespace getVariable _variableNameWeapons;
		if(!isNil "_var") then {
			[_crate,_var] call BIS_fnc_addVirtualWeaponCargo;
		};

		_var = missionNamespace getVariable _variableNameMags;
		if(!isNil "_var") then {
			private _grenades = ["HandGrenade","MiniGrenade","SmokeShellBlue","SmokeShellGreen","SmokeShellOrange","SmokeShellPurple","SmokeShellRed","SmokeShell","SmokeShellYellow","Chemlight_yellow","Chemlight_red","Chemlight_green","Chemlight_blue","I_IR_Grenade","O_IR_Grenade","I_E_IR_Grenade","B_IR_Grenade","O_R_IR_Grenade"];
			_var = _var + _grenades;
			[_crate,_var] call BIS_fnc_addVirtualMagazineCargo;
		};

		_var = missionNamespace getVariable _variableNameBackpack;
		if(!isNil "_var") then {
			[_crate,_var] call BIS_fnc_addVirtualBackpackCargo;
		};
	};

	MAZ_RS_fnc_disableArsenalLoadExec = {
		with uiNamespace do {
			waitUntil {(!isNull findDisplay -1)};
			_controlBarButtonsIDD = 44046;
			_controlButtonCloseIDC = 44448;
			_controlButtonExportIDC = 44148;
			_controlButtonImportIDC = 44149;
			_controlButtonInterfaceIDC = 44151;
			_controlButtonLoadIDC = 44147;
			_controlButtonOKIDC = 44346;
			_controlButtonRandomIDC = 44150;
			_controlButtonSaveIDC = 44146;
			_display = findDisplay -1;
			waitUntil {(!isNull (_display displayCtrl _controlBarButtonsIDD))};
			_controlBarButtonsGroupParent = _display displayCtrl _controlBarButtonsIDD;
			_controlButtonImport = _display displayCtrl _controlButtonImportIDC;
			_controlButtonLoad = _display displayCtrl _controlButtonLoadIDC;
			_controlButtonRandom = _display displayCtrl _controlButtonRandomIDC;
			
			_controlButtonImport ctrlEnable false;
			_controlButtonLoad ctrlEnable false;
			_controlButtonRandom ctrlEnable false;

			_controlButtonImport ctrlShow false;
			_controlButtonLoad ctrlShow false;
			_controlButtonRandom ctrlShow false;
			
			_controlButtonImport ctrlSetFade 0;
			_controlButtonLoad ctrlSetFade 0;
			_controlButtonRandom ctrlSetFade 0;
			
			_controlButtonImport ctrlSetTooltip '';
			_controlButtonLoad ctrlSetTooltip '';
			_controlButtonRandom ctrlSetTooltip '';
			
			_controlButtonImport ctrlRemoveAllEventHandlers 'onButtonClick'; 
			_controlButtonImport ctrlRemoveAllEventHandlers 'ButtonClick'; 
			_controlButtonImport ctrlRemoveAllEventHandlers 'onButtonDown'; 
			_controlButtonImport ctrlRemoveAllEventHandlers 'ButtonDown'; 
			_controlButtonImport ctrlRemoveAllEventHandlers 'onButtonUp'; 
			_controlButtonImport ctrlRemoveAllEventHandlers 'ButtonUp'; 
			
			_controlButtonLoad ctrlRemoveAllEventHandlers 'onButtonClick'; 
			_controlButtonLoad ctrlRemoveAllEventHandlers 'ButtonClick'; 
			_controlButtonLoad ctrlRemoveAllEventHandlers 'onButtonDown'; 
			_controlButtonLoad ctrlRemoveAllEventHandlers 'ButtonDown'; 
			_controlButtonLoad ctrlRemoveAllEventHandlers 'onButtonUp'; 
			_controlButtonLoad ctrlRemoveAllEventHandlers 'ButtonUp'; 
			
			_controlButtonRandom ctrlRemoveAllEventHandlers 'onButtonClick'; 
			_controlButtonRandom ctrlRemoveAllEventHandlers 'ButtonClick'; 
			_controlButtonRandom ctrlRemoveAllEventHandlers 'onButtonDown'; 
			_controlButtonRandom ctrlRemoveAllEventHandlers 'ButtonDown'; 
			_controlButtonRandom ctrlRemoveAllEventHandlers 'onButtonUp'; 
			_controlButtonRandom ctrlRemoveAllEventHandlers 'ButtonUp'; 
			
			_controlButtonImport ctrlRemoveAllEventHandlers 'onKeyDown'; 
			_controlButtonImport ctrlRemoveAllEventHandlers 'KeyDown'; 
			_controlButtonImport ctrlRemoveAllEventHandlers 'onKeyUp'; 
			_controlButtonImport ctrlRemoveAllEventHandlers 'KeyUp'; 
			
			_controlButtonLoad ctrlRemoveAllEventHandlers 'onKeyDown'; 
			_controlButtonLoad ctrlRemoveAllEventHandlers 'KeyDown'; 
			_controlButtonLoad ctrlRemoveAllEventHandlers 'onKeyUp'; 
			_controlButtonLoad ctrlRemoveAllEventHandlers 'KeyUp'; 
			
			_controlButtonRandom ctrlRemoveAllEventHandlers 'onKeyDown'; 
			_controlButtonRandom ctrlRemoveAllEventHandlers 'KeyDown'; 
			_controlButtonRandom ctrlRemoveAllEventHandlers 'onKeyUp'; 
			_controlButtonRandom ctrlRemoveAllEventHandlers 'KeyUp'; 
			
			_controlButtonImport ctrlCommit 0;
			_controlButtonLoad ctrlCommit 0;
			_controlButtonRandom ctrlCommit 0;
			
			_controlButtonInterface = _display displayCtrl _controlButtonInterfaceIDC;
			_controlButtonInterface ctrlRemoveAllEventHandlers 'onKeyDown'; 
			_controlButtonInterface ctrlRemoveAllEventHandlers 'KeyDown'; 
			_controlButtonInterface ctrlRemoveAllEventHandlers 'onKeyUp'; 
			_controlButtonInterface ctrlRemoveAllEventHandlers 'KeyUp'; 
			_controlButtonInterface ctrlCommit 0;
		};
	};

	MAZ_RS_fnc_formatRoleName = {
		params ["_role"];
		private _result = _role splitString " ";
		_result = _result joinString "_";
		_result
	};

	MAZ_RS_fnc_checkEquipmentArsenalClosed = {
		private _role = player getVariable ["MAZ_RS_roles_role","Recruit"];
		_role = [_role] call MAZ_RS_fnc_formatRoleName;
		private _variableNameItems = format ["MAZ_RS_%1_%2_%3_Items",side (group player),worldName,_role];
		private _variableNameWeapons = format ["MAZ_RS_%1_%2_%3_Weapons",side (group player),worldName,_role];

		private _wereItemsRemoved = false;

		private _var = missionNamespace getVariable _variableNameItems;
		_var = _var + [""];
		if(!(uniform player in _var)) then {
			removeUniform player;
			_wereItemsRemoved = true;
		};
		if(!(vest player in _var)) then {
			removeVest player;
			_wereItemsRemoved = true;
		};
		if(!(headgear player in _var)) then {
			removeHeadgear player;
			_wereItemsRemoved = true;
		};
		if(!(binocular player in _var)) then {
			player removeWeapon (binocular player);
			_wereItemsRemoved = true;
		};
		{
			if(!(_x in _var)) then {
				systemChat (str _x);
				player removeItem _x;
				_wereItemsRemoved = true;
			};
		}forEach (items player);
		{
			if(!(_x in _var)) then {
				systemChat (str _x);
				player unassignitem _x;
				_wereItemsRemoved = true;
			};
		}forEach (assignedItems player);

		_var = missionNamespace getVariable _variableNameWeapons;
		_var pushBack "";
		if(!((primaryWeapon player) in _var)) then {
			player removeWeaponGlobal (primaryWeapon player);
			_wereItemsRemoved = true;
		};
		if(!(secondaryWeapon player in _var)) then {
			player removeWeaponGlobal (secondaryWeapon player);
			_wereItemsRemoved = true;
		};
		if(!(handgunWeapon player in _var)) then {
			player removeWeaponGlobal (handgunWeapon player);
			_wereItemsRemoved = true;
		};

		_var = ["B_Bergen_tna_F","B_Bergen_dgtl_F","B_Bergen_hex_F","B_Bergen_mcamo_F"];
		if(backpack player in _var || backpack player isKindOf "Weapon_Bag_Base") then {
			removeBackpackGlobal player;
			_wereItemsRemoved = true;
		};
		
		if(_wereItemsRemoved) then {
			["Items that weren't available to your role were removed!","addItemFailed"] call MAZ_RS_fnc_roleSystemMessage;
		};
	};

	MAZ_RS_fnc_handleArsenalOpening = {
		params ["_role"];
		sleep 0.1;
		if(_role == "Recruit") exitWith {
			["You're a recruit role! Join a group and choose a role, then you can change your loadout.","addItemFailed"] call MAZ_RS_fnc_roleSystemMessage;
			MAZ_RS_rolesSystemInArsenal = false;
			[] call MAZ_RS_fnc_roleArsenalEH;
		};
		private _itemCrate = "VirtualReammoBox_camonet_F" createVehicleLocal [0,0,0];
		player setVariable ["MAZ_RS_roles_arsenalBox",_itemCrate];
		[_itemCrate,_role,side (group player)] call MAZ_RS_fnc_addRoleEquipmentToCrate;


		[missionNamespace, "arsenalClosed", {
			private _crate = player getVariable "MAZ_RS_roles_arsenalBox";
			deleteVehicle _crate;
			player setVariable ["MAZ_RS_roles_arsenalBox",objNull];
			MAZ_RS_rolesSystemInArsenal = false;
			[] call MAZ_RS_fnc_handleFirstAidKits;
			[missionNamespace, "arsenalClosed", _thisScriptedEventHandler] call BIS_fnc_removeScriptedEventHandler;
			[] call MAZ_RS_fnc_roleArsenalEH;
		}] call BIS_fnc_addScriptedEventHandler;
		["Open",[false,_itemCrate,player]] call BIS_fnc_arsenal;
	};

	MAZ_RS_fnc_roleArsenalEH = {
		if(!isNil "MAZ_RS_rolesSystem_arsenalOpenEH") then {
			[missionNamespace, "arsenalOpened", MAZ_RS_rolesSystem_arsenalOpenEH] call BIS_fnc_removeScriptedEventHandler;
		};
		if(isNil "MAZ_RS_rolesSystemInArsenal") then {
			MAZ_RS_rolesSystemInArsenal = false;
		};
		if(!MAZ_RS_rolesSystemInArsenal) then {
			MAZ_RS_rolesSystem_arsenalOpenEH = [missionNamespace, "arsenalOpened", {
				params ["_display", "_toggleSpace"];
				MAZ_RS_rolesSystemInArsenal = true;
				_display closeDisplay 0;
				private _changeRole = player getVariable "MAZ_RS_newRoleRespawn";
				if(!isNil "_changeRole") then {
					player setVariable ["MAZ_RS_roles_role",_changeRole,true];
					player setVariable ["MAZ_RS_newRoleRespawn",nil,true];
					[_changeRole] call MAZ_RS_fnc_randomFromEquipment;
					[format ["Your role change to %1 has taken effect.",_changeRole],"addItemOk"] call MAZ_RS_fnc_roleSystemMessage;
				};
				[missionNamespace, "arsenalOpened", _thisScriptedEventHandler] call BIS_fnc_removeScriptedEventHandler;
				[player getVariable "MAZ_RS_roles_role"] spawn MAZ_RS_fnc_handleArsenalOpening;
			}] call BIS_fnc_addScriptedEventHandler;
		};
	};

	MAZ_RS_fnc_roleSystemInitLoop = {
		[] call MAZ_RS_fnc_roleArsenalEH;
		while {MAZ_RS_enabled} do {
			[] spawn MAZ_RS_fnc_roleSystemLoop;
			sleep 1;
		};
	};

	MAZ_RS_fnc_updateRolesSystemMenu = {
		private _rolesListBox = uiNamespace getVariable 'rolesListBox';
		private _rolesDescriptionLabel = uiNamespace getVariable 'rolesDescriptionLabel';
		private _rolesDescriptionBox = uiNamespace getVariable 'rolesDescriptionText';
		private _rolesImage = uiNamespace getVariable 'rolesDescriptionImage';
		{
			_x params ["_roleName","_roleDescription",["_roleImage",""]];
			private _index = _rolesListBox lbAdd _roleName;
			_rolesListBox lbSetPicture [_index,_roleImage];
			if(_roleName in MAZ_RS_specialRolesList) then {
				comment "[0,0.8,0,1]";
				_rolesListBox lbSetColor [_index,[0.06,0.61,0.21,1]];
			};
			if(_roleName in MAZ_RS_supportRolesList) then {
				comment "[0,0.5,0.5,1]";
				_rolesListBox lbSetColor [_index,[0.06,0.47,0.61,1]];
			};
		}forEach MAZ_RS_rolesDescriptions;
		_rolesListBox lbSetColor [0,[0.8,0,0,1]];

		private _playerRole = player getVariable ["MAZ_RS_roles_role","Recruit"];
		_rolesListBox lbSetCurSel (MAZ_RS_rolesList find _playerRole);
		private _selectedRole = MAZ_RS_rolesDescriptions select (MAZ_RS_rolesList find _playerRole);
		_selectedRole params ["_roleName","_roleDescription",["_roleImage",""]];
		_rolesDescriptionLabel ctrlSetText _roleName;
		_rolesDescriptionBox ctrlSetStructuredText parseText _roleDescription;
		_rolesImage ctrlSetText _roleImage;
		
		_rolesListBox ctrlAddEventHandler ["LBSelChanged",{
			params ["_control", "_selectedIndex"];
			private _rolesDescriptionLabel = uiNamespace getVariable 'rolesDescriptionLabel';
			private _rolesDescriptionBox = uiNamespace getVariable 'rolesDescriptionText';
			private _rolesImage = uiNamespace getVariable 'rolesDescriptionImage';

			private _selectedRole = MAZ_RS_rolesDescriptions select _selectedIndex;
			_selectedRole params ["_roleName","_roleDescription",["_roleImage",""]];
			_rolesDescriptionLabel ctrlSetText _roleName;
			_rolesDescriptionBox ctrlSetStructuredText parseText _roleDescription;
			_rolesImage ctrlSetText _roleImage;
		}];

		while {!isNull (uiNamespace getVariable 'MAZ_RS_rolesSystemMenu')} do {
			private _group = group player;
			private _groupCount = 0;
			if(MAZ_RS_DebugMode) then {
				_groupCount = count (units _group);
			} else {
				_groupCount = {isPlayer _x} count (units _group);
			};
			(uiNamespace getVariable 'rolesMenuGroupInfo') ctrlSetStructuredText parseText format ["<t size='0.15'>&#160;</t><br/>%1<t align='center'>:</t><t align='right'>%2 Member(s)</t>",groupID _group,_groupCount];
			private _specialCheckbox = uiNamespace getVariable 'rolesMenuCheckboxSpecial';
			if(_group getVariable ["MAZ_RS_roles_grpCanHaveSpecial",true]) then {
				_specialCheckbox cbSetChecked true;
				_specialCheckbox ctrlSetTooltip "Specialist roles are available.";
			} else {
				_specialCheckbox cbSetChecked false;
				_specialCheckbox ctrlSetTooltip "Specialist roles are NOT available.";
			};
			private _supportCheckbox = uiNamespace getVariable 'rolesMenuCheckboxSupport';
			if(_group getVariable ["MAZ_RS_roles_grpCanHaveSupport",true]) then {
				_supportCheckbox cbSetChecked true;
				_supportCheckbox ctrlSetTooltip "Support roles are available.";
			} else {
				_supportCheckbox cbSetChecked false;
				_supportCheckbox ctrlSetTooltip "Support roles are NOT available.";
			};
			private _squadLeadCheckbox = uiNamespace getVariable 'rolesMenuCheckboxSL';
			if(_group getVariable ["MAZ_RS_roles_grpCanHaveSL",true]) then {
				_squadLeadCheckbox cbSetChecked true;
				_squadLeadCheckbox ctrlSetTooltip "Support roles are available.";
			} else {
				_squadLeadCheckbox cbSetChecked false;
				_squadLeadCheckbox ctrlSetTooltip "Support roles are NOT available.";
			};

			private _membersList = uiNamespace getVariable 'rolesMenuGroupMembersList';
			lbClear _membersList;
			{
				private _name = name _x;
				private _role = _x getVariable ["MAZ_RS_roles_role","Recruit"];
				private _isCommander = _x getVariable ["MAZ_RS_isCommander",false];
				if(!isPlayer _x) then {_role = getText (configfile >> "CfgVehicles" >> typeOf _x >> "displayName"); _name = _name + " (AI)"};
				if(_isCommander) then {
					private _index = _membersList lbAdd (format ["%1 - Ground Comm.",_name]);
					_membersList lbSetPictureRight [_index,"\A3\Ui_f\data\GUI\Cfg\Ranks\captain_gs.paa"];
					continue;
				};
				private _index = _membersList lbAdd (format ["%1 - %2",_name,_role]);
				private _findRole = MAZ_RS_rolesList find _role;
				if(_findRole >= 0) then {
					private _selectedRole = MAZ_RS_rolesDescriptions select (MAZ_RS_rolesList find _role);
					_selectedRole params ["_roleName","_roleDescription",["_roleImage",""]];
					_membersList lbSetPictureRight [_index,_roleImage];
				} else {
					private _selectedRole = MAZ_RS_rolesDescriptions select (MAZ_RS_rolesList find "Recruit");
					_selectedRole params ["_roleName","_roleDescription",["_roleImage",""]];
					_membersList lbSetPictureRight [_index,_roleImage];
				};
			}forEach (units _group);
			_membersList lbAdd " ";
			_membersList lbAdd " ";
			_membersList lbAdd " ";
			_membersList lbAdd " ";
			_membersList lbAdd " ";
			sleep 1;
		};
	};

	MAZ_RS_fnc_forceSelectRole = {
		params ["_unit","_role"];
		_unit setVariable ["MAZ_RS_roles_role",_role,true];
		[_role,{
			[format ["Role changed to %1!",_this],"addItemOk"] call MAZ_RS_fnc_roleSystemMessage;
		}] remoteExec ['spawn',_unit];
	};

	MAZ_RS_fnc_selectRole = {
		params ["_index"];
		if(_index <= 0) exitWith {};
		private _group = group player;
		private _selectedRole = (MAZ_RS_rolesDescriptions select _index) select 0;
		private _currentRole = player getVariable "MAZ_RS_roles_role";
		private _isChanged = player getVariable "MAZ_RS_newRoleRespawn";
		private _isChangedLoadout = false;
		private _isDifferentSide = false;

		if(_currentRole in MAZ_RS_specialRolesList && (!(_selectedRole in MAZ_RS_specialRolesList) && !(_selectedRole in MAZ_RS_supportRolesList))) then {
			private _specials = _group getVariable ["MAZ_RS_GroupSpecials",[]];
			_specials deleteAt (_specials find (getPlayerUID player));
			_group setVariable ["MAZ_RS_GroupSpecials",_specials,true];
		};
		if(_currentRole in MAZ_RS_supportRolesList && (!(_selectedRole in MAZ_RS_specialRolesList) && !(_selectedRole in MAZ_RS_supportRolesList))) then {
			private _supports = _group getVariable ["MAZ_RS_GroupSupports",[]];
			_supports deleteAt (_supports find (getPlayerUID player));
			_group setVariable ["MAZ_RS_GroupSupports",_supports,true];
		};
		if(_currentRole == "Medic" && !(_selectedRole != "Medic")) then {
			private _medics = _group getVariable ["MAZ_RS_GroupMedics",[]];
			_medics deleteAt (_medics find (getPlayerUID player));
			_group setVariable ["MAZ_RS_GroupMedics",_medics,true];
		};
		if(_currentRole == "Engineer" && !(_selectedRole != "Engineer")) then {
			private _engineers = _group getVariable ["MAZ_RS_GroupEngineers",[]];
			_engineers deleteAt (_engineers find (getPlayerUID player));
			_group setVariable ["MAZ_RS_GroupEngineers",_engineers,true];
		};
		if(_currentRole == "Squad Leader" && !(_selectedRole != "Squad Leader")) then {
			private _sls = _group getVariable ["MAZ_RS_GroupSL",[]];
			_sls deleteAt (_sls find (getPlayerUID player));
			_group setVariable ["MAZ_RS_GroupSL",_sls,true];
		};

		if(!isNil "_isChanged" && _selectedRole == _currentRole) exitWith {
			if((_group getVariable ["MAZ_RS_roles_grpCanHaveSpecial",false] || _currentRole in MAZ_RS_specialRolesList) && _currentRole in MAZ_RS_specialRolesList) then {
				player setVariable ["MAZ_RS_newRoleRespawn",nil,true];
				[format ["Role changed to %1!",_selectedRole],"addItemOk"] call MAZ_RS_fnc_roleSystemMessage;
			};
			if((_group getVariable ["MAZ_RS_roles_grpCanHaveSupport",false] || _currentRole in MAZ_RS_supportRolesList) && _currentRole in MAZ_RS_supportRolesList) then {
				player setVariable ["MAZ_RS_newRoleRespawn",nil,true];
				[format ["Role changed to %1!",_selectedRole],"addItemOk"] call MAZ_RS_fnc_roleSystemMessage;
			};
		};

		if(isNil "MAZ_RS_roles_oldSide") then {
			MAZ_RS_roles_oldSide = side (group player);
		};
		if(MAZ_RS_roles_oldSide != side (group player)) then {
			_isDifferentSide = true;
		};
		MAZ_RS_roles_oldSide = side (group player);
		if(_selectedRole == _currentRole) exitWith {
			["You already have this role!","addItemFailed"] call MAZ_RS_fnc_roleSystemMessage;
		};
		if(_selectedRole in MAZ_RS_specialRolesList) then {
			if(_group getVariable ["MAZ_RS_roles_grpCanHaveSpecial",false] || _currentRole in MAZ_RS_specialRolesList) then {
				player setVariable ["MAZ_RS_roles_role",_selectedRole,true];
				[format ["Role changed to %1!",_selectedRole],"addItemOk"] call MAZ_RS_fnc_roleSystemMessage;
				private _specials = _group getVariable ["MAZ_RS_GroupSpecials",[]];
				_specials pushBack (getPlayerUID player);
				_group setVariable ["MAZ_RS_GroupSpecials",_specials,true];
				_isChangedLoadout = true;
			} else {
				["You cannot select this specialist role!","addItemFailed"] call MAZ_RS_fnc_roleSystemMessage;
			};
		};
		if(_selectedRole in MAZ_RS_supportRolesList) then {
			if(_group getVariable ["MAZ_RS_roles_grpCanHaveSupport",false] || _currentRole in MAZ_RS_supportRolesList) then {
				player setVariable ["MAZ_RS_roles_role",_selectedRole,true];
				[format ["Role changed to %1!",_selectedRole],"addItemOk"] call MAZ_RS_fnc_roleSystemMessage;
				private _supports = _group getVariable ["MAZ_RS_GroupSupports",[]];
				_supports pushBack (getPlayerUID player);
				_group setVariable ["MAZ_RS_GroupSupports",_supports,true];
				_isChangedLoadout = true;
			} else {
				["You cannot select this support role!","addItemFailed"] call MAZ_RS_fnc_roleSystemMessage;
			};
		};
		if(_selectedRole == "Squad Leader") then {
			if(_group getVariable ["MAZ_RS_roles_grpCanHaveSL",false]) then {
				player setVariable ["MAZ_RS_roles_role",_selectedRole,true];
				[format ["Role changed to %1!",_selectedRole],"addItemOk"] call MAZ_RS_fnc_roleSystemMessage;
				private _squadLeader = _group getVariable ["MAZ_RS_GroupSL",[]];
				_squadLeader pushBack (getPlayerUID player);
				_group setVariable ["MAZ_RS_GroupSL",_squadLeader,true];
				_isChangedLoadout = true;
			} else {
				["You cannot select this Squad Leader role!","addItemFailed"] call MAZ_RS_fnc_roleSystemMessage;
			};
		};
		if(_selectedRole == "Medic") then {
			if(_group getVariable ["MAZ_RS_roles_grpCanHaveMedic",false]) then {
				player setVariable ["MAZ_RS_roles_role",_selectedRole,true];
				[format ["Role changed to %1!",_selectedRole],"addItemOk"] call MAZ_RS_fnc_roleSystemMessage;
				private _medics = _group getVariable ["MAZ_RS_GroupMedics",[]];
				_medics pushBack (getPlayerUID player);
				_group setVariable ["MAZ_RS_GroupMedics",_medics,true];
				_isChangedLoadout = true;
			} else {
				["You cannot select this medic role!","addItemFailed"] call MAZ_RS_fnc_roleSystemMessage;
			};
		};
		if(_selectedRole == "Engineer") then {
			if(_group getVariable ["MAZ_RS_roles_grpCanHaveEngineer",false]) then {
				player setVariable ["MAZ_RS_roles_role",_selectedRole,true];
				[format ["Role changed to %1!",_selectedRole],"addItemOk"] call MAZ_RS_fnc_roleSystemMessage;
				private _engineers = _group getVariable ["MAZ_RS_GroupEngineers",[]];
				_engineers pushBack (getPlayerUID player);
				_group setVariable ["MAZ_RS_GroupEngineers",_engineers,true];
				_isChangedLoadout = true;
			} else {
				["You cannot select this engineer role!","addItemFailed"] call MAZ_RS_fnc_roleSystemMessage;
			};
		};
		if(!(_selectedRole in (MAZ_RS_specialRolesList + MAZ_RS_supportRolesList + ["Squad Leader", "Medic"]))) then {
			player setVariable ["MAZ_RS_roles_role",_selectedRole,true];
			[format ["Role changed to %1!",_selectedRole],"addItemOk"] call MAZ_RS_fnc_roleSystemMessage;
			_isChangedLoadout = true;
		};
		if((MAZ_RS_isRecentSpawn && _isChangedLoadout) || _isDifferentSide) then {
			[_selectedRole] call MAZ_RS_fnc_randomFromEquipment;
		} else {
			if(_isChangedLoadout) then {
				["Changes to roles will take effect next time you enter the arsenal or respawn."] call MAZ_RS_fnc_roleSystemMessage;
				player setVariable ["MAZ_RS_roles_role",_currentRole,true];
				player setVariable ["MAZ_RS_newRoleRespawn",_selectedRole,true];
			};
		};
	};

	MAZ_RS_fnc_resetGroupMember = {
		params ["_index"];
		private _role = player getVariable ["MAZ_RS_roles_role","Recruit"];
		if(_role != "Squad Leader") exitWith {["Only Squad Leaders can use this button!","addItemFailed"] call MAZ_RS_fnc_roleSystemMessage;};
		if(_index < 0) exitWith {};
		private _unit = (units (group player)) select _index;
		[[],{
			[1] call MAZ_RS_fnc_selectRole;
		}] remoteExec ['spawn',_unit];
	};

	MAZ_RS_fnc_changeGroupMemberRole = {
		params ["_indexUnit","_indexRole"];
		private _role = player getVariable ["MAZ_RS_roles_role","Recruit"];
		if(_role != "Squad Leader") exitWith {["Only Squad Leaders can use this button!","addItemFailed"] call MAZ_RS_fnc_roleSystemMessage;};
		if(_indexUnit < 0 || _indexRole < 0) exitWith {};
		private _unit = (units (group player)) select _indexUnit;
		[_indexRole,{
			[_this] call MAZ_RS_fnc_selectRole;
		}] remoteExec ['spawn',_unit];
	};

	MAZ_RS_fnc_rolesSystemMenu = {
		disableSerialization;
		uiNamespace setVariable ['MAZ_RS_rolesSystemMenu',displayNull];
		switch (side (group player)) do {
			case west: {uiNamespace setVariable ["MAZ_RS_rolesMenuBackground","#(argb,8,8,3)color(0,0,0.1,0.5)"]};
			case east: {uiNamespace setVariable ["MAZ_RS_rolesMenuBackground","#(argb,8,8,3)color(0.1,0,0,0.5)"]};
			case independent: {uiNamespace setVariable ["MAZ_RS_rolesMenuBackground","#(argb,8,8,3)color(0,0.1,0,0.5)"]};
			case civilian: {uiNamespace setVariable ["MAZ_RS_rolesMenuBackground","#(argb,8,8,3)color(0.1,0,0.1,0.5)"]};
		};
		with uiNamespace do {
			GUI_GRID_H = ((((safeZoneW / safeZoneH) min 1.2) / 1.2) / 25);
			MAZ_RS_rolesSystemMenu = (findDisplay 46) createDisplay "RscDisplayEmpty";
			MAZ_RS_rolesSystemMenu displayAddEventHandler ["Unload", {
				uiNamespace setVariable ['MAZ_RS_rolesSystemMenu',displayNull];
			}];

			comment "Visuals";

				if(missionNamespace getVariable ["MAZ_RS_DebugMode",false]) then {
					_rolesDebugLabel = MAZ_RS_rolesSystemMenu ctrlCreate ["RscActiveText", -1];
					_rolesDebugLabel ctrlSetText "!! DEBUG MODE !!";
					_rolesDebugLabel ctrlSetTextColor [0,1,0,1];
					_rolesDebugLabel ctrlSetActiveColor [0,0.7,0,1];
					_rolesDebugLabel ctrlSetBackgroundColor [0,0,0,0.6];
					_rolesDebugLabel ctrlSetTooltip "Click me to disable DEBUG MODE.";
					_rolesDebugLabel ctrlSetPosition [0.371093 * safezoneW + safezoneX,0.269 * safezoneH + safezoneY,0.0670312 * safezoneW,0.022 * safezoneH];
					_rolesDebugLabel ctrlAddEventhandler ["ButtonClick", {
						params ["_control"];
						MAZ_RS_DebugMode = false;
						_control ctrlShow false;
					}];
					_rolesDebugLabel ctrlCommit 0;
				};

				_roleMenuFrame = MAZ_RS_rolesSystemMenu ctrlCreate ["RscFrame", 1800];
				_roleMenuFrame ctrlSetPosition [0.371094 * safezoneW + safezoneX, 0.291 * safezoneH + safezoneY, 0.257813 * safezoneW, 0.429 * safezoneH];
				_roleMenuFrame ctrlCommit 0;

				_roleMenuBG = MAZ_RS_rolesSystemMenu ctrlCreate ["RscPicture", 1200];
				_roleMenuBG ctrlSetText MAZ_RS_rolesMenuBackground;
				_roleMenuBG ctrlSetPosition [0.371094 * safezoneW + safezoneX, 0.291 * safezoneH + safezoneY, 0.257813 * safezoneW, 0.429 * safezoneH];
				_roleMenuBG ctrlCommit 0;

				_rolesListLabelText = MAZ_RS_rolesSystemMenu ctrlCreate ["RscText", 1000];
				_rolesListLabelText ctrlSetText "Roles:";
				_rolesListLabelText ctrlSetPosition [0.381406 * safezoneW + safezoneX, 0.368 * safezoneH + safezoneY, 0.0773437 * safezoneW, 0.022 * safezoneH];
				_rolesListLabelText ctrlCommit 0;

				_roleListFrame = MAZ_RS_rolesSystemMenu ctrlCreate ["RscFrame", 1801];
				_roleListFrame ctrlSetPosition [0.37625 * safezoneW + safezoneX, 0.357 * safezoneH + safezoneY, 0.0928125 * safezoneW, 0.209 * safezoneH];
				_roleListFrame ctrlCommit 0;

				_roleDescriptionFrame = MAZ_RS_rolesSystemMenu ctrlCreate ["RscFrame", 1802];
				_roleDescriptionFrame ctrlSetPosition [0.474219 * safezoneW + safezoneX, 0.357 * safezoneH + safezoneY, 0.149531 * safezoneW, 0.209 * safezoneH];
				_roleDescriptionFrame ctrlCommit 0;

				_rolesMenuGroupFrame = MAZ_RS_rolesSystemMenu ctrlCreate ["RscFrame", 1803];
				_rolesMenuGroupFrame ctrlSetPosition [0.37625 * safezoneW + safezoneX, 0.302 * safezoneH + safezoneY, 0.2475 * safezoneW, 0.044 * safezoneH];
				_rolesMenuGroupFrame ctrlCommit 0;

				_rolesMenuGroupMembersFrame = MAZ_RS_rolesSystemMenu ctrlCreate ["RscFrame", 1804];
				_rolesMenuGroupMembersFrame ctrlSetPosition [0.37625 * safezoneW + safezoneX, 0.577 * safezoneH + safezoneY, 0.134062 * safezoneW, 0.132 * safezoneH];
				_rolesMenuGroupMembersFrame ctrlCommit 0;

				_rolesMenuGroupMembersLabel = MAZ_RS_rolesSystemMenu ctrlCreate ["RscText", 1002];
				_rolesMenuGroupMembersLabel ctrlSetText "Group Members and Roles:";
				_rolesMenuGroupMembersLabel ctrlSetPosition [0.381406 * safezoneW + safezoneX, 0.588 * safezoneH + safezoneY, 0.12375 * safezoneW, 0.022 * safezoneH];
				_rolesMenuGroupMembersLabel ctrlCommit 0;

				_rolesMenuCanHaveSpecialFrame = MAZ_RS_rolesSystemMenu ctrlCreate ["RscFrame", 1805];
				_rolesMenuCanHaveSpecialFrame ctrlSetPosition [0.515469 * safezoneW + safezoneX, 0.577 * safezoneH + safezoneY, 0.108281 * safezoneW, 0.132 * safezoneH];
				_rolesMenuCanHaveSpecialFrame ctrlCommit 0;

				_rolesMenuCanHaveSpecialLabel = MAZ_RS_rolesSystemMenu ctrlCreate ["RscText", 1003];
				_rolesMenuCanHaveSpecialLabel ctrlSetText "Specialists Available:";
				_rolesMenuCanHaveSpecialLabel ctrlSetPosition [0.515469 * safezoneW + safezoneX, 0.643 * safezoneH + safezoneY, 0.103125 * safezoneW, 0.022 * safezoneH];
				_rolesMenuCanHaveSpecialLabel ctrlCommit 0;

				_rolesMenuCanHaveSupportLabel = MAZ_RS_rolesSystemMenu ctrlCreate ["RscText", 1004];
				_rolesMenuCanHaveSupportLabel ctrlSetText "Supports Available:";
				_rolesMenuCanHaveSupportLabel ctrlSetPosition [0.515469 * safezoneW + safezoneX, 0.676 * safezoneH + safezoneY, 0.108281 * safezoneW, 0.022 * safezoneH];
				_rolesMenuCanHaveSupportLabel ctrlCommit 0;

				_rolesMenuCanHaveSpecialLabelTop = MAZ_RS_rolesSystemMenu ctrlCreate ["RscStructuredText", 1102];
				_rolesMenuCanHaveSpecialLabelTop ctrlSetStructuredText parseText "Special Roles Status:";
				_rolesMenuCanHaveSpecialLabelTop ctrlSetPosition [0.515469 * safezoneW + safezoneX, 0.577 * safezoneH + safezoneY, 0.108281 * safezoneW, 0.033 * safezoneH];
				_rolesMenuCanHaveSpecialLabelTop ctrlSetTextColor [1,1,1,1];
				_rolesMenuCanHaveSpecialLabelTop ctrlSetBackgroundColor [0,0,0,0];
				_rolesMenuCanHaveSpecialLabelTop ctrlSetFontHeight 1.2 * GUI_GRID_H;
				_rolesMenuCanHaveSpecialLabelTop ctrlCommit 0;

				_rolesMenuCanHaveSquadLeadLabel = MAZ_RS_rolesSystemMenu ctrlCreate ["RscText", 1005];
				_rolesMenuCanHaveSquadLeadLabel ctrlSetText "Squad Lead Available:";
				_rolesMenuCanHaveSquadLeadLabel ctrlSetPosition [0.515469 * safezoneW + safezoneX, 0.61 * safezoneH + safezoneY, 0.103125 * safezoneW, 0.022 * safezoneH];
				_rolesMenuCanHaveSquadLeadLabel ctrlCommit 0;

			comment "Active Elements";

				comment "Group Info";

					rolesMenuGroupInfo = MAZ_RS_rolesSystemMenu ctrlCreate ["RscStructuredText", 1101];
					rolesMenuGroupInfo ctrlSetStructuredText parseText "";
					rolesMenuGroupInfo ctrlSetPosition [0.37625 * safezoneW + safezoneX, 0.302 * safezoneH + safezoneY, 0.2475 * safezoneW, 0.044 * safezoneH];
					rolesMenuGroupInfo ctrlSetTextColor [1,1,1,1];
					rolesMenuGroupInfo ctrlSetBackgroundColor [0,0,0,0];
					rolesMenuGroupInfo ctrlSetFontHeight 1.5 * GUI_GRID_H;
					rolesMenuGroupInfo ctrlCommit 0;

				comment "Roles Info";

					rolesListBox = MAZ_RS_rolesSystemMenu ctrlCreate ["RscListbox", 1500];
					rolesListBox ctrlSetPosition [0.381406 * safezoneW + safezoneX, 0.39 * safezoneH + safezoneY, 0.0825 * safezoneW, 0.165 * safezoneH];
					rolesListBox ctrlSetActiveColor [0,0,0,1];
					rolesListBox ctrlAddEventHandler ["MouseButtonDblClick",{	
						[lbCurSel (uiNamespace getVariable "rolesListBox")] spawn MAZ_RS_fnc_selectRole;
					}];
					rolesListBox ctrlCommit 0;

					rolesDescriptionText = MAZ_RS_rolesSystemMenu ctrlCreate ["RscStructuredText", 1100];
					rolesDescriptionText ctrlSetStructuredText parseText "";
					rolesDescriptionText ctrlSetPosition [0.479375 * safezoneW + safezoneX, 0.445 * safezoneH + safezoneY, 0.139219 * safezoneW, 0.11 * safezoneH];
					rolesDescriptionText ctrlSetTextColor [1,1,1,1];
					rolesDescriptionText ctrlSetBackgroundColor [0,0,0,0];
					rolesDescriptionText ctrlCommit 0;

					rolesDescriptionImage = MAZ_RS_rolesSystemMenu ctrlCreate ["RscPicture", 1201];
					rolesDescriptionImage ctrlSetText "";
					rolesDescriptionImage ctrlSetPosition [0.479375 * safezoneW + safezoneX, 0.368 * safezoneH + safezoneY, 0.0360937 * safezoneW, 0.066 * safezoneH];
					rolesDescriptionImage ctrlCommit 0;

					rolesDescriptionLabel = MAZ_RS_rolesSystemMenu ctrlCreate ["RscText", 1001];
					rolesDescriptionLabel ctrlSetText "";
					rolesDescriptionLabel ctrlSetPosition [0.515469 * safezoneW + safezoneX, 0.379 * safezoneH + safezoneY, 0.103125 * safezoneW, 0.044 * safezoneH];
					rolesDescriptionLabel ctrlSetFontHeight 1.5 * GUI_GRID_H;
					rolesDescriptionLabel ctrlCommit 0;

				comment "Group Members";

					rolesMenuGroupMembersList = MAZ_RS_rolesSystemMenu ctrlCreate ["RscListbox", 1501];
					rolesMenuGroupMembersList ctrlSetPosition [0.381406 * safezoneW + safezoneX, 0.61 * safezoneH + safezoneY, 0.12375 * safezoneW, 0.088 * safezoneH];
					rolesMenuGroupMembersList ctrlCommit 0;

				comment "Role Availability";

					rolesMenuCheckboxSupport = MAZ_RS_rolesSystemMenu ctrlCreate ["RscCheckbox", 2800];
					rolesMenuCheckboxSupport ctrlSetPosition [0.608281 * safezoneW + safezoneX, 0.676 * safezoneH + safezoneY, 0.0103125 * safezoneW, 0.022 * safezoneH];
					rolesMenuCheckboxSupport ctrlEnable false;
					rolesMenuCheckboxSupport ctrlSetDisabledColor [0.06,0.47,0.61,1];
					rolesMenuCheckboxSupport ctrlCommit 0;

					rolesMenuCheckboxSpecial = MAZ_RS_rolesSystemMenu ctrlCreate ["RscCheckbox", 2801];
					rolesMenuCheckboxSpecial ctrlSetPosition [0.608281 * safezoneW + safezoneX, 0.643 * safezoneH + safezoneY, 0.0103125 * safezoneW, 0.022 * safezoneH];
					rolesMenuCheckboxSpecial ctrlEnable false;
					rolesMenuCheckboxSpecial ctrlSetDisabledColor [0.06,0.61,0.21,1];
					rolesMenuCheckboxSpecial ctrlCommit 0;

					rolesMenuCheckboxSL = MAZ_RS_rolesSystemMenu ctrlCreate ["RscCheckbox", 2802];
					rolesMenuCheckboxSL ctrlSetPosition [0.608281 * safezoneW + safezoneX, 0.61 * safezoneH + safezoneY, 0.0103125 * safezoneW, 0.022 * safezoneH];
					rolesMenuCheckboxSL ctrlEnable false;
					rolesMenuCheckboxSL ctrlSetDisabledColor [1,1,1,1];
					rolesMenuCheckboxSL ctrlCommit 0;

				comment "Menu Buttons";

					rolesMenuSelectRoleButton = MAZ_RS_rolesSystemMenu ctrlCreate ["RscButton", 1600];
					rolesMenuSelectRoleButton ctrlSetText "Select Role";
					rolesMenuSelectRoleButton ctrlSetPosition [0.572187 * safezoneW + safezoneX,0.7255 * safezoneH + safezoneY,0.0567187 * safezoneW,0.022 * safezoneH];
					rolesMenuSelectRoleButton ctrlSetBackgroundColor [0,0,0,0.8];
					rolesMenuSelectRoleButton ctrlAddEventHandler ["ButtonClick",{
						[lbCurSel (uiNamespace getVariable "rolesListBox")] spawn MAZ_RS_fnc_selectRole;
					}];
					rolesMenuSelectRoleButton ctrlCommit 0;

					rolesMenuCancelButton = MAZ_RS_rolesSystemMenu ctrlCreate ["RscButton", 1601];
					rolesMenuCancelButton ctrlSetText "Cancel";
					rolesMenuCancelButton ctrlSetPosition [0.371094 * safezoneW + safezoneX,0.7255 * safezoneH + safezoneY,0.0567187 * safezoneW,0.022 * safezoneH];
					rolesMenuCancelButton ctrlSetBackgroundColor [0,0,0,0.8];
					rolesMenuCancelButton ctrlAddEventHandler ["ButtonClick",{
						with uiNamespace do {MAZ_RS_rolesSystemMenu closeDisplay 0;};
					}];
					rolesMenuCancelButton ctrlCommit 0;

					rolesMenuSetToRiflemanButton = MAZ_RS_rolesSystemMenu ctrlCreate ["RscButton", 1602];
					rolesMenuSetToRiflemanButton ctrlSetText "Reset";
					rolesMenuSetToRiflemanButton ctrlSetPosition [0.438125 * safezoneW + safezoneX,0.7255 * safezoneH + safezoneY,0.0567187 * safezoneW,0.022 * safezoneH];
					rolesMenuSetToRiflemanButton ctrlSetBackgroundColor [0,0,0,0.8];
					rolesMenuSetToRiflemanButton ctrlSetTooltip "**Squad Leader Only**\nResets the selected group member to a rifleman role.";
					rolesMenuSetToRiflemanButton ctrlAddEventHandler ["ButtonClick",{
						[lbCurSel (uiNamespace getVariable "rolesMenuGroupMembersList")] spawn MAZ_RS_fnc_resetGroupMember;
					}];
					rolesMenuSetToRiflemanButton ctrlCommit 0;

					rolesMenuSwapButton = MAZ_RS_rolesSystemMenu ctrlCreate ["RscButton", 1603];
					rolesMenuSwapButton ctrlSetText "Swap";
					rolesMenuSwapButton ctrlSetPosition [0.505156 * safezoneW + safezoneX,0.7255 * safezoneH + safezoneY,0.0567187 * safezoneW,0.022 * safezoneH];
					rolesMenuSwapButton ctrlSetBackgroundColor [0,0,0,0.8];
					rolesMenuSwapButton ctrlSetTooltip "**Squad Leader Only**\nSwaps the selected group member to the selected role (If available).";
					rolesMenuSwapButton ctrlAddEventHandler ["ButtonClick",{
						[lbCurSel (uiNamespace getVariable "rolesMenuGroupMembersList"),lbCurSel (uiNamespace getVariable "rolesListBox")] spawn MAZ_RS_fnc_changeGroupMemberRole;
					}];
					rolesMenuSwapButton ctrlCommit 0;
		};
		[] spawn MAZ_RS_fnc_updateRolesSystemMenu;
	};

	fn_isUnitCopilot = {
		if(vehicle _this == _this) exitWith {false};

		private ["_veh", "_cfg", "_trts", "_return", "_trt"];
		_veh = (vehicle _this);
		_cfg = configFile >> "CfgVehicles" >> typeOf(_veh);
		_trts = _cfg >> "turrets";
		_return = false;

		for "_i" from 0 to (count _trts - 1) do {
			_trt = _trts select _i;

			if(getNumber(_trt >> "iscopilot") == 1) exitWith {
				_return = (_veh turretUnit [_i] == _this);
			};
		};

		_return
	};

	MAZ_RS_fnc_dropWeapon = {
		params ["_container","_weaponType","_weaponData"];
		comment "Get weapons list";
		private _role = _unit getVariable ["MAZ_RS_roles_role","Recruit"];
		_role = [_role] call MAZ_RS_fnc_formatRoleName;
		private _variableNameWeapons = format ["MAZ_RS_%1_%2_%3_Weapons",side (group _unit),worldName,_role];
		private _weaponsList = missionNamespace getVariable _variableNameWeapons;

		comment "Check for if theres a weapon in the container you can take";
		private _weaponsInContainer = (getWeaponCargo _container) select 0;
		private _weaponInContainer = "";
		{
			if(_x in _weaponsList) exitWith {
				_weaponInContainer = _x;
			};
		}forEach _weaponsInContainer;

		comment 'systemChat format ["Weapon Found: %1",_weaponInContainer]';

		comment "If there is take it, otherwise drop yours.";
		if(_weaponInContainer == "") then {
			private _wepHolder = createVehicle ["WeaponHolderSimulated",getPos _container,[],0,"CAN_COLLIDE"];
			_wepHolder addWeaponWithAttachmentsCargoGlobal [_weaponData,1];
			player removeWeaponGlobal _weaponType;
		} else {
			if(_weaponInContainer in _weaponsList) then {
				player action ["TakeWeapon",_container,_weaponInContainer];
			};
		};
	};

	MAZ_RS_fnc_dropItem = {
		params ["_container","_item"];
		if(isNull _container) then {
			private _wepHolder = createVehicle ["WeaponHolderSimulated",getPos _container,[],0,"CAN_COLLIDE"];
			_wepHolder addItemCargoGlobal [_item,1];
		} else {
			_container addItemCargoGlobal [_item,1];
		};
		player removeItem _item;
	};

	MAZ_RS_fnc_selectDiarySubject = {
		params["_subject", "_record"];
		if (_subject == "Diary") then {
			_subject = "Briefing";
		};

		private _fnc_selectIndex = {
			params[ "_ctrl", "_name" ];
			for "_i" from 0 to ( lnbSize _ctrl select 0 ) -1 do {
				if (_ctrl lnbText [ _i, 0 ] == _name) exitWith {
					_ctrl lnbSetCurSelRow _i;
				};
			};
		};

		private _subjectList = uiNamespace getVariable "RscDiary" displayCtrl 1001;
		[_subjectList, _subject] call _fnc_selectIndex;
		private _recordList = uiNamespace getVariable "RscDiary" displayCtrl 1002;
		[_recordList, _record] call _fnc_selectIndex;
	};

	MAZ_RS_fnc_rolesSystemMapEvents = {
		if (!isNil "TeamMapEvent") then {
			(findDisplay 12 displayCtrl 51) ctrlRemoveEventHandler ["Draw",TeamMapEvent];
		};
		[] spawn {
			waitUntil {sleep 5; getClientState == "BRIEFING READ" || !isMultiplayer};
			comment "PURGE!!!";
			(findDisplay 12 displayCtrl 51) ctrlRemoveAllEventhandlers "Draw";
			disableMapIndicators [true,false,false,false];
			
			maxDistanceFlagMarker3D = 1500;
			transitionDistanceFlagMarker3D = 500;
			maxDistanceUnitMarker3D = 150;
			maxDistanceUnitMarkerText3D = 10;
			maxCursorRangeUnitMarker = 0.02;
			minMapZoomUnitMarker = 0.0045;
			
			TeamMapEvent = (findDisplay 12 displayCtrl 51) ctrlAddEventHandler ["Draw", 
			{
				_vehicleList = [];
				{
					if (!isPlayer _x && !alive _x) then {continue;};
					if((side group _x) isEqualTo (side group player)) then {
						_pos = _x modelToWorldVisual [0,0,0];
						_unit = driver vehicle _x;
						_dir = 0;
						_text = (name _x) + " ";
						_distance = player distance _x;
						
						_alpha = 1;
						_color = switch (side group _x) do
						{
							case west: {[0,0.3,0.6,_alpha]};
							case east: {[0.8,0.05,0,_alpha]};
							case independent: {[0.5,1,0.5,_alpha]};
							default {[1,1,1,_alpha]};
						};
						
						if((group player) isEqualTo (group _unit)) then 
						{
							_color = [0.1,0.5,0.5,_alpha];
						};
						
						_pos2D = (_this select 0) ctrlMapWorldToScreen _pos;
						_posCursor2D = getMousePosition;
						_dist = _pos2D distance2D _posCursor2D;
						_scale = ctrlMapScale (_this select 0);
						_icon = _x getVariable ["MAZ_RS_roles_role","Recruit"];
						_icon = MAZ_RS_rolesDescriptions select (MAZ_RS_rolesList find _icon);
						_icon = _icon # 2;
						_size = 30;

						if(_x getVariable ["MAZ_RS_isCommander",false]) then {
							_icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\captain_gs.paa";
							_size = 25;
						};
						
			
						if (vehicle _x == _x) then 
						{
							private _rightText = " " + (_x getVariable ["MAZ_RS_roles_role","Recruit"]);
							if((_scale > minMapZoomUnitMarker) && (_dist > maxCursorRangeUnitMarker)) then {_text = ""; _icon = "\A3\ui_f\data\Map\VehicleIcons\iconManVirtual_ca.paa"; _dir = getDir _x; _size = 20; _rightText = "";};
			
							_this select 0 drawIcon
							[
								_icon,
								_color,
								_pos,
								_size,
								_size,
								_dir,
								_text,
								2,
								0.05,
								"RobotoCondensedBold",
								"left"
							];
			
							_this select 0 drawIcon
							[
								_icon,
								_color,
								_pos,
								_size,
								_size,
								_dir,
								_text,
								1,
								0.05,
								"RobotoCondensedBold",
								"left"
							];

							_this select 0 drawIcon
							[
								"#(rgb,1,1,1)color(0,0,0,0)",
								_color,
								_pos,
								_size,
								_size,
								_dir,
								_rightText,
								2,
								0.05,
								"RobotoCondensedBold",
								"right"
							];
			
							_this select 0 drawIcon
							[
								"#(rgb,1,1,1)color(0,0,0,0)",
								_color,
								_pos,
								_size,
								_size,
								_dir,
								_rightText,
								1,
								0.05,
								"RobotoCondensedBold",
								"right"
							];
						}
						else 	
						{
							if !((vehicle _x) in _vehicleList) then 
							{
								_vehicleList pushback vehicle _x;
			
								_dir = getDir vehicle _x;
			
								_className = (typeOf vehicle _x);
								_file = getText (configfile >> "CfgVehicles" >> _className >> "icon");
			
								_driver = driver vehicle _x;
			
								_vehName = getText (configfile >> "CfgVehicles" >> _className >> "displayName");
								_text = _vehName;
			
								_text2 = "";
								_count = count crew vehicle _x;
								if(_count > 1) then 
								{
									_text2 = ((name _driver) + " + " + (str (_count-1)) + " more");
								}
								else
								{
									_text2 = (name _driver);
								};
								if((_scale > minMapZoomUnitMarker) && (_dist > maxCursorRangeUnitMarker)) then {_text = ""; _text2 = "";};
								
								_this select 0 drawIcon
								[
									_file,
									_color,
									_pos,
									20,
									20,
									_dir,
									_text,
									2,
									0.05,
									"RobotoCondensedBold",
									"left"
								];
			
								_this select 0 drawIcon
								[
									_file,
									_color,
									_pos,
									20,
									20,
									_dir,
									_text2,
									2,
									0.05,
									"RobotoCondensedBold",
									"right"
								];
			
								_this select 0 drawIcon
								[
									_file,
									_color,
									_pos,
									20,
									20,
									_dir,
									_text,
									1,
									0.05,
									"RobotoCondensedBold",
									"left"
								];
							};
						};
			
						if(_x == player) then 
						{
							_color set[3,0.5];
							_this select 0 drawIcon
							[
								"\a3\ui_f\data\Map\groupIcons\selector_selected_ca.paa",
								_color,
								_pos,
								30,
								30,
								_dir,
								"",
								0,
								0.05,
								"RobotoCondensedBold",
								"left"
							];
						};
					};
				} foreach allUnits;
			}];
		};
	};

	comment "Commander Supports";
		MAZ_RS_fnc_sendSideMessage = {
			params ["_sender","_text"];
			private _side = side (group player);
			if(_sender isEqualType objNull) then {
				[_sender,_text] remoteExec ['sideChat'];
			};
			if(_sender isEqualType "") then {
				private _grp = createGroup [_side, true];
				private _unit = _grp createUnit ["B_Soldier_F",[0,0,0],[],0,"CAN_COLLIDE"];
				[_grp,[_sender]] remoteExec ['setGroupId'];
				[_unit,_text] remoteExec ['sideChat'];
				_unit spawn {
					sleep 1;
					deleteVehicle _this;
				};
			};
			true
		};

		MAZ_RS_fnc_startSupportCooldown = {
			params ["_cooldown"];
			MAZ_RS_CommanderSupportsCooldown = true;
			MAZ_RS_CommanderSupportsCooldownTimer = _cooldown;
			while {MAZ_RS_CommanderSupportsCooldown} do {
				MAZ_RS_CommanderSupportsCooldownTimer = MAZ_RS_CommanderSupportsCooldownTimer - 1;
				sleep 1;
				if(MAZ_RS_CommanderSupportsCooldownTimer <= 0) then {
					MAZ_RS_CommanderSupportsCooldown = false;
				};
			};
			playSound3D ["a3\dubbing_f\modules\supports\misc_new_available.ogg", player, false, getPosASL player, 5, 1, 150, 0, true];
			["HQ","Be advised. Support units are now on standby. Out."] call MAZ_RS_fnc_sendSideMessage;
		};

		MAZ_RS_fnc_getSupportPosition = {
			private _pos = [0,0,0];
			if(visibleMap) then {
				_pos = (findDisplay 12 displayCtrl 51) ctrlMapScreenToWorld getMousePosition;
				_pos set [2,0];
				if !([_pos] call MAZ_RS_fnc_isMapSupportInGoodPosition) then {_pos = [0,0,0];["Supports are limited to inside the visible radiuses.","addItemFailed"] call MAZ_RS_fnc_roleSystemMessage;};
			} else {
				private _laserDesignators = ["Laserdesignator","Laserdesignator_01_khk_F","Laserdesignator_02","Laserdesignator_02_ghex_F","Laserdesignator_03"];
				if(!(currentWeapon player in _laserDesignators && isLaserOn player)) exitWith {["You can't call in supports without your laser designator on.","addItemFailed"] call MAZ_RS_fnc_roleSystemMessage;};
				private _laserTarget = laserTarget player;
				_pos = getPos _laserTarget;
			};
			_pos
		};

		MAZ_RS_fnc_isMapSupportInGoodPosition = {
			params ["_pos"];
			if(_pos distance2D player <= 2500) exitWith {true};
			private _squadLeaders = allPlayers select {
				(side (group _x) == side (group player)) && 
				((_x getVariable ["MAZ_RS_roles_role","Recruit"]) == "Squad Leader") &&
				(isTouchingGround (vehicle _x)) &&
				alive _x
			};

			private _isOkay = false;
			{
				if(_pos distance2D _x <= 1500) exitWith {_isOkay = true;};
			}forEach _squadLeaders;

			_isOkay;
		};

		MAZ_RS_fnc_showFriendlyOutlinesWhenCallingSupport = {
			while {player getVariable ["MAZ_RS_isCommander",false]} do {
				waitUntil {uiSleep 0.1; commandingMenu == "#User:BIS_fnc_addCommMenuItem_menu"};

				private _map = (findDisplay 12) displayCtrl 51;
				if(!isNil "MAZ_RS_EH_Draw_SupportRadius") then {
					_map ctrlRemoveEventHandler ["Draw",MAZ_RS_EH_Draw_SupportRadius];
				};
				MAZ_RS_EH_Draw_SupportRadius = _map ctrlAddEventHandler ["Draw", {
					private _squadLeaders = (allPlayers - [player]) select {
						(side (group _x) == side (group player)) && 
						((_x getVariable ["MAZ_RS_roles_role","Recruit"]) == "Squad Leader") &&
						(isTouchingGround (vehicle _x)) &&
						alive _x
					};
					_squadLeaders = [player] + _squadLeaders;
					private _yourSelf = true;
					private _colorSelf = [side (group player)] call BIS_fnc_sideColor;
					private _colorTeam = [1,1,1,1];
					{
						private _center = getPos _x;
						private _color = [_colorTeam,_colorSelf] select _yourSelf;
						private _radius = [1500,2500] select _yourSelf;
						private _count = 6 max floor (2 * pi * _radius / 125);
						private _intervals = 360 / _count;

						for "_i" from 0 to (_count - 1) do {
							private _circumferencePos = _i * _intervals;
							(_this select 0) drawIcon [
								"\a3\ui_f\data\map\markers\military\dot_ca.paa", 
								_color, 
								[
									_radius * cos _circumferencePos + (_center # 0),
									_radius * sin _circumferencePos + (_center # 1)
								], 
								17, 
								17, 
								0
							];
						};
						_yourSelf = false;
					}forEach _squadLeaders;
				}];

				waitUntil {uiSleep 0.1; commandingMenu != "#User:BIS_fnc_addCommMenuItem_menu"};

				_map ctrlRemoveEventHandler ["Draw",MAZ_RS_EH_Draw_SupportRadius];
			};
		};

		MAZ_RS_fnc_callAirdrop = {
			if(MAZ_RS_CommanderSupportsCooldown) exitWith {
				[format ["You cannot use more Commander supports until your cooldown expires! %1 seconds left.",MAZ_RS_CommanderSupportsCooldownTimer],"addItemFailed"] call MAZ_RS_fnc_roleSystemMessage;
			};
			private _pos = call MAZ_RS_fnc_getSupportPosition;
			if(_pos isEqualTo [0,0,0]) exitWith {};
			[300] spawn MAZ_RS_fnc_startSupportCooldown;

			playSound3D ["a3\dubbing_f\modules\supports\drop_request.ogg", player, false, getPosASL player, 5, 1, 70, 0, false];
			[player,format ["Requesting supply drop at the transmitted coordinates. (%1) Over.",mapGridPosition _pos]] call MAZ_RS_fnc_sendSideMessage;
			[player,true] remoteExec ['setRandomLip'];
			sleep 3.5;
			[player,false] remoteExec ['setRandomLip'];
			sleep (1.5 + (random 3));
			playSound3D ["a3\dubbing_f\modules\supports\drop_acknowledged.ogg", player, false, getPosASL player, 5, 1, 150, 0, true];
			["HQ","Affirmative, supplies en-route. Out."] call MAZ_RS_fnc_sendSideMessage;
			
			private _sideOf = side (group player);
			private _grp = createGroup [_sideOf,true];
			private _dropLoad = 'B_CargoNet_01_ammo_F';
			private _dir = random 360;
			private _vehPos = _pos getPos [3500,_dir + 180];

			private _vehType = "";
			private _doorAnim = "";
			switch (_sideOf) do {
				case west: {
					_vehType = 'B_T_VTOL_01_vehicle_F'; 
					_doorAnim = 'Door_1_source';
				};
				case "huron": {_vehType = 'B_Heli_Transport_03_F'; _doorAnim = 'Door_rear_source';};
				case east: {_vehType = 'O_T_VTOL_02_vehicle_F'; _doorAnim = 'Door_1_source';};
				case independent: {_vehType = 'I_Heli_Transport_02_F'; _doorAnim = 'CargoRamp_Open';};
			};

			private _result = [[_vehPos select 0,_vehPos select 1,(_pos select 2) + 300],_dir,_vehType,_grp] call BIS_fnc_spawnVehicle;
			private _spawnedVeh = _result select 0;

			waitUntil {!isNull driver _spawnedVeh};
			_spawnedVeh flyInHeight 250;
			_spawnedVeh setVariable ["MAZ_RS_caller",player,true];
			_spawnedVeh addEventHandler ["Killed",{
				params ["_unit", "_killer", "_instigator", "_useEffects"];
				private _caller = _unit getVariable ["MAZ_RS_caller",objNull];
				[[], {
					playSound3D ["a3\dubbing_f\modules\supports\drop_destroyed.ogg", player, false, getPosASL player, 5, 1, 150, 0, true];
					["HQ","Be advised. Support aircraft is unresponsive. Out."] call MAZ_RS_fnc_sendSideMessage;
				}] remoteExec ['spawn',_caller];
				{
					deleteVehicle _x;
				}forEach (crew _unit);
			}];
			_grp setBehaviour "CARELESS";

			_spawnedVeh animateDoor [_doorAnim,1,true];
	
			private _wayPointMove = _grp addWaypoint [[(_pos select 0),(_pos select 1),300],0];
			_wayPointMove setWaypointType "MOVE";
			private _nextWaypointPos = _pos getPos [6000,_dir];
			private _wayPointLeave = _grp addWaypoint [[(_nextWaypointPos select 0),(_nextWaypointPos select 1),300],0];
			_wayPointLeave setWaypointType "MOVE";

			waitUntil {(_spawnedVeh distance2D _pos) < 150};
			if(!alive _spawnedVeh) exitWith {
				sleep 120;
				deleteVehicle _spawnedVeh;
			};
			sleep 1.5;
			
			playSound3D ["a3\dubbing_f\modules\supports\drop_accomplished.ogg", player, false, getPosASL player, 5, 1, 150, 0, true];
			["HQ","The supplies have been dropped. Out."] call MAZ_RS_fnc_sendSideMessage;

			private _dropPos = position _spawnedVeh getPos [10,getDir _spawnedVeh+180];
			private _para = createVehicle ["B_Parachute_02_F", [0,0,300], [], 0, ""];
			_para setPosATL [(_dropPos select 0),(_dropPos select 1),(getPosATL _spawnedVeh select 2)];
			private _veh = createVehicle [_dropLoad, [0,0,80], [], 0, ""];
			_veh attachTo [_para,[0,0,0]]; 

			WaitUntil {((((position _veh) select 2) < 0.6) || (isNil "_para"))};
			detach _veh;
			_veh SetVelocity [0,0,-5];           
			sleep 0.3;
			_veh setPos [(position _veh) select 0, (position _veh) select 1, 0.6];
			private _smoke = "SmokeShellRed" createVehicle position _veh;
			_smoke attachTo [_veh,[0,0,0]];
			private _light = "Chemlight_green" createVehicle position _veh;
			_light attachTo [_veh,[0,0,0]];
			detach _smoke;
			detach _light;
			["AmmoboxInit",[_veh,true]] spawn BIS_fnc_arsenal;
			if(_vehType == 'B_Heli_Transport_03_F') then {
				sleep 20;
				{
					deleteVehicle _x;
				} forEach crew _spawnedVeh;
				deleteVehicle _spawnedVeh;
			} else {
				{
					deleteVehicle _x;
				} forEach crew _spawnedVeh;
				deleteVehicle _spawnedVeh;
			};
		};

		MAZ_RS_fnc_callCASPlane = {
			params ["_mode"];
			if(MAZ_RS_CommanderSupportsCooldown) exitWith {
				[format ["You cannot use more Commander supports until your cooldown expires! %1 seconds left.",MAZ_RS_CommanderSupportsCooldownTimer],"addItemFailed"] call MAZ_RS_fnc_roleSystemMessage;
			};
			private _pos = call MAZ_RS_fnc_getSupportPosition;
			if(_pos isEqualTo [0,0,0]) exitWith {};
			[600] spawn MAZ_RS_fnc_startSupportCooldown;
			private _logic = "Land_HelipadEmpty_F" createVehicle [0,0,0];
			_logic setPos _pos;
			_logic setDir (random 360);
			private _planeType = switch (side (group player)) do {
				case west: {"B_Plane_CAS_01_F"};
				case east: {"O_Plane_CAS_02_F"};
				case independent: {"I_Plane_Fighter_03_CAS_F"};
			};

			_logic setVariable ["vehicle",_planeType,true];
			_logic setVariable ["type",_mode,true];

			playSound3D ["a3\dubbing_f\modules\supports\cas_bombing_request.ogg", player, false, getPosASL player, 5, 1, 70, 0, false];
			[player,format ["Requesting immediate airstrike at the transmitted coordinates. (%1) Over.",mapGridPosition _pos]] call MAZ_RS_fnc_sendSideMessage;
			[player,true] remoteExec ['setRandomLip'];
			sleep 3.5;
			[player,false] remoteExec ['setRandomLip'];
			sleep (1.5 + (random 3));
			playSound3D ["a3\dubbing_f\modules\supports\cas_bombing_acknowledged.ogg", player, false, getPosASL player, 5, 1, 150, 0, true];
			["HQ","Copy that, strike aircraft on the way. Out."] call MAZ_RS_fnc_sendSideMessage;

			[_logic,{
				[_this,nil,true] call BIS_fnc_moduleCAS;
			}] remoteExec ['spawn',2]; 
			sleep (28 + (random 4));
			playSound3D ["a3\dubbing_f\modules\supports\cas_bombing_accomplished.ogg", player, false, getPosASL player, 5, 1, 150, 0, true];
			["CAS Pilot","Payload delivered. We're RTB. Out."] call MAZ_RS_fnc_sendSideMessage;
		};

		MAZ_RS_fnc_callMortarStrike = {
			if(MAZ_RS_CommanderSupportsCooldown) exitWith {
				[format ["You cannot use more Commander supports until your cooldown expires! %1 seconds left.",MAZ_RS_CommanderSupportsCooldownTimer],"addItemFailed"] call MAZ_RS_fnc_roleSystemMessage;
			};
			private _pos = call MAZ_RS_fnc_getSupportPosition;
			if(_pos isEqualTo [0,0,0]) exitWith {};
			[600] spawn MAZ_RS_fnc_startSupportCooldown;
			playSound3D ["a3\dubbing_f\modules\supports\artillery_request.ogg", player, false, getPosASL player, 5, 1, 70, 0, false];
			[player,format ["Requesting immediate artillery support at the designated coordinates. (%1) Over.", mapGridPosition _pos]] call MAZ_RS_fnc_sendSideMessage;
			[player,true] remoteExec ['setRandomLip'];
			sleep 3.5;
			[player,false] remoteExec ['setRandomLip'];
			sleep (1.5 + (random 3));
			playSound3D ["a3\dubbing_f\modules\supports\artillery_acknowledged.ogg", player, false, getPosASL player, 5, 1, 150, 0, true];
			["HQ","Target location received, ordinance is inbound. Out."] call MAZ_RS_fnc_sendSideMessage;

			private _minDelay = 30;
			private _maxDelay = 45;
			private _delayBetweenRounds = _minDelay + (random (_maxDelay - _minDelay));
			_delayBetweenRounds = _delayBetweenRounds / 2;
			sleep _delayBetweenRounds;
			playSound3D ["a3\dubbing_f\modules\supports\artillery_rounds_complete.ogg", player, false, getPosASL player, 5, 1, 150, 0, true];
			["HQ","Rounds complete! Out."] call MAZ_RS_fnc_sendSideMessage;
			sleep _delayBetweenRounds;

			playSound3D ["a3\dubbing_f\modules\supports\artillery_accomplished.ogg", player, false, getPosASL player, 5, 1, 150, 0, true];
			["HQ","Splash! Out."] call MAZ_RS_fnc_sendSideMessage;
			[_pos, "Sh_82mm_AMOS", 60, 10, [4,7]] spawn BIS_fnc_fireSupportVirtual;
		};

		MAZ_RS_fnc_hasTerminal = {
			private _result = false;
			private _uavTerminals = ["B_UavTerminal","O_UavTerminal","I_UavTerminal","I_E_UavTerminal"];
			{
				if(_x in _uavTerminals) exitWith {_result = true;};
			}forEach (assignedItems player);
			_result
		};

		MAZ_RS_fnc_callUAVSupport = {
			if(MAZ_RS_CommanderSupportsCooldown) exitWith {
				[format ["You cannot use more Commander supports until your cooldown expires! %1 seconds left.",MAZ_RS_CommanderSupportsCooldownTimer],"addItemFailed"] call MAZ_RS_fnc_roleSystemMessage;
			};
			private _pos = call MAZ_RS_fnc_getSupportPosition;
			if(_pos isEqualTo [0,0,0]) exitWith {};

			[610] spawn MAZ_RS_fnc_startSupportCooldown;

			playSound3D ["a3\dubbing_f\modules\supports\uav_request.ogg", player, false, getPosASL player, 5, 1, 70, 0, false];
			[player,format ["Requesting aerial recon at the transmitted location. (%1) Over.",mapGridPosition _pos]] call MAZ_RS_fnc_sendSideMessage;
			[player,true] remoteExec ['setRandomLip'];
			sleep 3.5;
			[player,false] remoteExec ['setRandomLip'];
			sleep (1.5 + (random 3));
			playSound3D ["a3\dubbing_f\modules\supports\uav_acknowledged.ogg", player, false, getPosASL player, 5, 1, 150, 0, true];
			["HQ","Acknowledged, dispatching drone to the designated coordinates. Out."] call MAZ_RS_fnc_sendSideMessage;
			
			private _droneType = switch (side (group player)) do {
				case west: {"B_UAV_02_F"};
				case east: {"O_UAV_02_F"};
				case independent: {"I_UAV_02_F"};
			};

			private _direction = random 360;
			private _distance = 2500;
			private _height = 650;

			private _droneSpawnPos = [_pos,_distance,_direction] call BIS_fnc_relPos;
			_droneSpawnPos set [2,_height];
			([_droneSpawnPos,_direction - 180,_droneType,side (group player)] call BIS_fnc_spawnVehicle) params ["_drone","_crew","_group"];
			_drone lockDriver true;
			_drone flyInHeight _height;
			_drone setVehicleAmmo 0;

			private _droneWaypointEnter = _group addWaypoint [_pos,0];
			_droneWaypointEnter setWaypointLoiterRadius 500;
			_droneWaypointEnter setWaypointLoiterAltitude _height;

			waitUntil {(_drone distance2D _pos) < 750};

			private _viewDist = viewDistance;
			if(3000 > _viewDist) then {
				setViewDistance 3000;
			};
			player connectTerminalToUAV _drone;
			private _countDown = 300;
			while {alive _drone && (_countDown >= 0)} do {
				_countDown = _countDown - 1;
				sleep 1;
			};
			player connectTerminalToUAV objNull;
			if(3000 > _viewDist) then {
				setViewDistance _viewDist;
			};
			if(!alive _drone) then {
				playSound3D ["a3\dubbing_f\modules\supports\uav_destroyed.ogg", player, false, getPosASL player, 5, 1, 150, 0, true];
				["HQ","Be advised, the drone has dropped off the grid. Out."] call MAZ_RS_fnc_sendSideMessage;
			} else {
				playSound3D ["a3\dubbing_f\modules\supports\uav_accomplished.ogg", player, false, getPosASL player, 5, 1, 150, 0, true];
				["HQ","Drone is bingo fuel and RTB. Out."] call MAZ_RS_fnc_sendSideMessage;
				_drone lock true;
				private _droneWaypointLeave = _group addWaypoint [_droneSpawnPos,0];
				_group setCurrentWaypoint _droneWaypointLeave;

				waitUntil {(_drone distance2D _droneSpawnPos) < 150};
				deleteVehicle _drone;
			};
		};

		MAZ_RS_fnc_setupCommanderGroup = {
			if("CMD : " in (groupID (group player))) exitWith {};
			private _string = format ["CMD : %1",groupID (group player)];
			(group player) setGroupIdGlobal [_string];
		};

		MAZ_RS_fnc_removeCommanderGroup = {
			private _grp = group player;
			if(!("CMD : " in (groupID _grp))) exitWith {};
			private _string = groupID _grp;
			_string = _string splitString "";
			_string deleteRange [0,count "CMD : "];
			_string = _string joinString "";
			_grp setGroupIDGlobal [_string];
		};

		MAZ_RS_fnc_addCommunicationMenuActions = {
			call MAZ_RS_fnc_removeCommunicationMenuActions;
			MAZ_RS_Support_UAV = [player,"Call","UAV Support",'[] spawn MAZ_RS_fnc_callUAVSupport;',""] call BIS_fnc_addCommMenuItem;
			MAZ_RS_Support_Mortar = [player,"Call","82mm Mortar Support",'[] spawn MAZ_RS_fnc_callMortarStrike;',""] call BIS_fnc_addCommMenuItem;
			MAZ_RS_Support_CASPlaneGun = [player,"Call","CAS Support (Gun)",'[0] spawn MAZ_RS_fnc_callCASPlane;',""] call BIS_fnc_addCommMenuItem;
			MAZ_RS_Support_CASPlaneMissile = [player,"Call","CAS Support (Missile)",'[1] spawn MAZ_RS_fnc_callCASPlane;',""] call BIS_fnc_addCommMenuItem;
			MAZ_RS_Support_CASPlaneBomb = [player,"Call","CAS Support (Bomb)",'[3] spawn MAZ_RS_fnc_callCASPlane;',""] call BIS_fnc_addCommMenuItem;
			MAZ_RS_Support_Resupply = [player,"Call","Airdrop (Supplies)",'[] spawn MAZ_RS_fnc_callAirdrop;',""] call BIS_fnc_addCommMenuItem;
			player setVariable ["MAZ_RS_isCommander",true,true];
		};

		MAZ_RS_fnc_removeCommunicationMenuActions = {
			if(!isNil "MAZ_RS_Support_UAV") then {
				[player,MAZ_RS_Support_UAV] call BIS_fnc_removeCommMenuItem;
			};
			if(!isNil "MAZ_RS_Support_Mortar") then {
				[player,MAZ_RS_Support_Mortar] call BIS_fnc_removeCommMenuItem;
			};
			if(!isNil "MAZ_RS_Support_CASPlaneGun") then {
				[player,MAZ_RS_Support_CASPlaneGun] call BIS_fnc_removeCommMenuItem;
			};
			if(!isNil "MAZ_RS_Support_CASPlaneMissile") then {
				[player,MAZ_RS_Support_CASPlaneMissile] call BIS_fnc_removeCommMenuItem;
			};
			if(!isNil "MAZ_RS_Support_CASPlaneBomb") then {
				[player,MAZ_RS_Support_CASPlaneBomb] call BIS_fnc_removeCommMenuItem;
			};
			if(!isNil "MAZ_RS_Support_Resupply") then {
				[player,MAZ_RS_Support_Resupply] call BIS_fnc_removeCommMenuItem;
			};
			player setVariable ["MAZ_RS_isCommander",false,true];
		};

	MAZ_RS_fnc_getAllSquadLeaders = {
		private _return = [];
		{
			private _role = _x getVariable ["MAZ_RS_roles_role","Recruit"];
			if(_role == "Squad Leader") then {
				_return pushBack _x;
			};
		}forEach allPlayers;
		_return
	};
	
	MAZ_RS_fnc_startCommanderVote = {
		params ["_timeToVote","_side"];
		private _currentCommander = [_side] call MAZ_RS_fnc_getSideCommander;
		if(_currentCommander isEqualType objNull) then {
			[_side] call MAZ_RS_fnc_removeCommander;
		};
		MAZ_RS_commanderVotes = [];
		publicVariable "MAZ_RS_commanderVotes";
		[_timeToVote,{
			[_this] spawn MAZ_RS_fnc_voteForGroundCommander;
		}] remoteExec ["spawn",_side];
		sleep _timeToVote;
		private _commander = call MAZ_RS_fnc_getCommanderVoteWinner;
		if(isNil "_commander") then {
			[[], {
				["Be advised. No Commander was selected.","addItemFailed"] call MAZ_RS_fnc_roleSystemMessage;
			}] remoteExec ["spawn",_side];
		} else {
			[_commander,_side] call MAZ_RS_fnc_addCommander;
			[_commander, {
				[format ["Be advised. Commander %1 is online.",name _this],"addItemOk"] call MAZ_RS_fnc_roleSystemMessage;
			}] remoteExec ["spawn",_side];
		};
	};

	MAZ_RS_fnc_castCommanderVote = {
		params ["_listbox"];
		if(!isNil "MAZ_RS_Key_VoteCommander") then {
			[MAZ_RS_Key_VoteCommander] call MAZ_fnc_removeKeybind;
			MAZ_RS_Key_VoteCommander = nil;
		};
		private _index = lbCurSel _listbox;
		private _id = _listbox lbData _index;
		private _name = _listbox lbText _index;

		private _voteIndex = -1;
		{
			_x params ["_votedID","_votedCount"];
			if(_votedID == _id) exitWith {
				_voteIndex = _forEachIndex;
				MAZ_RS_commanderVotes set [_forEachIndex,[_votedID,_votedCount + 1]];
			};
		}forEach MAZ_RS_commanderVotes;

		if(_voteIndex < 0) then {
			MAZ_RS_commanderVotes pushBack [_id,1];
		};
		publicVariable "MAZ_RS_commanderVotes";

		with uiNamespace do {MAZ_RS_rolesSystemVoteMenu closeDisplay 0;};
		[format ["Vote cast for %1.",_name],"addItemOk"] call MAZ_RS_fnc_roleSystemMessage;
	};

	MAZ_RS_fnc_getCommanderVoteWinner = {
		private _winnerObj = objNull;
		private _winner = "";
		private _highestVote = -1;
		{
			_x params ["_votedID","_votedCount"];
			if(_votedCount > _highestVote) then {
				_winner = _votedID;
				_highestVote = _votedCount;
			};
		}forEach MAZ_RS_commanderVotes;

		if(_winner != "") then {
			{
				if(getPlayerUID _x == _winner) exitWith {
					_winnerObj = _x;
				};
			}forEach allPlayers;
		};

		_winnerObj
	};

	MAZ_RS_fnc_getSideCommander = {
		params [["_side",west,[west]]];
		private _index = switch (_side) do {
			case west: {0};
			case east: {1};
			case independent: {2};
		};
		private _id = MAZ_RS_GroundCommanders # _index;
		private _commander = objNull;
		{
			if(_id == getPlayerUID _x) exitWith {_commander = _x};
		}forEach allPlayers;

		if(isNull _commander) exitWith {false};
		_commander
	};

	MAZ_RS_fnc_getSideCommanderGroup = {
		params ["_side"];
		private _grp = grpNull;
		{
			if(side _x != _side) then {continue;};
			private _name = groupId _x;
			if("CMD : " in _name) exitWith {_grp = _x};
		}forEach allGroups;

		if(isNull _grp) then {
			comment "If CMD Group disbanded, find largest group";
			private _largest = -1;
			{
				if(side _x != _side) then {continue;};
				private _num = {isPlayer _x} count units _x;
				if(_largest < _num) then {
					_largest = _num;
					_grp = _x;
				};
			}forEach allGroups;
		};

		if(isNull _grp) exitWith {false};
		_grp
	};

	MAZ_RS_fnc_setupRejoinCommander = {
		params ["_unit","_side"];
		call MAZ_RS_fnc_addCommunicationMenuActions;
		_unit setVariable ["MAZ_RS_isCommander",true,true];
		private _cmdGroup = [_side] call MAZ_RS_fnc_getSideCommanderGroup;
		[_unit] joinSilent _cmdGroup;
		["Welcome back Commander, you've been put in the Command Squad!"] call MAZ_RS_fnc_roleSystemMessage;
		[] spawn MAZ_RS_fnc_showFriendlyOutlinesWhenCallingSupport;
		if(_cmdGroup getVariable ["MAZ_RS_roles_grpCanHaveSL",false]) then {
			_unit setVariable ["MAZ_RS_roles_role","Squad Leader",true];
			["Squad Leader"] call MAZ_RS_fnc_randomFromEquipment;
		} else {
			["Squad Leader is taken. To act as Commander ask for the Squad Leader role.","addItemFailed"] call MAZ_RS_fnc_roleSystemMessage;
		};
	};

	MAZ_RS_fnc_addCommander = {
		params ["_commander","_side"];
		private _index = switch (_side) do {
			case west: {0};
			case east: {1};
			case independent: {2};
		};
		MAZ_RS_GroundCommanders set [_index,getPlayerUID _commander];
		publicVariable "MAZ_RS_GroundCommanders";

		[[],{
			call MAZ_RS_fnc_setupCommanderGroup;
			call MAZ_RS_fnc_addCommunicationMenuActions;
			[] spawn MAZ_RS_fnc_showFriendlyOutlinesWhenCallingSupport;
		}] remoteExec ['spawn',_commander];
	};

	MAZ_RS_fnc_removeCommander = {
		params ["_side"];
		private _commander = [_side] call MAZ_RS_fnc_getSideCommander;		
		[[],{
			call MAZ_RS_fnc_removeCommunicationMenuActions;
			call MAZ_RS_fnc_removeCommanderGroup;
		}] remoteExec ['spawn',_commander];
		
		private _index = switch (_side) do {
			case west: {0};
			case east: {1};
			case independent: {2};
		};
		MAZ_RS_GroundCommanders set [_index,""];
		publicVariable "MAZ_RS_GroundCommanders";
	};

	MAZ_RS_fnc_updateVotingMenu = {
		private _squadLeaderListbox = uiNamespace getVariable "MAZ_RS_roleSystemVoteMenuList";
		while {!isNull (uiNamespace getVariable 'MAZ_RS_rolesSystemVoteMenu')} do {
			private _squadLeaders = call MAZ_RS_fnc_getAllSquadLeaders;
			lbClear _squadLeaderListbox;
			{
				private _name = name _x;
				private _groupName = groupID (group _x);
				private _index = _squadLeaderListbox lbAdd (format ["%1 - %2",_name,_groupName]);
				_squadLeaderListbox lbSetData [_index,getPlayerUID _x];
			}forEach _squadLeaders;
			sleep 0.5;
		};
	};

	MAZ_RS_fnc_voteForGroundCommanderMenu = {
		disableSerialization;
		uiNamespace setVariable ['MAZ_RS_rolesSystemVoteMenu',displayNull];
		switch (side (group player)) do {
			case west: {uiNamespace setVariable ["MAZ_RS_rolesMenuBackground","#(argb,8,8,3)color(0,0,0.1,0.5)"]};
			case east: {uiNamespace setVariable ["MAZ_RS_rolesMenuBackground","#(argb,8,8,3)color(0.1,0,0,0.5)"]};
			case independent: {uiNamespace setVariable ["MAZ_RS_rolesMenuBackground","#(argb,8,8,3)color(0,0.1,0,0.5)"]};
			case civilian: {uiNamespace setVariable ["MAZ_RS_rolesMenuBackground","#(argb,8,8,3)color(0.1,0,0.1,0.5)"]};
		};
		with uiNamespace do {
			GUI_GRID_H = ((((safeZoneW / safeZoneH) min 1.2) / 1.2) / 25);
			MAZ_RS_rolesSystemVoteMenu = (findDisplay 46) createDisplay "RscDisplayEmpty";
			MAZ_RS_rolesSystemVoteMenu displayAddEventHandler ["Unload", {
				uiNamespace setVariable ['MAZ_RS_rolesSystemVoteMenu',displayNull];
			}];

			comment "Visuals";

				_roleVoteMenuFrame = MAZ_RS_rolesSystemVoteMenu ctrlCreate ["RscFrame", 1800];
				_roleVoteMenuFrame ctrlSetPosition [0.350469 * safezoneW + safezoneX,0.346 * safezoneH + safezoneY,0.299062 * safezoneW,0.297 * safezoneH];
				_roleVoteMenuFrame ctrlCommit 0;

				_roleVoteMenuBG = MAZ_RS_rolesSystemVoteMenu ctrlCreate ["RscPicture", 1200];
				_roleVoteMenuBG ctrlSetText MAZ_RS_rolesMenuBackground;
				_roleVoteMenuBG ctrlSetPosition [0.350469 * safezoneW + safezoneX,0.346 * safezoneH + safezoneY,0.299062 * safezoneW,0.297 * safezoneH];
				_roleVoteMenuBG ctrlCommit 0;

				_roleVoteMenuListFrame = MAZ_RS_rolesSystemVoteMenu ctrlCreate ["RscFrame", 1801];
				_roleVoteMenuListFrame ctrlSetPosition [0.355625 * safezoneW + safezoneX,0.357 * safezoneH + safezoneY,0.108281 * safezoneW,0.231 * safezoneH];
				_roleVoteMenuListFrame ctrlCommit 0;

				_roleVoteMenuDescFrame = MAZ_RS_rolesSystemVoteMenu ctrlCreate ["RscFrame", 1802];
				_roleVoteMenuDescFrame ctrlSetPosition [0.469062 * safezoneW + safezoneX,0.357 * safezoneH + safezoneY,0.175313 * safezoneW,0.275 * safezoneH];
				_roleVoteMenuDescFrame ctrlCommit 0;

				_roleVoteMenuSLLabel = MAZ_RS_rolesSystemVoteMenu ctrlCreate ["RscText",1000];
				_roleVoteMenuSLLabel ctrlSetPosition [0.360781 * safezoneW + safezoneX,0.368 * safezoneH + safezoneY,0.103125 * safezoneW,0.022 * safezoneH];
				_roleVoteMenuSLLabel ctrlSetText "Squad Leaders:";
				_roleVoteMenuSLLabel ctrlCommit 0;

				_roleVoteMenuCommanderLabel = MAZ_RS_rolesSystemVoteMenu ctrlCreate ["RscText",1000];
				_roleVoteMenuCommanderLabel ctrlSetPosition [0.515469 * safezoneW + safezoneX,0.395 * safezoneH + safezoneY,0.118594 * safezoneW,0.033 * safezoneH];
				_roleVoteMenuCommanderLabel ctrlSetText "Ground Commander";
				_roleVoteMenuCommanderLabel ctrlSetFontHeight 1.5 * GUI_GRID_H;
				_roleVoteMenuCommanderLabel ctrlCommit 0;

				_roleVoteMenuCmdPic = MAZ_RS_rolesSystemVoteMenu ctrlCreate ["RscPicture",1201];
				_roleVoteMenuCmdPic ctrlSetPosition [0.479375 * safezoneW + safezoneX,0.379 * safezoneH + safezoneY,0.0360937 * safezoneW,0.066 * safezoneH];
				_roleVoteMenuCmdPic ctrlSetText "\A3\Ui_f\data\GUI\Cfg\Ranks\captain_gs.paa";
				_roleVoteMenuCmdPic ctrlCommit 0;

				_roleVoteMenuCmdDesc = MAZ_RS_rolesSystemVoteMenu ctrlCreate ["RscStructuredText",1101];
				_roleVoteMenuCmdDesc ctrlSetPosition [0.474219 * safezoneW + safezoneX,0.456 * safezoneH + safezoneY,0.165 * safezoneW,0.165 * safezoneH];
				_roleVoteMenuCmdDesc ctrlSetStructuredText parseText "The Ground Commander is able to call in supports for the team and has access to Global Chat to speak to High Command. They are one of the Squad Leaders and will remain Ground Commander until they disconnect, are removed by High Command, or step down.";
				_roleVoteMenuCmdDesc ctrlCommit 0;
			
			comment "List and Button";

				MAZ_RS_roleSystemVoteMenuList = MAZ_RS_rolesSystemVoteMenu ctrlCreate ["RscListbox",1500];
				MAZ_RS_roleSystemVoteMenuList ctrlSetPosition [0.360781 * safezoneW + safezoneX,0.39 * safezoneH + safezoneY,0.0979687 * safezoneW,0.176 * safezoneH];
				MAZ_RS_roleSystemVoteMenuList ctrlCommit 0;

				MAZ_RS_roleSystemVoteMenuVoteButton = MAZ_RS_rolesSystemVoteMenu ctrlCreate ["RscButton",1600];
				MAZ_RS_roleSystemVoteMenuVoteButton ctrlSetPosition [0.365937 * safezoneW + safezoneX,0.599 * safezoneH + safezoneY,0.0825 * safezoneW,0.033 * safezoneH];
				MAZ_RS_roleSystemVoteMenuVoteButton ctrlSetText "Vote";
				MAZ_RS_roleSystemVoteMenuVoteButton ctrlSetBackgroundColor [0,0,0,0.8];
				MAZ_RS_roleSystemVoteMenuVoteButton ctrlAddEventHandler ["ButtonClick",{
					[uiNamespace getVariable "MAZ_RS_roleSystemVoteMenuList"] call MAZ_RS_fnc_castCommanderVote;
				}];
				MAZ_RS_roleSystemVoteMenuVoteButton ctrlCommit 0;
		};
		[] spawn MAZ_RS_fnc_updateVotingMenu;
	};

	MAZ_RS_fnc_voteForGroundCommander = {
		params ["_voteTime"];
		if(!isNil "MAZ_RS_Key_VoteCommander") then {
			[MAZ_RS_Key_VoteCommander] call MAZ_fnc_removeKeybind;
			MAZ_RS_Key_VoteCommander = nil;
		};
		MAZ_RS_Key_VoteCommander = ["Vote Commander","Vote for the Ground Command.",10,{[] spawn MAZ_RS_fnc_voteForGroundCommanderMenu;},false,true] call MAZ_fnc_newKeybind;
		["Time to vote for a Ground Commander. Do so by pressing CTRL + 9.","RscDisplayCurator_error03"] call MAZ_RS_fnc_roleSystemMessage;
		if(_voteTime > 60) then {
			sleep (_voteTime - 60);
			["Only 60 seconds left to vote for a Commander! Do so by pressing CTRL + 9.","RscDisplayCurator_error03"] call MAZ_RS_fnc_roleSystemMessage;
			sleep 60;
		} else {
			sleep _voteTime;
		};
		if(!isNil "MAZ_RS_Key_VoteCommander") then {
			[MAZ_RS_Key_VoteCommander] call MAZ_fnc_removeKeybind;
			MAZ_RS_Key_VoteCommander = nil;
		};
		["A Commander has been chosen!","RscDisplayCurator_error03"] call MAZ_RS_fnc_roleSystemMessage;
	};

	MAZ_RS_fnc_executeOnNextRespawn = {
		waitUntil {missionNamespace getVariable ["BIS_RscRespawnControlsMap_shown", false]};
		waitUntil {!(missionNamespace getVariable ["BIS_RscRespawnControlsMap_shown", false])};
		sleep 0.1;
		[] spawn _this;
	};

	MAZ_RS_fnc_rolesSystemEventhandlers = {
		waitUntil {uisleep 0.1;!isNull (findDisplay 46) && alive player};
		sleep 0.1;
		MAZ_RS_isRecentSpawn = true;
		MAZ_RS_CommanderSupportsCooldown = false;
		if(!isNil "MAZ_RS_roles_GetInManEH") then {
			player removeEventHandler ["GetInMan",MAZ_RS_roles_GetInManEH];
		};
		MAZ_RS_roles_GetInManEH = player addEventhandler ["GetInMan",{
			params ["_unit", "_role", "_vehicle", "_turret"];
			if(typeOf _vehicle == "Steerable_Parachute_F") exitWith {};
			private _playerRole = player getVariable ["MAZ_RS_roles_role","Recruit"];
			if(_vehicle isKindOf "Plane") then {
				if(MAZ_RS_isRecentSpawn && _playerRole != "Pilot" && (_role != "cargo" && (_turret isNotEqualTo [1] && _turret isNotEqualTo [2]))) exitWith {
					moveOut player;
					player moveInCargo _vehicle;
				};
				if(_playerRole != "Pilot" && (_role != "cargo" && (_turret isNotEqualTo [1] && _turret isNotEqualTo [2]))) then {
					moveOut player;
					["You're not a pilot, you can't fly this thing!","addItemFailed"] call MAZ_RS_fnc_roleSystemMessage;
				};
			};
			if(_vehicle isKindOf "Helicopter") then {
				if(MAZ_RS_isRecentSpawn && _playerRole != "Heli Pilot" && (_role == "driver" || player call fn_isUnitCopilot)) exitWith {
					moveOut player;
					player moveInCargo _vehicle;
				};
				if((_role == "driver" || player call fn_isUnitCopilot) && _playerRole != "Heli Pilot") then {
					moveOut player;
					["You're not a pilot, you can't fly this thing!","addItemFailed"] call MAZ_RS_fnc_roleSystemMessage;
				};
			};
			if(_vehicle isKindOf "Wheeled_APC_F" || _vehicle isKindOf "Tank") then {
				if((_role == "driver" || _turret isEqualTo [0] || _turret isEqualTo [0,0]) && _playerRole != "Crewman") then {
					moveOut player;
					["You're not a crewman, you can't operate this thing!","addItemFailed"] call MAZ_RS_fnc_roleSystemMessage;
				};
			};
		}];
		MAZ_RS_roles_SeatSwitchedManEH = player addEventHandler ["SeatSwitchedMan", {
			params ["_unit1", "_unit2", "_vehicle"];
			private _playerRole = player getVariable ["MAZ_RS_roles_role","Recruit"];
			(assignedVehicleRole player) params ["_role",["_turretPath",[]]];

			if(_vehicle isKindOf "Plane") then {
				if(_playerRole != "Pilot" && (_role != "cargo" && (_turretPath isNotEqualTo [1] && _turretPath isNotEqualTo [2]))) then {
					moveOut player;
					player moveInCargo _vehicle;
					["You're not a pilot, you can't fly this thing!","addItemFailed"] call MAZ_RS_fnc_roleSystemMessage;
				};
			};
			if(_vehicle isKindOf "Wheeled_APC_F" || _vehicle isKindOf "Tank") then {
				if((_role == "driver" && _playerRole != "Crewman") || (((_turretPath isEqualTo [0] && _role == "turret") || (_turretPath isEqualTo [0,0] && _role == "turret")) && _playerRole != "Crewman")) then {
					moveOut player;
					player moveInCargo _vehicle;
					["You're not a crewman, you can't drive this thing!","addItemFailed"] call MAZ_RS_fnc_roleSystemMessage;
				};
			};
		}];
		MAZ_RS_roles_RespawnEH = player addEventHandler ["Respawn",{
			[] spawn {
				MAZ_RS_isRecentSpawn = true;
				["If you change roles within 30 seconds you will be set to a default role loadout."] call MAZ_RS_fnc_roleSystemMessage;
				sleep 30;
				MAZ_RS_isRecentSpawn = false;
			};
			if(isNil "MAZ_RS_roles_oldRole") then {
				MAZ_RS_roles_oldRole = player getVariable ["MAZ_RS_roles_role","Recruit"];
			};
			private _changeRole = player getVariable "MAZ_RS_newRoleRespawn";
			if(!isNil "_changeRole") then {
				player setVariable ["MAZ_RS_roles_role",_changeRole,true];
				player setVariable ["MAZ_RS_newRoleRespawn",nil,true];
			};
			private _currentRole = player getVariable ["MAZ_RS_roles_role","Recruit"];
			if(MAZ_RS_roles_oldRole != _currentRole) then {
				["Your role was changed! A default loadout has been supplied.","addItemFailed"] call MAZ_RS_fnc_roleSystemMessage;
				_currentRole spawn {
					waitUntil {!isNull (findDisplay 46) && alive player};
					sleep 0.5;
					[_this] call MAZ_RS_fnc_randomFromEquipment;
				};
			} else {
				if(isNil "MAZ_RS_roles_respawnLoadout") then {
					_currentRole spawn {
						waitUntil {!isNull (findDisplay 46) && alive player};
						sleep 0.5;
						[_this] call MAZ_RS_fnc_randomFromEquipment;
					};
				} else {
					[] spawn {
						waitUntil {!isNull (findDisplay 46) && alive player};
						sleep 0.5;
						player setUnitLoadout MAZ_RS_roles_respawnLoadout;
						player setVehicleAmmo 1;
					};
				};
			};
		}];
		MAZ_RS_roles_KilledEH = player addEventHandler ["Killed",{
			params ["_unit", "_killer", "_instigator", "_useEffects"];
			MAZ_RS_roles_respawnLoadout = getUnitLoadout _unit;
			MAZ_RS_roles_oldRole = player getVariable ["MAZ_RS_roles_role","Recruit"];
		}];
		MAZ_RS_roles_SuppressedEH = player addEventHandler ["Suppressed",{
			if(MAZ_RS_isRecentSpawn) then {
				MAZ_RS_isRecentSpawn = false;
				["You're suppressed! Changing loadouts will no longer change your equipment."] call MAZ_RS_fnc_roleSystemMessage;
			};
		}];
		MAZ_RS_roles_takeEH = player addEventhandler ["Take",{
			params ["_unit", "_container", "_item"];
			private _role = _unit getVariable ["MAZ_RS_roles_role","Recruit"];
			if(_item isKindOf ["Rifle", configFile >> "CfgWeapons"] || _item isKindOf ["Launcher", configFile >> "CfgWeapons"]) then {
				_role = [_role] call MAZ_RS_fnc_formatRoleName;
				private _variableNameWeapons = format ["MAZ_RS_%1_%2_%3_Weapons",side (group _unit),worldName,_role];
				private _weaponsList = missionNamespace getVariable _variableNameWeapons;
				if(!isNil "_weaponsList") then {
					if(!(_item in _weaponsList)) then {
						private _weaponData = weaponsItems _unit;
						_weaponData = _weaponData select (count _weaponData - 1);
						[_container,_item,_weaponData] call MAZ_RS_fnc_dropWeapon;
						["Your current role cannot have that weapon!","addItemFailed"] call MAZ_RS_fnc_roleSystemMessage;
						player playAction "gestureNo";
					};
				};
			};
			if(_item == "Medikit" && _role != "Medic") then {
				[_container,_item] call MAZ_RS_fnc_dropItem;
				player playAction "gestureNo";
			};
			if(_item == "ToolKit" && (_role != "Crewman" && _role != "Heli Pilot" && _role != "Engineer")) then {
				[_container,_item] call MAZ_RS_fnc_dropItem;
				player playAction "gestureNo";
			};
			if(_item == "MineDetector" && (_role != "Engineer")) then {
				[_container,_item] call MAZ_RS_fnc_dropItem;
				player playAction "gestureNo";
			};
			if(_item == "FirstAidKit") then {
				private _countFAKs = {_x == "FirstAidKit"} count (items _unit);
				if(_countFAKs > 3 && _role != "Medic") exitWith {
					for "_i" from 0 to (_countFAKs - 4) do {
						[_container,_item] call MAZ_RS_fnc_dropItem;
					};
					player playAction "gestureNo";
				};
				if(_countFAKs > 10 && _role == "Medic") then {
					for "_i" from 0 to (_countFAKs - 11) do {
						[_container,_item] call MAZ_RS_fnc_dropItem;
					};
					player playAction "gestureNo";
				};
			};
			private _laserDesignators = ["Laserdesignator","Laserdesignator_01_khk_F","Laserdesignator_02","Laserdesignator_02_ghex_F","Laserdesignator_03"];
			if(_item in _laserDesignators && _role != "Squad Leader") then {
				[_container,_item] call MAZ_RS_fnc_dropItem;
				player removeWeapon _item;
			};
			if(_item == "Rangefinder" && (_role != "Marksman" && _role != "Sharpshooter")) then {
				[_container,_item] call MAZ_RS_fnc_dropItem;
				player removeWeapon _item;
			};
		}];
		if (!isNil 'MAZ_RS_SEH_ArsenalClosed_Load') then {
			[ missionNamespace, "arsenalOpened", MAZ_RS_SEH_ArsenalClosed_Load] call BIS_fnc_removeScriptedEventHandler; 
		};
		MAZ_RS_SEH_ArsenalClosed_Load = [ missionNamespace, "arsenalOpened", {
			[] spawn MAZ_RS_fnc_disableArsenalLoadExec;
		}] call BIS_fnc_addScriptedEventHandler;
		if (!isNil 'MAZ_RS_SEH_ArsenalClosed_CheckGear') then {
			[ missionNamespace, "arsenalClosed", MAZ_RS_SEH_ArsenalClosed_CheckGear] call BIS_fnc_removeScriptedEventHandler; 
		};
		MAZ_RS_SEH_ArsenalClosed_CheckGear = [missionNamespace, "arsenalClosed", {
			call MAZ_RS_fnc_checkEquipmentArsenalClosed;
		}] call BIS_fnc_addScriptedEventHandler;
	};

	MAZ_RS_fnc_IWantToLeave = {
		onEachFrame { 
			private _displays = allDisplays; 
			private _indexMission = _displays find (findDisplay 46); 
			_displays = _displays select [_indexMission,count(_displays)]; 
			reverse _displays; 
			{_x closeDisplay 2} forEach _displays;  

			onEachFrame { 
				(findDisplay 50) closeDisplay 2; 
				(findDisplay 70) closeDisplay 2; 
			}; 
		}; 
	};

	MAZ_RS_fnc_switchToCommanderDiaryRecord = {
		["[RS] - System Info","[RS] - Ground Commander"] call MAZ_RS_fnc_selectDiarySubject;
	};

	MAZ_RS_fnc_updateCommanderDiaryRecord = {
		while {MAZ_RS_enabled} do {
			private _nameBlu = [west] call MAZ_RS_fnc_getSideCommander;
			if(_nameBlu isEqualType false) then {
				_nameBlu = "None";
			} else {
				_nameBlu = name _nameBlu;
			};
			private _nameOpf = [east] call MAZ_RS_fnc_getSideCommander;
			if(_nameOpf isEqualType false) then {
				_nameOpf = "None";
			} else {
				_nameOpf = name _nameOpf;
			};
			private _nameInd = [independent] call MAZ_RS_fnc_getSideCommander;
			if(_nameInd isEqualType false) then {
				_nameInd = "None";
			} else {
				_nameInd = name _nameInd;
			};
			player setDiaryRecordText [["ZAM_RS_Diary",MAZ_RS_CommanderDiaryRecord],["[RS] - Ground Commander",format ["<font color='#db8727' size='18' face='PuristaSemibold'>Ground Commander</font><br></br><font color='#db8727' size='16' face='PuristaMedium'>The Ground Commander is a Squad Leader voted for by each team</font><font size='16' face='PuristaMedium'>. The Commander has access to support from HQ and can speak in Global chat to High Command and Side chat. </font><br/><br/><font color='#db8727' size='18' face='PuristaSemibold'>Using HQ Supports</font><br/><font size='16' face='PuristaMedium'>Commanders can call in support by </font><font color='#db8727' size='16' face='PuristaMedium'>pressing 0, then 8</font><font size='16' face='PuristaMedium'>. When calling the supports you </font><font color='#db8727' size='16' face='PuristaMedium'>must have a laser designator equipped and turned on</font><font size='16' face='PuristaMedium'>. Wherever the laser is pointed is where the supports will go to.</font><br/><br/><font size='16' face='PuristaMedium'>Alternatively, you may open the map and hover over where you want the supports. </font><font color='#db8727' size='16' face='PuristaMedium'>This is limited to 2,500m from your position</font><font size='16' face='PuristaMedium'>.</font><br/><br/><font color='#db8727' size='18' face='PuristaSemibold'>Available Supports</font><br/><font size='16' face='PuristaMedium'>UAV Recon, 82mm Mortars, CAS (Gun), CAS (Missiles), CAS (Bomb).</br></font><br/><br/><font color='#db8727' size='18' face='PuristaSemibold'>Current Commanders</font><br/><font color='#004C99' size='16' face='PuristaMedium'>BLUFOR: </font><font size='16' face='PuristaMedium'>%1</font><br/><font color='#800000' size='16' face='PuristaMedium'>OPFOR: </font><font size='16' face='PuristaMedium'>%2</font><br/><font color='#008000' size='16' face='PuristaMedium'>INDEP: </font><font size='16' face='PuristaMedium'>%3</font>",_nameBlu,_nameOpf,_nameInd]]];
			sleep 1;
		};
	};

	MAZ_RS_fnc_createDiaryRecords = {
		waitUntil {uisleep 0.1;!isNull (findDisplay 46) && alive player};
		sleep 0.1;
		player createDiarySubject ["ZAM_RS_Diary","[RS] - System Info"];
		MAZ_RS_CommanderDiaryRecord = player createDiaryRecord ["ZAM_RS_Diary",["[RS] - Ground Commander","If you see this you broke something lol"]];
		MAZ_RS_OverviewDiaryRecord = player createDiaryRecord ["ZAM_RS_Diary",["[RS] - Roles System Overview","<font color='#db8727' size='18' face='PuristaSemibold'>Roles System Overview</font><br></br><font color='#db8727' size='16' face='PuristaMedium'>ZAM’s Roles System (RS)</font><font size='16' face='PuristaMedium'> was designed to incentivize teamplay and coordination between those in groups together. You will be (practically) forced to join a group with others as if you are alone you will be forced as a ‘Recruit’ role which has poor weaponry, no access to the arsenal, and limited ammo. You can change your role by pressing </font><font color='#db8727' size='16' face='PuristaMedium'>Ctrl + 8</font><font size='16' face='PuristaMedium'>.</font><br/><br/><font color='#db8727' size='18' face='PuristaSemibold'>Roles Breakdown</font><br/><font size='16' face='PuristaMedium'>Joining a group gives you access to all </font><font color='#db8727' size='16' face='PuristaMedium'>basic roles</font><font size='16' face='PuristaMedium'>: Rifleman, Medic (two max), Crewman, Pilots, and Squad Leader. <br/>The </font><font color='#0F9C36' size='16' face='PuristaMedium'>Specialist roles</font><font size='16' face='PuristaMedium'> are unlocked once a group has 5 members (two max): Autorifleman, Light Anti-Tank, Marksman, and Grenadier. <br/>The </font><font color='#0F789C' size='16' face='PuristaMedium'>Support roles</font><font size='16' face='PuristaMedium'> are unlocked when the group has 7 members (one max): Heavy Gunner, Heavy Anti-Tank, and Sharpshooter. </font><br/><br/><font color='#db8727' size='18' face='PuristaSemibold'>Role Limitations</font><br/><font size='16' face='PuristaMedium'>Depending on your role you will be limited to certain equipment and weapons. In addition, if you are not a crewman or pilot role you cannot enter the respective vehicles as a crewmember. You can carry extra mags for your teammates who have different roles, however, you </font><font color='#db8727' size='16' face='PuristaMedium'>cannot pick up their weapons</font><font size='16' face='PuristaMedium'>.</font><br/><br/><font color='#db8727' size='18' face='PuristaSemibold'>Ground Commander</font><br/><font size='16' face='PuristaMedium'>Ground Commanders are Squad Leaders voted by the rest of the players. <execute expression='call MAZ_RS_fnc_switchToCommanderDiaryRecord'>More information.</execute><br/><br/><font color='#db8727' size='18' face='PuristaSemibold'>Click here to close the map.</font><font size='16' face='PuristaSemibold'><br/><executeClose expression='openMap [false,false]; MAZ_RS_isAccepted = true;'>I Understand.</executeClose><br/><executeClose expression='[] spawn MAZ_RS_fnc_IWantToLeave'>I Wish to Leave.</executeClose></font>"]];
		[] spawn MAZ_RS_fnc_updateCommanderDiaryRecord;
	};

	MAZ_RS_fnc_zeusLoop = {
		while {MAZ_RS_enabled} do {
			waitUntil {uiSleep 0.01; (!isNull (findDisplay 312))};
			missionNamespace setVariable ['MAZ_RS_modulesList', []];
			call MAZ_RS_fnc_addZeusEH;
			[] spawn MAZ_RS_fnc_addModuleTreeTracker;
			call MAZ_RS_fnc_addRolesModules;
			waitUntil {uiSleep 0.1; (isNull (findDisplay 312))};
		};
	};

	MAZ_RS_fnc_addZeusEH = {
		private _zeusLogic = objNull;
		private _zeusLogic = getAssignedCuratorLogic player;
		if (isNull _zeusLogic) exitWith {};

		if((_zeusLogic getVariable ["MAZ_RS_zeus_objectPlaced",-200]) != -200) then {
			_zeusLogic removeEventHandler ['CuratorObjectPlaced',(_zeusLogic getVariable 'MAZ_RS_zeus_objectPlaced')];
		};
		_zeusLogic setVariable [
			"MAZ_RS_zeus_objectPlaced",
			_zeusLogic addEventHandler [
				'CuratorObjectPlaced',
				MAZ_RS_fnc_zeusHandlePlace
			]
		];
	};

	MAZ_RS_fnc_addModuleTreeTracker = {
		if(!isNil "MAZ_RS_CEH_TreeSelChanged_rolesModulePath") then {
			(findDisplay 312) displayCtrl 280 ctrlRemoveEventhandler ["TreeSelChanged",MAZ_RS_CEH_TreeSelChanged_rolesModulePath];
		};
		MAZ_RS_CEH_TreeSelChanged_rolesModulePath = ((findDisplay 312) displayCtrl 280) ctrlAddEventHandler ["TreeSelChanged",{
			params ["_control", "_selectionPath"];
			with uiNamespace do {
				if (_selectionPath isEqualTo []) exitWith {};
				MAZ_RS_moduleSelection = _selectionPath;
			};
		}];
	};

	MAZ_RS_fnc_zeusHandlePlace = {
		params ["_curator", "_entity"];
		private _entityType = typeOf _entity;
		switch (_entityType) do {
			case 'ModuleEmpty_F': {
				private _parentTree = (findDisplay 312) displayCtrl 280;
				private _selection = uiNamespace getVariable ["MAZ_RS_moduleSelection",[]];
				_entity spawn {
					sleep 0.1;
					waitUntil {(findDisplay -1) isEqualTo displayNull};
					sleep 0.25;
					deleteVehicle _this;
				};
				if(_selection isEqualTo []) exitWith {};
				[_parentTree,_selection] call MAZ_RS_fnc_zeusHandleFunction;
				[_parentTree,_selection] spawn {
					params ['_parentTree', '_tvModulePath'];
					_parentTree tvSetPictureColor [_tvModulePath, [0.86,0.53,0.15,1]];
					uiSleep 0.5;
					_parentTree tvSetPictureColor [_tvModulePath, [1,1,1,1]];
				};
			};
			default {};
		};
	};

	MAZ_RS_fnc_zeusHandleFunction = {
		params ["_control", "_selectionPath"];
		private _val = _control tvData _selectionPath;
		switch (_val) do {
			case 'ModuleEmpty_F': {
				private _index = MAZ_RS_modulesList findIf {(_x select 0) isEqualTo _selectionPath};
				if(_index <= -1) exitWith {};
				private _function = missionNamespace getVariable [MAZ_RS_modulesList select _index select 1,{}];

				private _targetObjArray = curatorMouseOver;
				if ((_targetObjArray isEqualTo []) or (_targetObjArray isEqualTo [''])) then {
					[objNull] call _function;
				} else {
					_targetObj = _targetObjArray select 1;
					[_targetObj] call _function;
				};
			};
			default {};
		};
	};

	MAZ_RS_fnc_addRolesModules = {
		private _fnc = {
			params [
				['_parentTree', findDisplay 312 displayCtrl 280],
				['_parentCategory', 1],
				['_moduleName', '[ Module ]'],
				['_moduleTip', '[ Placeholder ]'],
				['_moduleFunction', 'JAM_fnc_nullFunction'],
				['_iconPath', '\a3\ui_f_curator\Data\Displays\RscDisplayCurator\modeModules_ca.paa'],
				['_textColor', [1,1,1,1]],
				['_iconColor', [1,1,1,1]],
				['_iconColorSelected', [0,0,0,1]],
				['_iconColorDisabled', [0.8,0,0,0.8]]
			];
			
			comment "Setup functions";
			private _cindex = _parentTree tvAdd [[_parentCategory], _moduleName];
			private _path = [_parentCategory,_cindex];
			private _functionArray = missionNamespace getVariable ['MAZ_RS_modulesList', []];
			private _functionData = [_path,_moduleFunction];
			private _functionIndex = _functionArray pushBack _functionData;
			missionNamespace setVariable ['MAZ_RS_modulesList', _functionArray];
			
			comment "Add modules";
			_moduleTip = format ['%1\n\nRS Function ID:\n%2', _moduleTip, str _functionIndex];
			_parentTree tvSetTooltip [_path,_moduleTip];
			_parentTree tvSetPicture [_path, _iconPath];
			_parentTree tvSetData [_path, 'ModuleEmpty_F'];
			_parentTree tvSetPictureColor [_path, _iconColor];
			_parentTree tvSetColor [_path, _textColor];
			comment "_parentTree tvSetPictureColorSelected [_path, _iconColorSelected];";
			comment "_parentTree tvSetPictureColorDisabled [_path, _iconColorDisabled];";
			_parentTree ctrlCommit 0;
			_path;
		};
		private _modulesTree = findDisplay 312 displayCtrl 280;
		private _pindex = _modulesTree tvAdd [[], "[RS] Roles System"];
		_modulesTree tvSetPictureRight [[_pindex],""];
		_modulesTree tvSetTooltip [[_pindex],"Modules relating to the Roles System."];

		[_modulesTree,_pindex,"Select Commander","Sets the player who this module is placed onto as the Ground Commander for their respective side.","MAZ_RS_fnc_addCommanderZeus"] call _fnc;
		[_modulesTree,_pindex,"Start Commander Vote","Starts a vote or a Ground Commander for a specific side for some time.","MAZ_RS_fnc_startCommanderVoteZeus"] call _fnc;
		[_modulesTree,_pindex,"Remove Side Commander","Removes the current Ground Commander from the selected side.","MAZ_RS_fnc_removeCommanderZeus"] call _fnc;
		[_modulesTree,_pindex,"Toggle VoN Limitation","Toggles limitation of VoN for non-squad leaders.","MAZ_RS_fnc_toggleVoNLimit"] call _fnc;
	};

	MAZ_RS_fnc_addCommanderZeus = {
		params ["_entity"];
		if(isNull _entity || !((typeOf _entity) isKindOf "Man")) exitWith {["Unit is not suitable.","addItemFailed"] call MAZ_RS_fnc_roleSystemMessage;};
		if !(isPlayer _entity) exitWith {["Unit must be a player.","addItemFailed"] call MAZ_RS_fnc_roleSystemMessage;};
		[_entity, side (group _entity)] spawn MAZ_RS_fnc_addCommander;
		[format ["%1 has been made to the Commander of his side!",name _entity],"addItemOk"] call MAZ_RS_fnc_roleSystemMessage;
	};

	MAZ_RS_fnc_startCommanderVoteZeus = {
		params ["_entity"];
		with uinamespace do {
			createDialog "RscDisplayEmpty";
			showchat true;
			private _display = findDisplay -1;

			MAZ_RS_voteSideSelected = west;
			
			_RscFrame_1800 = _display ctrlCreate ["RscFrame", 1800];
			_RscFrame_1800 ctrlSetPosition [0.355625 * safezoneW + safezoneX, 0.335 * safezoneH + safezoneY, 0.28875 * safezoneW, 0.165 * safezoneH];
			_RscFrame_1800 ctrlCommit 0;

			MAZ_RS_voteCreatorBG = _display ctrlCreate ["RscPicture", 1200];
			MAZ_RS_voteCreatorBG ctrlSetText "#(argb,8,8,3)color(0,0,0.1,0.5)";
			MAZ_RS_voteCreatorBG ctrlSetPosition [0.355625 * safezoneW + safezoneX, 0.335 * safezoneH + safezoneY, 0.28875 * safezoneW, 0.165 * safezoneH];
			MAZ_RS_voteCreatorBG ctrlCommit 0;

			_RscFrame_1801 = _display ctrlCreate ["RscFrame", 1801];
			_RscFrame_1801 ctrlSetText "Side";
			_RscFrame_1801 ctrlSetPosition [0.360781 * safezoneW + safezoneX, 0.346 * safezoneH + safezoneY, 0.278437 * safezoneW, 0.066 * safezoneH];
			_RscFrame_1801 ctrlCommit 0;

			_RscButtonMenu_2401 = _display ctrlCreate ["RscButtonMenu", 2401];
			_RscButtonMenu_2401 ctrlSetText "INDEPENDENT";
			_RscButtonMenu_2401 ctrlSetPosition [0.551563 * safezoneW + safezoneX, 0.357 * safezoneH + safezoneY, 0.0825 * safezoneW, 0.044 * safezoneH];
			_RscButtonMenu_2401 ctrlSetTextColor [1,1,1,1];
			_RscButtonMenu_2401 ctrlSetBackgroundColor [0,0.5,0,0.8];
			_RscButtonMenu_2401 ctrlAddEventHandler ["ButtonClick", {
				params ["_control"];
				MAZ_RS_voteSideSelected = independent;
				with uinamespace do {
					MAZ_RS_voteCreatorBG ctrlSetText "#(argb,8,8,3)color(0,0.1,0,0.5)";
				};
			}];
			_RscButtonMenu_2401 ctrlCommit 0;

			_RscButtonMenu_2400 = _display ctrlCreate ["RscButtonMenu", 2400];
			_RscButtonMenu_2400 ctrlSetText "WEST";
			_RscButtonMenu_2400 ctrlSetPosition [0.365937 * safezoneW + safezoneX, 0.357 * safezoneH + safezoneY, 0.0825 * safezoneW, 0.044 * safezoneH];
			_RscButtonMenu_2400 ctrlSetBackgroundColor [0,0,0.5,0.8];
			_RscButtonMenu_2400 ctrlAddEventHandler ["ButtonClick", {
				params ["_control"];
				MAZ_RS_voteSideSelected = west;
				with uinamespace do {
					MAZ_RS_voteCreatorBG ctrlSetText "#(argb,8,8,3)color(0,0,0.1,0.5)";
				};
			}];
			_RscButtonMenu_2400 ctrlCommit 0;

			_RscButtonMenu_2402 = _display ctrlCreate ["RscButtonMenu", 2402];
			_RscButtonMenu_2402 ctrlSetText "EAST";
			_RscButtonMenu_2402 ctrlSetPosition [0.45875 * safezoneW + safezoneX, 0.357 * safezoneH + safezoneY, 0.0825 * safezoneW, 0.044 * safezoneH];
			_RscButtonMenu_2402 ctrlSetBackgroundColor [0.5,0,0,0.8];
			_RscButtonMenu_2402 ctrlAddEventHandler ["ButtonClick", {
				params ["_control"];
				MAZ_RS_voteSideSelected = east;
				with uinamespace do {
					MAZ_RS_voteCreatorBG ctrlSetText "#(argb,8,8,3)color(0.1,0,0,0.5)";
				};
			}];
			_RscButtonMenu_2402 ctrlCommit 0;

			_RscText_1000 = _display ctrlCreate ["RscText", 1000];
			_RscText_1000 ctrlSetText "Start Vote for Commander";
			_RscText_1000 ctrlSetPosition [0.355625 * safezoneW + safezoneX, 0.311 * safezoneH + safezoneY, 0.28875 * safezoneW, 0.022 * safezoneH];
			_RscText_1000 ctrlSetBackgroundColor [0.86,0.53,0.15,1];
			_RscText_1000 ctrlCommit 0;

			MAZ_RS_voteCreatorSlider = _display ctrlCreate ["RscSlider", 1900];
			MAZ_RS_voteCreatorSlider ctrlSetPosition [0.365938 * safezoneW + safezoneX, 0.445 * safezoneH + safezoneY, 0.216563 * safezoneW, 0.033 * safezoneH];
			MAZ_RS_voteCreatorSlider sliderSetRange [60,300];
			MAZ_RS_voteCreatorSlider sliderSetPosition 60;
			MAZ_RS_voteCreatorSlider ctrlAddEventhandler ["SliderPosChanged", {
				params ["_control", "_newValue"];
				private _edit = uiNamespace getVariable "MAZ_RS_voteCreatorEdit";
				_edit ctrlSetText (str (round _newValue));
			}];
			MAZ_RS_voteCreatorSlider ctrlCommit 0;

			MAZ_RS_voteCreatorEdit = _display ctrlCreate ["RscEdit", 1400];
			MAZ_RS_voteCreatorEdit ctrlSetText "60";
			MAZ_RS_voteCreatorEdit ctrlSetPosition [0.587656 * safezoneW + safezoneX, 0.434 * safezoneH + safezoneY, 0.0464063 * safezoneW, 0.033 * safezoneH];
			MAZ_RS_voteCreatorEdit ctrlSetTooltip "Time in seconds to vote.";
			MAZ_RS_voteCreatorEdit ctrlAddEventhandler ["EditChanged", {
				params ["_control", "_newText"];
				private _chars = _newText splitString "";
				private _charsNew = _chars;
				{
					if !(_x in ["0","1","2","3","4","5","6","7","8","9"]) then {
						_chars deleteAt _forEachIndex;
					};
				}forEach _chars;
				_charsNew = _charsNew joinString "";
				private _number = parseNumber _charsNew;
				_number = [_number, 60, 300] call BIS_fnc_clamp;
				_control ctrlSetText (str _number);

				private _slider = uiNamespace getVariable "MAZ_RS_voteCreatorSlider";
				_slider sliderSetPosition _number;
			}];
			MAZ_RS_voteCreatorEdit ctrlCommit 0;

			_RscFrame_1802 = _display ctrlCreate ["RscFrame", 1802];
			_RscFrame_1802 ctrlSetText "Vote Time";
			_RscFrame_1802 ctrlSetPosition [0.360781 * safezoneW + safezoneX, 0.423 * safezoneH + safezoneY, 0.278437 * safezoneW, 0.066 * safezoneH];
			_RscFrame_1802 ctrlCommit 0;

			_RscButtonMenu_2403 = _display ctrlCreate ["RscButtonMenu", 2403];
			_RscButtonMenu_2403 ctrlSetText "CANCEL";
			_RscButtonMenu_2403 ctrlSetPosition [0.355625 * safezoneW + safezoneX,0.501 * safezoneH + safezoneY,0.061875 * safezoneW,0.022 * safezoneH];
			_RscButtonMenu_2403 ctrlSetBackgroundColor [0,0,0,0.9];
			_RscButtonMenu_2403 ctrlAddEventHandler ["ButtonClick", {
				params ["_control"];
			 	(ctrlParent _control) closeDisplay 0;
			}];
			_RscButtonMenu_2403 ctrlCommit 0;

			_RscButtonMenu_2404 = _display ctrlCreate ["RscButtonMenu", 2404];
			_RscButtonMenu_2404 ctrlSetText "START";
			_RscButtonMenu_2404 ctrlSetPosition [0.5825 * safezoneW + safezoneX,0.501 * safezoneH + safezoneY,0.061875 * safezoneW,0.022 * safezoneH];
			_RscButtonMenu_2404 ctrlSetBackgroundColor [0,0,0,0.9];
			_RscButtonMenu_2404 ctrlAddEventHandler ["ButtonClick", {
				params ["_control"];
			 	private _slider = uinamespace getVariable "MAZ_RS_voteCreatorSlider";
				private _time = sliderPosition _slider;
				private _side = uiNamespace getVariable "MAZ_RS_voteSideSelected";
				[round _time,_side] spawn MAZ_RS_fnc_startCommanderVote;
				(ctrlParent _control) closeDisplay 0;
			}];
			_RscButtonMenu_2404 ctrlCommit 0;
		};
	};

	MAZ_RS_fnc_removeCommanderZeus = {
		params ["_entity"];
		with uiNamespace do {
			createDialog "RscDisplayEmpty";
			showchat true;
			private _display = findDisplay -1;

			MAZ_RS_removeCommanderSideSelected = west;
			
			_RscFrame_1800 = _display ctrlCreate ["RscFrame", 1800];
			_RscFrame_1800 ctrlSetPosition [0.355625 * safezoneW + safezoneX, 0.335 * safezoneH + safezoneY, 0.28875 * safezoneW, 0.088 * safezoneH];
			_RscFrame_1800 ctrlCommit 0;

			MAZ_RS_removeCommanderBG = _display ctrlCreate ["RscPicture", 1200];
			MAZ_RS_removeCommanderBG ctrlSetText "#(argb,8,8,3)color(0,0,0.1,0.5)";
			MAZ_RS_removeCommanderBG ctrlSetPosition [0.355625 * safezoneW + safezoneX, 0.335 * safezoneH + safezoneY, 0.28875 * safezoneW, 0.088 * safezoneH];
			MAZ_RS_removeCommanderBG ctrlCommit 0;

			_RscFrame_1801 = _display ctrlCreate ["RscFrame", 1801];
			_RscFrame_1801 ctrlSetText "Side";
			_RscFrame_1801 ctrlSetPosition [0.360781 * safezoneW + safezoneX, 0.346 * safezoneH + safezoneY, 0.278437 * safezoneW, 0.066 * safezoneH];
			_RscFrame_1801 ctrlCommit 0;

			_RscButtonMenu_2401 = _display ctrlCreate ["RscButtonMenu", 2401];
			_RscButtonMenu_2401 ctrlSetText "INDEPENDENT";
			_RscButtonMenu_2401 ctrlSetPosition [0.551563 * safezoneW + safezoneX, 0.357 * safezoneH + safezoneY, 0.0825 * safezoneW, 0.044 * safezoneH];
			_RscButtonMenu_2401 ctrlSetTextColor [1,1,1,1];
			_RscButtonMenu_2401 ctrlSetBackgroundColor [0,0.5,0,0.8];
			_RscButtonMenu_2401 ctrlAddEventHandler ["ButtonClick", {
				params ["_control"];
				MAZ_RS_removeCommanderSideSelected = independent;
				with uinamespace do {
					MAZ_RS_removeCommanderBG ctrlSetText "#(argb,8,8,3)color(0,0.1,0,0.5)";
				};
			}];
			_RscButtonMenu_2401 ctrlCommit 0;

			_RscButtonMenu_2400 = _display ctrlCreate ["RscButtonMenu", 2400];
			_RscButtonMenu_2400 ctrlSetText "WEST";
			_RscButtonMenu_2400 ctrlSetPosition [0.365937 * safezoneW + safezoneX, 0.357 * safezoneH + safezoneY, 0.0825 * safezoneW, 0.044 * safezoneH];
			_RscButtonMenu_2400 ctrlSetBackgroundColor [0,0,0.5,0.8];
			_RscButtonMenu_2400 ctrlAddEventHandler ["ButtonClick", {
				params ["_control"];
				MAZ_RS_removeCommanderSideSelected = west;
				with uinamespace do {
					MAZ_RS_removeCommanderBG ctrlSetText "#(argb,8,8,3)color(0,0,0.1,0.5)";
				};
			}];
			_RscButtonMenu_2400 ctrlCommit 0;

			_RscButtonMenu_2402 = _display ctrlCreate ["RscButtonMenu", 2402];
			_RscButtonMenu_2402 ctrlSetText "EAST";
			_RscButtonMenu_2402 ctrlSetPosition [0.45875 * safezoneW + safezoneX, 0.357 * safezoneH + safezoneY, 0.0825 * safezoneW, 0.044 * safezoneH];
			_RscButtonMenu_2402 ctrlSetBackgroundColor [0.5,0,0,0.8];
			_RscButtonMenu_2402 ctrlAddEventHandler ["ButtonClick", {
				params ["_control"];
				MAZ_RS_removeCommanderSideSelected = east;
				with uinamespace do {
					MAZ_RS_removeCommanderBG ctrlSetText "#(argb,8,8,3)color(0.1,0,0,0.5)";
				};
			}];
			_RscButtonMenu_2402 ctrlCommit 0;

			_RscText_1000 = _display ctrlCreate ["RscText", 1000];
			_RscText_1000 ctrlSetText "Remove Side Commander";
			_RscText_1000 ctrlSetPosition [0.355625 * safezoneW + safezoneX, 0.311 * safezoneH + safezoneY, 0.28875 * safezoneW, 0.022 * safezoneH];
			_RscText_1000 ctrlSetBackgroundColor [0.86,0.53,0.15,1];
			_RscText_1000 ctrlCommit 0;

			_RscButton_1600 = _display ctrlCreate ["RscButton", 1600];
			_RscButton_1600 ctrlSetText "CANCEL";
			_RscButton_1600 ctrlSetPosition [0.355625 * safezoneW + safezoneX, 0.425 * safezoneH + safezoneY, 0.061875 * safezoneW, 0.022 * safezoneH];
			_RscButton_1600 ctrlSetBackgroundColor [0,0,0,0.9];
			_RscButton_1600 ctrlAddEventHandler ["ButtonClick", {
				params ["_control"];
			 	(ctrlParent _control) closeDisplay 0;
			}];
			_RscButton_1600 ctrlCommit 0;

			_RscButton_1602 = _display ctrlCreate ["RscButton", 1602];
			_RscButton_1602 ctrlSetText "REMOVE";
			_RscButton_1602 ctrlSetPosition [0.5825 * safezoneW + safezoneX, 0.425 * safezoneH + safezoneY, 0.061875 * safezoneW, 0.022 * safezoneH];
			_RscButton_1602 ctrlSetBackgroundColor [0,0,0,0.9];
			_RscButton_1602 ctrlAddEventHandler ["ButtonClick", {
				params ["_control"];
				private _side = uiNamespace getVariable "MAZ_RS_removeCommanderSideSelected";
				[_side] spawn MAZ_RS_fnc_removeCommander;
			 	(ctrlParent _control) closeDisplay 0;
			}];
			_RscButton_1602 ctrlCommit 0;
		};
	};

	MAZ_RS_fnc_toggleVoNLimit = {
		if(MAZ_RS_LimitVoN) then {
			MAZ_RS_LimitVoN = false;
			publicVariable "MAZ_RS_LimitVoN";
		} else {
			MAZ_RS_LimitVoN = true;
			publicVariable "MAZ_RS_LimitVoN";
		};
	};
	
	if(isServer) then {
		[] spawn MAZ_RS_fnc_roleSystemLoopServerInit;
	};

	comment "Execute everywhere but server in only a multiplayer environment.";
	if(!isServer || !isMultiplayer) then {
		[] spawn MAZ_RS_fnc_createDiaryRecords;
		call MAZ_RS_fnc_createRoleEquipment;
		call MAZ_RS_fnc_rolesSystemMapEvents;
		MAZ_RS_isAccepted = true;

		[] spawn {
			waitUntil {!isNil "MAZ_fnc_newKeybind" && !isNull (findDisplay 46)};
			MAZ_RS_Key_ChangeRole = ["Change Role","Change your in-game role.",9,{[] call MAZ_RS_fnc_rolesSystemMenu;},false,true] call MAZ_fnc_newKeybind;
			comment " Ctrl + 8";
		};

		if(isNull (getAssignedCuratorLogic player)) then {
			[] spawn MAZ_RS_fnc_roleSystemInitLoop;
			[] spawn MAZ_RS_fnc_rolesSystemEventhandlers;
			{
				waitUntil {alive player};
				sleep 0.1;
				openMap [true,true];
				waitUntil {!isNil "MAZ_RS_OverviewDiaryRecord"};
				enableRadio true;
				sleep 0.1;
				MAZ_RS_isAccepted = false;
				{
					_x enableChannel [true,false];
				}forEach [0,1,2,3,4];
				["[RS] - System Info","[RS] - Roles System Overview"] call MAZ_RS_fnc_selectDiarySubject;
				[] spawn {
					while{!MAZ_RS_isAccepted} do {
						titleText ["Read the information in [RS] - System Info to exit the map.","PLAIN",-1,true,false];
						sleep 3;
					};
				};
				waitUntil {MAZ_RS_isAccepted};
				{
					_x enableChannel [true,true];	
				}forEach [0,1,2,3,4];
				MAZ_RS_roles_respawnLoadout = nil;
				private _currentRole = player getVariable ["MAZ_RS_roles_role","Recruit"];
				[_currentRole] call MAZ_RS_fnc_randomFromEquipment;
				if(getPlayerUID player in MAZ_RS_GroundCommanders) then {
					[player,side (group player)] call MAZ_RS_fnc_setupRejoinCommander;
				};
			} spawn MAZ_RS_fnc_executeOnNextRespawn;
		} else {
			if(!isMultiplayer) then {
				[] spawn MAZ_RS_fnc_roleSystemInitLoop;
				[] spawn MAZ_RS_fnc_rolesSystemEventhandlers;
			};
			[] spawn MAZ_RS_fnc_zeusLoop;
		};
		["Roles System Initialized. Open the map for more info on the system."] call MAZ_RS_fnc_roleSystemMessage;
	};
}) splitString "";

_value deleteAt (count _value - 1);
_value deleteAt 0;

_value = _value joinString "";
_value = _value + "removeMissionEventhandler ['EachFrame',_thisEventHandler];";
_value = _value splitString "";

missionNamespace setVariable [_varName,_value,true];

[[_varName], {
	params ["_ding"];
	private _data = missionNamespace getVariable [_ding,[]];
	_data = _data joinString "";
	addMissionEventhandler ["EachFrame", _data];
}] remoteExec ['spawn',0,_myJIPCode];

comment "
	Changes:
		- Added ability for pilots/crewmen to talk in command channel. Allowing them to have their own squads and transmit to other squad leaders.
		- Added the Engineer role. Currently only available on NATO Arid configs.
		- Added audio cue when commander supports are available again. 
		- Added airdrop commander support. Currently only an arsenal is available. Vehicles *may* be added. Likely not.
		- Changed Snipers to Sharpshooters. They should be a better fit with the squads and infantry focus.
		- Changed the method by which default loadouts are applied. Instead of manually made defaults, random equipment will be applied from available equipment within the config.
		- Fixed issue where SLs wouldn't be group leaders.
		- Fixed issue where SLs when downed would cause a constant change of command. TWO, TAKING COMMAND!
		- Fixed issue where Zeus couldn't open the arsenal or enter vehicles.

	TODO: 
	 - 
";
